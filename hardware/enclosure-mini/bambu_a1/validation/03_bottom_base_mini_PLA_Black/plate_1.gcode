; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 22m 20s; total estimated time: 28m 54s
; total layer number: 76
; total filament length [mm] : 1897.99
; total filament volume [cm^3] : 4565.19
; total filament weight [g] : 5.66
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 15.20
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
; enable_support = 1
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
; print_settings_id = AirGap Mini v3 03_bottom_base_mini A1 0.4
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
    G1 E10 F94.2699
    M983 F1.57117 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P5 R27
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
M73 P20 R22
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
M73 P21 R22
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
    G29 A1 X105 Y105.007 I46 J45.9857
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
; layer num/total_layer_count: 1/76
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15
G1 X137.609 Y136.732 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S500
G1 X137.857 Y136.651 E.00972
G3 X138.597 Y136.521 I1.101 J4.081 E.02802
M73 P22 R22
G3 X139.109 Y136.508 I.346 J3.614 E.01909
G3 X137.456 Y136.781 I-.151 J4.224 E.9263
G1 X137.552 Y136.75 E.00375
M204 S6000
G1 X137.75 Y137.166 F42000
G1 F1500
M204 S500
G1 X137.979 Y137.092 E.00895
G3 X138.634 Y136.976 I.979 J3.64 E.02479
G3 X139.096 Y136.965 I.312 J3.261 E.01722
G3 X137.621 Y137.208 I-.137 J3.767 E.82616
G1 X137.693 Y137.184 E.00282
M204 S6000
G1 X137.891 Y137.6 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X138.101 Y137.533 E.0082
G3 X138.67 Y137.432 I.858 J3.2 E.02157
G3 X139.082 Y137.422 I.279 J2.908 E.01535
G3 X137.786 Y137.634 I-.123 J3.31 E.72601
G1 X137.834 Y137.619 E.00188
; WIPE_START
G1 X138.101 Y137.533 E-.10649
G1 X138.423 Y137.463 E-.12544
G1 X138.67 Y137.432 E-.09453
G1 X139.082 Y137.422 E-.1565
G1 X139.33 Y137.44 E-.09455
G1 X139.656 Y137.494 E-.12556
G1 X139.801 Y137.533 E-.05693
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.171 Y137.336 Z.6 F42000
G1 X119.01 Y136.997 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X119.159 Y137.31 E.01293
G3 X114.905 Y134.745 I-3.893 J1.646 E.79134
G3 X115.417 Y134.732 I.346 J3.614 E.01909
G3 X118.979 Y136.937 I-.151 J4.224 E.16323
G1 X118.982 Y136.944 E.00029
M204 S6000
G1 X118.599 Y137.196 F42000
G1 F1500
M204 S500
G1 X118.739 Y137.49 E.01214
G3 X114.941 Y135.201 I-3.473 J1.466 E.70563
G3 X115.403 Y135.189 I.312 J3.261 E.01722
G3 X118.571 Y137.143 I-.137 J3.767 E.14496
M204 S6000
G1 X118.188 Y137.394 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X118.319 Y137.67 E.01136
G3 X114.978 Y135.657 I-3.052 J1.287 E.61991
G3 X115.389 Y135.646 I.279 J2.908 E.01535
G3 X118.158 Y137.342 I-.123 J3.31 E.12639
; WIPE_START
G1 X118.319 Y137.67 E-.13865
G1 X118.434 Y137.981 E-.12623
G1 X118.515 Y138.301 E-.12551
G1 X118.565 Y138.628 E-.12569
G1 X118.581 Y138.96 E-.12619
G1 X118.566 Y139.27 E-.11773
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X116.898 Y131.822 Z.6 F42000
G1 X113.797 Y117.971 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X113.675 Y117.816 E.00734
G3 X116.93 Y111.038 I3.366 J-2.554 E.34518
G3 X117.351 Y111.048 I.087 J5.307 E.01571
G3 X113.946 Y118.138 I-.31 J4.214 E.61223
G1 X113.837 Y118.016 E.00612
M204 S6000
G1 X114.147 Y117.678 F42000
G1 F1500
M204 S500
M73 P23 R22
G1 X114.04 Y117.54 E.00651
G3 X116.943 Y111.495 I3.002 J-2.278 E.30793
G3 X117.319 Y111.504 I.075 J4.732 E.01401
G3 X114.281 Y117.827 I-.278 J3.758 E.54597
G1 X114.187 Y117.723 E.00524
M204 S6000
G1 X114.497 Y117.385 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X114.404 Y117.264 E.00568
G3 X116.957 Y111.952 I2.638 J-2.002 E.27067
G3 X117.288 Y111.96 I.064 J4.156 E.01231
G3 X114.616 Y117.517 I-.246 J3.302 E.47971
G1 X114.537 Y117.429 E.00438
; WIPE_START
G1 X114.404 Y117.264 E-.08073
G1 X114.214 Y116.996 E-.12483
G1 X114.055 Y116.706 E-.12563
G1 X113.927 Y116.402 E-.12552
G1 X113.829 Y116.084 E-.1263
G1 X113.763 Y115.758 E-.12624
G1 X113.754 Y115.625 E-.05076
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.352 Y114.9 Z.6 F42000
G1 X138.921 Y113.224 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G1 X138.995 Y113.187 E.00309
G3 X140.373 Y112.828 I1.739 J3.852 E.05329
G3 X140.885 Y112.816 I.346 J3.615 E.01909
G3 X138.614 Y113.383 I-.151 J4.224 E.90079
G1 X138.867 Y113.251 E.01062
M204 S6000
G1 X139.13 Y113.63 F42000
G1 F1500
M204 S500
G1 X139.183 Y113.604 E.00221
G3 X140.409 Y113.284 I1.551 J3.436 E.04743
G3 X140.871 Y113.273 I.312 J3.262 E.01722
G3 X138.845 Y113.778 I-.137 J3.767 E.80337
G1 X139.076 Y113.657 E.00972
M204 S6000
G1 X139.339 Y114.036 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G1 X139.371 Y114.021 E.00133
G3 X140.446 Y113.74 I1.363 J3.019 E.04157
G3 X140.857 Y113.73 I.279 J2.908 E.01535
G3 X139.075 Y114.172 I-.123 J3.31 E.70595
G1 X139.285 Y114.064 E.00881
; WIPE_START
G1 X139.371 Y114.021 E-.0364
G1 X139.678 Y113.899 E-.12558
G1 X139.995 Y113.81 E-.12491
G1 X140.446 Y113.74 E-.17343
G1 X140.857 Y113.73 E-.15651
G1 X141.105 Y113.748 E-.09454
G1 X141.231 Y113.77 E-.04863
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X144.164 Y120.817 Z.6 F42000
G1 X148.914 Y132.228 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1500
M204 S500
G3 X115.539 Y110.667 I-20.922 J-4.226 E3.09262
G3 X128.823 Y106.674 I12.447 J17.311 E.52626
G3 X148.926 Y132.169 I-.831 J21.328 E1.37402
M204 S6000
G1 X149.362 Y132.318 F42000
G1 F1500
M204 S500
G3 X115.272 Y110.296 I-21.37 J-4.317 E3.15882
G3 X128.846 Y106.217 I12.713 J17.682 E.53772
G3 X149.373 Y132.26 I-.854 J21.785 E1.40329
M204 S6000
G1 X149.81 Y132.409 F42000
; FEATURE: Outer wall
G1 F1500
M204 S500
G3 X114.12 Y110.595 I-21.818 J-4.407 E3.18373
G3 X128.869 Y105.761 I13.892 J17.468 E.59044
G3 X149.822 Y132.35 I-.877 J22.241 E1.4326
; WIPE_START
G1 X149.573 Y133.493 E-.44448
G1 X149.349 Y134.292 E-.31552
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


G1 X143.585 Y141.897 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.273865
G1 F1500
M204 S500
G1 X143.168 Y142.521 E.01414
; LINE_WIDTH: 0.250212
G1 X143.092 Y142.63 E.00224
; LINE_WIDTH: 0.205033
G1 X143.016 Y142.742 E.00179
; LINE_WIDTH: 0.168492
G1 X142.962 Y142.817 E.00095
; LINE_WIDTH: 0.140571
G1 X142.906 Y142.894 E.00076
; LINE_WIDTH: 0.114707
G1 X142.828 Y142.996 E.00075
M204 S6000
M73 P23 R21
G1 X142.882 Y142.979 F42000
; LINE_WIDTH: 0.35048
G1 F1500
M204 S500
M73 P24 R21
G1 X143.569 Y141.889 E.03229
M204 S6000
G1 X143.548 Y141.879 F42000
; LINE_WIDTH: 0.476214
G1 F1500
M204 S500
G1 X143.414 Y142.124 E.00987
; LINE_WIDTH: 0.448646
G1 X143.189 Y142.509 E.01476
; LINE_WIDTH: 0.42288
G1 X142.964 Y142.895 E.01382
; WIPE_START
G1 X143.189 Y142.509 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.606 Y144.905 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.122496
G1 F1500
M204 S500
G1 X140.481 Y144.972 E.00092
; LINE_WIDTH: 0.162032
G1 X140.354 Y145.04 E.0014
; LINE_WIDTH: 0.19669
G1 X140.279 Y145.079 E.00105
; LINE_WIDTH: 0.227261
G1 X140.182 Y145.125 E.00162
; LINE_WIDTH: 0.267207
G1 X140.061 Y145.179 E.00243
; LINE_WIDTH: 0.334917
G3 X139.414 Y145.461 I-16.342 J-36.558 E.01678
M204 S6000
G1 X139.411 Y145.45 F42000
; LINE_WIDTH: 0.417228
G1 F1500
M204 S500
G1 X140.521 Y145.001 E.03651
; WIPE_START
G1 X139.411 Y145.45 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X140.973 Y137.979 Z.6 F42000
G1 X145.446 Y116.593 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.44863
G1 F1500
M204 S500
G1 X145.046 Y115.542 E.03716
M204 S6000
G1 X144.954 Y115.415 F42000
; LINE_WIDTH: 0.369966
G1 F1500
M204 S500
G1 X145.465 Y116.587 E.03406
M204 S6000
G1 X145.477 Y116.583 F42000
; LINE_WIDTH: 0.296473
G1 F1500
M204 S500
G1 X145.187 Y115.955 E.01431
; LINE_WIDTH: 0.271047
G1 X145.128 Y115.831 E.00254
; LINE_WIDTH: 0.222105
G1 X145.069 Y115.707 E.002
; LINE_WIDTH: 0.196757
G1 X145.067 Y115.702 E.00007
; LINE_WIDTH: 0.176272
G1 X145.004 Y115.582 E.00148
; LINE_WIDTH: 0.136883
G1 X144.941 Y115.459 E.00105
; LINE_WIDTH: 0.110015
G1 X144.899 Y115.383 E.00048
; WIPE_START
G1 X144.941 Y115.459 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.989 Y113.168 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118109
G1 F1500
M204 S500
G1 X142.893 Y113.095 E.00074
; LINE_WIDTH: 0.149063
G1 X142.794 Y113.019 E.00108
; LINE_WIDTH: 0.188698
G1 X142.687 Y112.942 E.00157
; LINE_WIDTH: 0.234726
G1 X142.566 Y112.861 E.00228
; LINE_WIDTH: 0.272732
G1 X142.491 Y112.813 E.00167
; LINE_WIDTH: 0.318382
G2 X141.887 Y112.431 I-15.908 J24.547 E.01604
M204 S6000
G1 X141.882 Y112.443 F42000
; LINE_WIDTH: 0.393982
G1 F1500
M204 S500
G1 X142.926 Y113.067 E.03481
; WIPE_START
G1 X141.882 Y112.443 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X141.553 Y112.636 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50241
G1 F2400
M204 S500
G1 X139.216 Y110.299 E.12373
G2 X137.682 Y109.415 I-9.622 J14.917 E.06635
G1 X140.693 Y112.426 E.15945
G2 X140.092 Y112.475 I.019 J3.979 E.02261
G1 X136.435 Y108.818 E.19362
G2 X135.343 Y108.376 I-4.982 J10.733 E.04413
G1 X139.55 Y112.583 E.22277
G2 X139.058 Y112.741 I1.333 J4.992 E.01935
G1 X134.35 Y108.032 E.24933
G2 X133.429 Y107.762 I-3.168 J9.075 E.03594
G1 X138.611 Y112.943 E.27435
G2 X138.2 Y113.182 I.872 J1.968 E.01783
G1 X132.565 Y107.547 E.29841
G1 X131.75 Y107.382 E.03111
G1 X137.824 Y113.456 E.32165
G2 X137.485 Y113.767 I4.172 J4.912 E.01723
G1 X130.978 Y107.26 E.34454
G2 X130.235 Y107.167 I-1.305 J7.398 E.02805
G1 X137.172 Y114.104 E.36732
G1 X136.895 Y114.476 E.01739
G1 X129.516 Y107.097 E.39073
G1 X128.832 Y107.063 E.02564
G1 X136.656 Y114.887 E.41427
G2 X136.447 Y115.328 I2.101 J1.26 E.01831
G1 X128.174 Y107.055 E.43808
G1 X127.517 Y107.048 E.0246
G1 X136.289 Y115.82 E.46445
G2 X136.173 Y116.354 I2.351 J.787 E.02052
G1 X126.896 Y107.077 E.49125
G2 X126.284 Y107.115 I.075 J6.142 E.02296
G1 X136.119 Y116.949 E.52076
G2 X136.156 Y117.636 I7.026 J-.036 E.02577
G1 X125.694 Y107.174 E.55401
G2 X125.116 Y107.246 I.432 J5.829 E.02182
G1 X136.709 Y118.839 E.61389
; WIPE_START
G1 X135.295 Y117.425 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X142.916 Y117.006 Z.6 F42000
G1 X145.15 Y116.883 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X146.578 Y118.311 E.07559
G3 X147.179 Y119.562 I-12.219 J6.641 E.05198
G1 X145.302 Y117.685 E.09939
G3 X145.193 Y118.225 I-2.759 J-.278 E.02068
G1 X147.627 Y120.66 E.12893
G3 X147.971 Y121.653 I-9.78 J3.937 E.03936
G1 X145.033 Y118.716 E.15555
G3 X144.832 Y119.164 I-2.34 J-.784 E.01843
G1 X148.238 Y122.57 E.18038
G3 X148.448 Y123.43 I-8.506 J2.532 E.03315
G1 X144.592 Y119.574 E.20418
G3 X144.318 Y119.95 I-2.014 J-1.183 E.01744
G1 X148.613 Y124.245 E.22746
G3 X148.743 Y125.025 I-7.74 J1.69 E.02961
G1 X144.01 Y120.292 E.25062
G3 X143.67 Y120.602 I-1.72 J-1.544 E.01725
G1 X148.836 Y125.768 E.27354
G3 X148.897 Y126.478 I-7.083 J.961 E.0267
G1 X143.298 Y120.879 E.29648
G3 X142.891 Y121.122 I-1.416 J-1.908 E.01777
G1 X148.938 Y127.169 E.32019
G1 X148.955 Y127.836 E.02496
G1 X142.448 Y121.329 E.34455
G3 X141.962 Y121.493 I-4.337 J-12.011 E.01919
G1 X148.947 Y128.478 E.36985
G3 X148.928 Y129.109 I-6.329 J.126 E.02364
G1 X141.424 Y121.604 E.39736
G3 X140.823 Y121.654 I-.553 J-3.042 E.02259
G1 X148.883 Y129.713 E.42676
G3 X148.827 Y130.307 I-5.976 J-.26 E.02235
G1 X140.141 Y121.621 E.45993
G3 X139.3 Y121.431 I.558 J-4.404 E.03233
G1 X148.755 Y130.885 E.50062
G3 X148.668 Y131.448 I-5.677 J-.59 E.02133
M73 P25 R21
G1 X124.551 Y107.331 E1.27702
G2 X124.002 Y107.432 I.739 J5.545 E.0209
G1 X148.57 Y132 E1.30091
G3 X148.456 Y132.535 I-5.421 J-.877 E.02051
G1 X123.462 Y107.541 E1.32348
G2 X122.939 Y107.668 I1.008 J5.311 E.02016
G1 X148.335 Y133.065 E1.34479
G3 X148.197 Y133.576 I-5.185 J-1.127 E.01985
G1 X122.421 Y107.8 E1.3649
G2 X121.92 Y107.949 I1.245 J5.092 E.01957
G1 X148.054 Y134.083 E1.38385
G3 X147.895 Y134.573 I-4.992 J-1.354 E.01931
G1 X121.423 Y108.102 E1.4017
G2 X120.943 Y108.272 I1.456 J4.896 E.01908
G1 X147.731 Y135.06 E1.41849
G3 X147.552 Y135.531 I-4.808 J-1.555 E.01887
G1 X120.467 Y108.445 E1.43425
G2 X120.004 Y108.633 I1.649 J4.725 E.01868
G1 X147.369 Y135.998 E1.44902
G3 X147.173 Y136.451 I-4.646 J-1.741 E.01851
G1 X119.547 Y108.825 E1.46284
G2 X119.102 Y109.03 I1.826 J4.564 E.01836
G1 X146.971 Y136.899 E1.47572
G3 X146.759 Y137.336 I-4.487 J-1.907 E.01822
G1 X118.663 Y109.241 E1.4877
G2 X118.233 Y109.461 I1.987 J4.414 E.01809
G1 X146.538 Y137.766 E1.4988
G3 X146.311 Y138.189 I-4.349 J-2.067 E.01797
G1 X117.813 Y109.69 E1.50905
G2 X117.397 Y109.925 I2.138 J4.273 E.01787
G1 X118.294 Y110.821 E.04746
G2 X117.497 Y110.674 I-1.557 J6.232 E.03033
G1 X116.844 Y110.021 E.03458
; WIPE_START
G1 X117.497 Y110.674 E-.3509
G1 X117.837 Y110.716 E-.12988
G1 X118.294 Y110.821 E-.17813
G1 X118.105 Y110.633 E-.10109
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.155 Y113.682 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X146.073 Y138.601 E1.31947
G3 X145.832 Y139.009 I-4.224 J-2.22 E.01777
G1 X121.638 Y114.815 E1.28112
G3 X121.651 Y115.478 I-4.401 J.422 E.02487
G1 X145.577 Y139.404 E1.2669
G1 X145.322 Y139.799 E.0176
G1 X121.587 Y116.064 E1.25681
G3 X121.461 Y116.587 I-2.678 J-.367 E.0202
G1 X145.051 Y140.177 E1.24911
G1 X144.779 Y140.555 E.01743
M73 P26 R21
G1 X143.243 Y139.019 E.08131
G2 X140.668 Y136.444 I-4.317 J1.742 E.14011
G1 X121.288 Y117.065 E1.02618
G3 X121.075 Y117.502 I-2.287 J-.845 E.01823
G1 X139.759 Y136.186 E.98935
G2 X139.046 Y136.122 I-.943 J6.517 E.02684
G1 X120.826 Y117.902 E.96477
G3 X120.542 Y118.268 I-1.97 J-1.231 E.01737
G1 X138.425 Y136.151 E.94691
G2 X137.874 Y136.25 I.281 J3.138 E.02098
G1 X120.226 Y118.602 E.9345
G3 X119.878 Y118.903 I-1.68 J-1.593 E.01728
G1 X137.374 Y136.399 E.92647
G2 X136.918 Y136.593 I.737 J2.372 E.01859
G1 X119.496 Y119.171 E.92253
G3 X119.079 Y119.404 I-1.37 J-1.963 E.01791
G1 X136.504 Y136.829 E.92269
G2 X136.121 Y137.096 I1.012 J1.857 E.01751
G1 X118.624 Y119.599 E.92652
G3 X118.126 Y119.75 I-1.007 J-2.409 E.01953
G1 X135.772 Y137.397 E.93442
G2 X135.456 Y137.731 I1.509 J1.747 E.01724
G1 X117.577 Y119.852 E.94671
G3 X116.959 Y119.883 I-.679 J-7.36 E.0232
G1 X135.173 Y138.097 E.96446
G2 X134.921 Y138.495 I5.428 J3.712 E.01764
G1 X115.968 Y119.542 E1.00357
; WIPE_START
G1 X117.382 Y120.956 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X112.671 Y114.952 Z.6 F42000
G1 X112.647 Y114.921 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X112.089 Y114.364 E.02951
G2 X111.793 Y114.718 I3.394 J3.141 E.01728
G1 X112.428 Y115.353 E.03363
G2 X112.499 Y116.073 I4.984 J-.122 E.02711
G1 X111.505 Y115.079 E.05261
G2 X111.221 Y115.445 I3.526 J3.03 E.01735
G1 X112.759 Y116.983 E.08144
G2 X115.323 Y119.547 I4.286 J-1.722 E.13953
G1 X134.709 Y138.933 E1.02649
G2 X134.539 Y139.412 I2.074 J1.006 E.0191
G1 X110.949 Y115.823 E1.24909
G2 X110.678 Y116.201 I3.727 J2.96 E.01744
G1 X134.413 Y139.937 E1.25682
G2 X134.349 Y140.523 I3.252 J.651 E.0221
G1 X110.423 Y116.596 E1.26695
G1 X110.168 Y116.991 E.0176
G1 X134.364 Y141.188 E1.28125
G2 X134.519 Y141.992 I5.256 J-.593 E.0307
G1 X109.776 Y117.249 E1.31019
; WIPE_START
G1 X111.19 Y118.663 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.574 Y122.846 Z.6 F42000
G1 X143.233 Y139.659 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X144.495 Y140.921 E.06684
G1 X144.206 Y141.282 E.01731
G1 X143.573 Y140.649 E.03357
G3 X143.543 Y141.269 I-6.016 J.024 E.02326
G1 X144.056 Y141.782 E.02717
; WIPE_START
G1 X143.543 Y141.269 E-.27573
G1 X143.573 Y140.649 E-.23597
G1 X144.035 Y141.111 E-.2483
; WIPE_END
M73 P27 R21
G1 E-.04 F1800
M204 S6000
G1 X139.155 Y145.979 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X138.502 Y145.326 E.03459
G3 X137.698 Y145.172 I.497 J-4.77 E.03068
G1 X138.603 Y146.076 E.04787
G3 X138.187 Y146.31 I-2.553 J-4.039 E.01787
G1 X109.689 Y117.812 E1.50904
G2 X109.461 Y118.234 I4.12 J2.489 E.01797
G1 X137.766 Y146.539 E1.4988
G3 X137.337 Y146.759 I-2.418 J-4.197 E.01809
G1 X109.241 Y118.664 E1.4877
G2 X109.029 Y119.101 I4.277 J2.346 E.01822
G1 X136.898 Y146.97 E1.47572
G3 X136.453 Y147.175 I-2.27 J-4.357 E.01836
G1 X108.827 Y119.549 E1.46283
G2 X108.631 Y120.003 I4.447 J2.193 E.01851
G1 X135.995 Y147.367 E1.44902
G3 X135.533 Y147.555 I-2.113 J-4.54 E.01868
G1 X108.447 Y120.469 E1.43424
G2 X108.269 Y120.94 I4.627 J2.025 E.01887
G1 X135.057 Y147.728 E1.41848
G3 X134.576 Y147.898 I-1.935 J-4.721 E.01908
G1 X108.105 Y121.427 E1.40169
G2 X107.946 Y121.917 I4.829 J1.843 E.01931
G1 X134.08 Y148.051 E1.38385
G3 X133.579 Y148.2 I-1.746 J-4.945 E.01957
G1 X107.803 Y122.424 E1.36489
G2 X107.665 Y122.936 I5.044 J1.637 E.01985
G1 X133.061 Y148.332 E1.34479
G3 X132.538 Y148.459 I-1.531 J-5.185 E.02016
G1 X107.544 Y123.465 E1.32348
G2 X107.43 Y124 I5.31 J1.413 E.02051
M73 P27 R20
G1 X131.997 Y148.568 E1.3009
G3 X131.449 Y148.669 I-1.285 J-5.435 E.0209
G1 X107.332 Y124.553 E1.27701
G2 X107.245 Y125.115 I5.593 J1.153 E.02133
G1 X116.706 Y134.576 E.50094
G2 X115.864 Y134.384 I-1.445 J4.408 E.03235
G1 X107.173 Y125.693 E.46023
G2 X107.117 Y126.287 I5.923 J.854 E.02236
G1 X115.172 Y134.341 E.42649
G2 X114.578 Y134.398 I.173 J4.99 E.02234
G1 X107.072 Y126.892 E.39746
G2 X107.053 Y127.523 I6.316 J.505 E.02364
G1 X114.04 Y134.51 E.36998
G2 X113.552 Y134.672 I.566 J2.523 E.01928
G1 X107.045 Y128.165 E.34456
G1 X107.062 Y128.831 E.02496
G1 X113.108 Y134.877 E.32013
G2 X112.701 Y135.12 I1.017 J2.162 E.01777
G1 X107.103 Y129.522 E.29643
G2 X107.164 Y130.232 I7.148 J-.251 E.02671
M73 P28 R20
G1 X112.329 Y135.397 E.27349
G2 X111.992 Y135.71 I1.398 J1.839 E.01724
G1 X107.257 Y130.975 E.25074
G2 X107.387 Y131.755 I7.886 J-.913 E.02961
G1 X111.681 Y136.05 E.22741
G2 X111.409 Y136.428 I1.979 J1.711 E.01746
G1 X107.552 Y132.57 E.20426
G2 X107.762 Y133.43 I8.713 J-1.672 E.03315
G1 X111.171 Y136.839 E.18051
G2 X110.966 Y137.283 I2.119 J1.247 E.01837
G1 X108.029 Y134.347 E.15549
G2 X108.373 Y135.34 I10.111 J-2.94 E.03937
G1 X110.81 Y137.778 E.12907
G2 X110.699 Y138.316 I2.373 J.77 E.02064
G1 X108.821 Y136.439 E.09944
G2 X109.422 Y137.689 I12.825 J-5.393 E.05198
G1 X110.855 Y139.122 E.07585
; WIPE_START
G1 X109.44 Y137.708 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X117.061 Y137.287 Z.6 F42000
G1 X119.294 Y137.164 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2400
M204 S500
G1 X130.884 Y148.754 E.61372
G3 X130.306 Y148.826 I-1.009 J-5.755 E.02182
G1 X119.841 Y138.361 E.55414
G3 X119.88 Y139.05 I-5.305 J.648 E.02586
G1 X129.715 Y148.885 E.52078
G3 X129.104 Y148.923 I-.687 J-6.105 E.02296
G1 X119.827 Y139.647 E.4912
G3 X119.714 Y140.183 I-2.738 J-.297 E.02057
G1 X128.483 Y148.952 E.46432
G1 X127.833 Y148.952 E.02433
G1 X119.552 Y140.671 E.43852
G3 X119.347 Y141.116 I-2.327 J-.801 E.01837
G1 X127.168 Y148.937 E.41413
G1 X126.484 Y148.903 E.02564
G1 X119.104 Y141.523 E.39075
G3 X118.827 Y141.896 I-2.004 J-1.2 E.01742
G1 X125.765 Y148.833 E.36733
G3 X125.022 Y148.74 I.562 J-7.49 E.02805
G1 X118.517 Y142.236 E.3444
G3 X118.175 Y142.543 I-1.705 J-1.556 E.01726
G1 X124.25 Y148.618 E.32166
G1 X123.435 Y148.453 E.03111
G1 X117.8 Y142.818 E.2984
G3 X117.39 Y143.058 I-1.404 J-1.923 E.01781
G1 X122.57 Y148.238 E.27429
G3 X121.65 Y147.968 I2.249 J-9.349 E.03594
G1 X116.944 Y143.261 E.2492
G3 X116.452 Y143.42 I-1.035 J-2.377 E.01937
G1 X120.657 Y147.624 E.22264
G3 X119.565 Y147.182 I3.889 J-11.173 E.04413
G1 X115.91 Y143.527 E.19353
G3 X115.305 Y143.572 I-.532 J-3.068 E.02275
G1 X118.318 Y146.585 E.15954
G3 X116.783 Y145.7 I8.088 J-15.802 E.06635
G1 X114.444 Y143.361 E.12386
M204 S6000
G1 X114.115 Y143.556 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.409649
G1 F1500
M204 S500
G1 X113.775 Y143.353 E.01184
; LINE_WIDTH: 0.390134
G1 X113.699 Y143.306 E.00252
; LINE_WIDTH: 0.355812
G1 X113.623 Y143.259 E.00227
; LINE_WIDTH: 0.320485
G1 X113.543 Y143.21 E.00213
; LINE_WIDTH: 0.287011
G1 X113.469 Y143.161 E.00176
; LINE_WIDTH: 0.255347
G1 X113.39 Y143.111 E.00162
; LINE_WIDTH: 0.225293
G1 X113.313 Y143.058 E.00139
; LINE_WIDTH: 0.196126
G1 X113.242 Y143.007 E.0011
; LINE_WIDTH: 0.161428
G1 X113.129 Y142.922 E.00137
; LINE_WIDTH: 0.122421
G1 X113.015 Y142.837 E.00092
; WIPE_START
G1 X113.129 Y142.922 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X110.943 Y140.442 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.473649
G1 F1500
M204 S500
G3 X110.559 Y139.408 I33.261 J-12.944 E.03875
M204 S6000
G1 X110.542 Y139.413 F42000
; LINE_WIDTH: 0.394861
G1 F1500
M204 S500
G2 X111.044 Y140.583 I54.868 J-22.881 E.03653
M204 S6000
G1 X111.103 Y140.619 F42000
; LINE_WIDTH: 0.11491
G1 F1500
M204 S500
G1 X111.039 Y140.504 E.00077
; LINE_WIDTH: 0.14098
G1 X110.997 Y140.421 E.00074
; LINE_WIDTH: 0.169103
G1 X110.953 Y140.336 E.00098
; LINE_WIDTH: 0.206378
G1 X110.894 Y140.214 E.00181
; LINE_WIDTH: 0.27302
G3 X110.52 Y139.419 I23.284 J-11.437 E.01646
; WIPE_START
G1 X110.894 Y140.214 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X111.486 Y132.604 Z.6 F42000
G1 X113.001 Y113.141 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.448852
G1 F1500
M204 S500
G1 X112.449 Y114.12 E.03718
M204 S6000
G1 X112.43 Y114.111 F42000
; LINE_WIDTH: 0.36324
G1 F1500
M204 S500
G3 X112.755 Y113.599 I16.554 J10.146 E.01581
; LINE_WIDTH: 0.312564
G1 X112.803 Y113.525 E.00195
; LINE_WIDTH: 0.278286
G1 X112.852 Y113.451 E.0017
; LINE_WIDTH: 0.244158
G1 X112.906 Y113.37 E.0016
; LINE_WIDTH: 0.211117
G1 X112.959 Y113.293 E.00127
; LINE_WIDTH: 0.175161
G1 X113.039 Y113.183 E.00147
; LINE_WIDTH: 0.136465
G1 X113.117 Y113.076 E.00101
; LINE_WIDTH: 0.110111
G1 X113.17 Y113.005 E.00048
; WIPE_START
G1 X113.117 Y113.076 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X115.389 Y111.1 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.118137
G1 F1500
M204 S500
G1 X115.494 Y111.041 E.00074
; LINE_WIDTH: 0.148582
G1 X115.6 Y110.983 E.00104
; LINE_WIDTH: 0.187895
G1 X115.721 Y110.922 E.0016
; LINE_WIDTH: 0.234039
G1 X115.849 Y110.861 E.00221
; LINE_WIDTH: 0.272045
G1 X115.934 Y110.822 E.00174
; LINE_WIDTH: 0.303637
G1 X116.015 Y110.786 E.00189
; LINE_WIDTH: 0.320387
G1 X116.588 Y110.536 E.01413
M204 S6000
G1 X116.591 Y110.548 F42000
; LINE_WIDTH: 0.393903
G1 F1500
M204 S500
G1 X115.465 Y111.009 E.03481
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X116.591 Y110.548 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/76
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S183.6
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.6 I-.951 J.76 P1  F42000
G1 X137.812 Y137.113 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.113 Y137.029 E.01037
G3 X138.486 Y136.963 I.846 J3.704 E.01256
G1 X138.864 Y136.935 E.01258
G3 X137.748 Y137.132 I.095 J3.798 E.75409
G1 X137.754 Y137.13 E.00021
M204 S10000
G1 X137.922 Y137.505 F42000
G1 F5400
M204 S6000
G1 X138.204 Y137.426 E.00969
G3 X138.536 Y137.367 I.755 J3.307 E.01122
G1 X138.874 Y137.342 E.01123
G3 X137.865 Y137.522 I.085 J3.391 E.67277
M204 S250
G1 X138.028 Y137.883 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.291 Y137.809 E.00837
G3 X138.585 Y137.757 I.668 J2.924 E.00919
G1 X138.884 Y137.735 E.0092
G3 X137.971 Y137.901 I.075 J2.998 E.55037
; WIPE_START
M204 S6000
G1 X138.291 Y137.809 E-.12634
G1 X138.585 Y137.757 E-.11361
G1 X138.884 Y137.735 E-.11372
G1 X139.183 Y137.742 E-.11364
G1 X139.479 Y137.779 E-.11365
G1 X139.771 Y137.846 E-.11372
G1 X139.934 Y137.901 E-.06532
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.307 Y137.612 Z.8 F42000
G1 X118.575 Y137.094 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X118.603 Y137.142 E.00184
G3 X114.793 Y135.188 I-3.337 J1.815 E.64089
G1 X115.171 Y135.159 E.01258
G3 X118.405 Y136.818 I.094 J3.798 E.12572
G1 X118.543 Y137.043 E.00874
M204 S10000
G1 X118.227 Y137.306 F42000
G1 F5400
M204 S6000
G1 X118.245 Y137.336 E.00117
G3 X114.844 Y135.592 I-2.979 J1.621 E.57216
G1 X115.182 Y135.567 E.01123
G3 X118.069 Y137.048 I.084 J3.39 E.11224
G1 X118.196 Y137.255 E.00806
M204 S250
M73 P29 R20
G1 X117.893 Y137.51 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.9 Y137.524 E.00048
G3 X114.893 Y135.981 I-2.634 J1.433 E.46867
G1 X115.191 Y135.959 E.00919
G3 X117.744 Y137.269 I.074 J2.998 E.09194
G1 X117.861 Y137.459 E.00686
; WIPE_START
M204 S6000
G1 X117.9 Y137.524 E-.02873
G1 X118.031 Y137.793 E-.11359
G1 X118.133 Y138.074 E-.11366
G1 X118.207 Y138.364 E-.11366
G1 X118.251 Y138.66 E-.1136
G1 X118.266 Y138.937 E-.10551
G1 X118.252 Y139.257 E-.12163
G1 X118.232 Y139.386 E-.04961
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.809 Y131.887 Z.8 F42000
G1 X114.113 Y117.681 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.014 Y117.56 E.00519
G3 X116.569 Y111.495 I3.028 J-2.295 E.26396
G1 X116.947 Y111.467 E.01258
G3 X114.257 Y117.849 I.095 J3.798 E.50274
G1 X114.152 Y117.726 E.00535
M204 S10000
G1 X114.425 Y117.419 F42000
G1 F5400
M204 S6000
G1 X114.339 Y117.314 E.00451
G3 X116.619 Y111.9 I2.703 J-2.049 E.23566
G1 X116.957 Y111.874 E.01123
G3 X114.556 Y117.572 I.085 J3.391 E.44882
G1 X114.464 Y117.465 E.00469
M204 S250
G1 X114.725 Y117.167 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X114.652 Y117.076 E.00358
G3 X116.668 Y112.289 I2.39 J-1.812 E.19302
G1 X116.967 Y112.267 E.0092
G3 X114.844 Y117.305 I.075 J2.998 E.36759
G1 X114.764 Y117.213 E.00375
; WIPE_START
M204 S6000
G1 X114.652 Y117.076 E-.06704
G1 X114.481 Y116.831 E-.11367
G1 X114.338 Y116.568 E-.11368
G1 X114.222 Y116.292 E-.11366
G1 X114.134 Y116.006 E-.11364
G1 X114.075 Y115.713 E-.11385
G1 X114.044 Y115.394 E-.12169
G1 X114.044 Y115.387 E-.00277
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.657 Y114.834 Z.8 F42000
G1 X139.214 Y113.561 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.523 Y113.439 E.01104
G3 X140.261 Y113.271 I1.21 J3.601 E.02514
G1 X140.639 Y113.242 E.01258
G3 X139.158 Y113.583 I.094 J3.797 E.74097
M204 S10000
G1 X139.362 Y113.94 F42000
G1 F5400
M204 S6000
G1 X139.653 Y113.825 E.01037
G3 X140.312 Y113.675 I1.08 J3.215 E.02245
G1 X140.649 Y113.65 E.01123
G3 X139.307 Y113.963 I.084 J3.39 E.66082
M204 S250
G1 X139.506 Y114.305 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X139.778 Y114.198 E.009
G3 X140.361 Y114.065 I.955 J2.843 E.01839
G1 X140.659 Y114.042 E.00919
G3 X139.451 Y114.329 I.074 J2.998 E.54057
; WIPE_START
M204 S6000
G1 X139.778 Y114.198 E-.13408
G1 X140.066 Y114.117 E-.11366
G1 X140.361 Y114.065 E-.11365
G1 X140.659 Y114.042 E-.11369
G1 X140.958 Y114.05 E-.11363
G1 X141.255 Y114.087 E-.11367
G1 X141.403 Y114.121 E-.05763
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.464 Y121.112 Z.8 F42000
G1 X149.372 Y132.32 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X116.164 Y109.675 I-21.38 J-4.319 E2.85067
G3 X128.795 Y106.204 I11.852 J18.416 E.44126
G3 X149.384 Y132.262 I-.803 J21.797 E1.25213
M204 S10000
G1 X149.771 Y132.401 F42000
G1 F5400
M204 S6000
G3 X115.944 Y109.333 I-21.779 J-4.4 E2.90388
G3 X128.815 Y105.798 I12.073 J18.759 E.44967
G3 X149.782 Y132.342 I-.823 J22.204 E1.27534
M204 S250
G1 X150.166 Y132.481 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1680
M204 S5000
G1 X150.156 Y132.479 E.00032
G3 X114.799 Y109.639 I-22.163 J-4.477 E2.70272
G3 X128.835 Y105.406 I13.186 J18.341 E.45876
G3 X150.351 Y131.369 I-.842 J22.595 E1.16931
G1 X150.176 Y132.422 E.03279
M106 S183.6
; WIPE_START
M204 S6000
G1 X150.156 Y132.479 E-.02309
G1 X149.915 Y133.58 E-.42833
G1 X149.695 Y134.362 E-.30859
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


G1 X141.285 Y145.09 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42306
G1 F9470.195
M204 S6000
G2 X143.747 Y142.611 I-98.268 J-100.068 E.10825
G2 X145.772 Y140.066 I-15.647 J-14.523 E.10085
G1 X140.087 Y145.75 E.24903
G3 X138.643 Y146.657 I-14.357 J-21.268 E.05283
G1 X146.646 Y138.654 E.3506
G2 X147.262 Y137.5 I-11.248 J-6.748 E.04053
G1 X142.943 Y141.819 E.18922
G2 X143.071 Y141.154 I-3.264 J-.973 E.02103
G1 X147.724 Y136.5 E.20386
G2 X148.087 Y135.6 I-8.833 J-4.079 E.03006
G1 X143.086 Y140.601 E.21907
G2 X143.04 Y140.109 I-2.482 J-.016 E.01532
G1 X148.38 Y134.769 E.23395
G2 X148.624 Y133.988 I-7.696 J-2.83 E.02536
G1 X142.947 Y139.665 E.2487
G2 X142.815 Y139.259 I-2.095 J.454 E.01324
G1 X148.83 Y133.244 E.26349
G1 X148.989 Y132.547 E.02213
G1 X142.651 Y138.885 E.27766
G2 X142.457 Y138.541 I-1.815 J.795 E.01225
G1 X149.123 Y131.876 E.29198
G1 X149.238 Y131.224 E.02053
G1 X142.237 Y138.224 E.30668
G2 X141.991 Y137.932 I-1.584 J1.084 E.01184
G1 X149.316 Y130.608 E.32087
G2 X149.385 Y130.001 I-6.037 J-.995 E.01892
G1 X141.721 Y137.665 E.33574
G2 X141.426 Y137.423 I-1.359 J1.353 E.01185
G1 X149.429 Y129.42 E.35058
G2 X149.46 Y128.851 I-5.686 J-.602 E.01767
G1 X141.105 Y137.206 E.36602
G2 X140.757 Y137.016 I-1.123 J1.644 E.01229
G1 X149.474 Y128.299 E.38185
G2 X149.475 Y127.76 I-5.401 J-.284 E.01671
G1 X140.38 Y136.856 E.39846
G2 X139.969 Y136.729 I-.837 J1.991 E.01335
G1 X149.462 Y127.236 E.4159
G2 X149.439 Y126.721 I-5.168 J-.024 E.01596
G1 X139.518 Y136.643 E.43464
G2 X139.018 Y136.605 I-.438 J2.481 E.01556
G1 X149.402 Y126.221 E.4549
G2 X149.358 Y125.727 I-4.964 J.191 E.01536
G1 X138.454 Y136.631 E.47767
G2 X137.768 Y136.78 I.849 J5.585 E.02175
G1 X149.298 Y125.25 E.5051
G2 X149.237 Y124.773 I-4.834 J.377 E.01489
G1 X124.778 Y149.232 E1.07148
G1 X125.245 Y149.302 E.01464
G1 X135.005 Y139.543 E.42754
G2 X134.86 Y140.225 I4.152 J1.24 E.02165
G1 X125.73 Y149.355 E.39994
G1 X126.219 Y149.404 E.01521
G1 X134.829 Y140.794 E.37719
G2 X134.865 Y141.295 I2.606 J.066 E.01561
G1 X126.723 Y149.438 E.3567
G1 X127.235 Y149.463 E.01588
G1 X134.951 Y141.747 E.33802
G2 X135.078 Y142.158 I24.418 J-7.33 E.01331
G1 X127.761 Y149.475 E.32054
G1 X128.298 Y149.475 E.01665
G1 X135.238 Y142.535 E.304
G1 X135.427 Y142.883 E.01228
G1 X128.852 Y149.459 E.28806
G1 X129.418 Y149.431 E.01755
G1 X135.645 Y143.204 E.2728
G2 X135.888 Y143.498 I1.594 J-1.067 E.01185
G1 X130.005 Y149.381 E.25773
M73 P30 R20
G1 X130.602 Y149.322 E.0186
G1 X136.155 Y143.768 E.24328
G2 X136.448 Y144.013 I1.412 J-1.394 E.01184
G1 X131.231 Y149.23 E.22856
G2 X131.872 Y149.126 I-.722 J-6.484 E.02014
G1 X136.766 Y144.233 E.21436
G2 X137.11 Y144.426 I1.14 J-1.628 E.01225
G1 X132.546 Y148.99 E.19993
G2 X133.251 Y148.823 I-1.32 J-7.135 E.02245
G1 X137.483 Y144.591 E.1854
G2 X137.891 Y144.721 I.842 J-1.931 E.01327
G1 X133.984 Y148.627 E.17112
G1 X134.762 Y148.387 E.0252
G1 X138.333 Y144.816 E.15644
G2 X138.824 Y144.863 I.47 J-2.354 E.01531
G1 X135.6 Y148.087 E.14124
G2 X136.505 Y147.72 I-3.229 J-9.258 E.03025
G1 X139.382 Y144.842 E.12607
G2 X140.04 Y144.722 I-.271 J-3.349 E.02073
G1 X137.14 Y147.622 E.12703
M204 S10000
G1 X124.165 Y149.307 F42000
G1 F9470.195
M204 S6000
G1 X149.156 Y124.316 E1.0948
G1 X149.076 Y123.859 E.01438
G1 X123.862 Y149.073 E1.10455
G1 X123.415 Y148.982 E.01413
G1 X148.981 Y123.416 E1.11998
G1 X148.881 Y122.979 E.01391
G1 X122.978 Y148.881 E1.13473
G1 X122.55 Y148.772 E.0137
G1 X148.775 Y122.548 E1.14884
G1 X148.656 Y122.128 E.0135
G1 X122.124 Y148.661 E1.16233
G1 X121.713 Y148.534 E.01332
G1 X148.538 Y121.708 E1.17516
G2 X148.405 Y121.304 I-4.122 J1.138 E.01319
G1 X121.302 Y148.407 E1.1873
G3 X120.902 Y148.27 I1.178 J-4.074 E.01311
G1 X148.27 Y120.902 E1.19891
G2 X148.128 Y120.506 I-4.047 J1.221 E.01304
G1 X120.508 Y148.126 E1.20998
G3 X120.115 Y147.981 I1.26 J-4.016 E.01297
G1 X147.977 Y120.12 E1.22054
G1 X147.825 Y119.734 E.01285
G1 X119.737 Y147.822 E1.23047
G1 X119.359 Y147.662 E.01271
G1 X147.661 Y119.36 E1.23985
G1 X147.494 Y118.99 E.01259
G1 X118.988 Y147.495 E1.24877
G1 X118.625 Y147.321 E.01248
G1 X147.324 Y118.622 E1.25723
G1 X147.142 Y118.266 E.01237
G1 X118.263 Y147.146 E1.26515
G3 X117.912 Y146.959 I1.693 J-3.596 E.01231
G1 X146.96 Y117.911 E1.27253
G2 X146.771 Y117.562 I-3.588 J1.723 E.01229
G1 X117.564 Y146.769 E1.27948
G3 X117.218 Y146.578 I1.737 J-3.551 E.01226
G1 X146.574 Y117.222 E1.28603
G1 X146.377 Y116.881 E.01219
G1 X144.481 Y118.777 E.08308
G2 X144.761 Y117.96 I-3.898 J-1.792 E.02682
G1 X146.17 Y116.551 E.06172
G1 X145.959 Y116.224 E.01204
G1 X144.853 Y117.33 E.04842
G2 X144.856 Y116.79 I-2.791 J-.282 E.01675
G1 X145.748 Y115.898 E.03908
G1 X145.523 Y115.585 E.01193
G1 X144.799 Y116.309 E.03171
G2 X144.697 Y115.873 I-2.227 J.291 E.01388
G1 X145.298 Y115.272 E.02633
G2 X145.07 Y114.962 I-3.219 J2.13 E.01192
G1 X144.558 Y115.475 E.02245
G2 X144.386 Y115.109 I-1.912 J.674 E.01254
G1 X144.832 Y114.663 E.01952
G1 X144.593 Y114.364 E.01185
G1 X144.186 Y114.772 E.01785
G2 X143.959 Y114.461 I-1.667 J.978 E.01194
G1 X144.349 Y114.071 E.01708
G1 X144.097 Y113.785 E.0118
G1 X143.707 Y114.175 E.01708
G2 X143.43 Y113.914 I-1.443 J1.252 E.0118
G1 X143.845 Y113.5 E.01816
G2 X143.585 Y113.222 I-2.91 J2.47 E.01179
G1 X143.129 Y113.678 E.01997
G2 X142.802 Y113.468 I-1.215 J1.529 E.01207
G1 X143.319 Y112.95 E.02267
G1 X143.054 Y112.678 E.01178
G1 X142.447 Y113.285 E.02658
G2 X142.062 Y113.132 I-.956 J1.848 E.01285
G1 X142.778 Y112.417 E.03135
G1 X142.499 Y112.158 E.01178
G1 X141.643 Y113.014 E.0375
G2 X141.182 Y112.937 I-.616 J2.261 E.01448
G1 X142.22 Y111.899 E.04545
G2 X141.928 Y111.653 I-2.554 J2.74 E.01182
G1 X140.671 Y112.91 E.05504
G2 X140.079 Y112.964 I.181 J5.201 E.01843
G1 X141.635 Y111.408 E.06817
G2 X141.341 Y111.165 I-2.58 J2.83 E.01183
G1 X139.051 Y113.455 E.10031
; WIPE_START
G1 X140.465 Y112.041 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.146 Y115.36 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F9470.195
M204 S6000
G1 X117.199 Y135.307 E.87383
G3 X117.537 Y135.506 I-.826 J1.789 E.01218
G1 X136.653 Y116.391 E.83741
G2 X136.605 Y116.976 I5.273 J.728 E.01821
G1 X117.85 Y135.732 E.82163
G1 X118.135 Y135.984 E.0118
G1 X136.629 Y117.49 E.81018
G2 X136.705 Y117.951 I2.345 J-.15 E.01451
G1 X118.396 Y136.261 E.8021
G3 X118.631 Y136.563 I-1.39 J1.327 E.01188
G1 X136.823 Y118.371 E.79694
G2 X136.976 Y118.756 I2 J-.571 E.01285
G1 X118.841 Y136.89 E.79443
G3 X119.024 Y137.245 I-1.683 J1.091 E.01239
G1 X137.159 Y119.11 E.79445
G2 X137.37 Y119.437 I1.737 J-.89 E.01207
G1 X119.177 Y137.63 E.797
G3 X119.295 Y138.049 I-2.03 J.801 E.01351
G1 X137.607 Y119.738 E.80217
G2 X137.868 Y120.014 I1.511 J-1.17 E.0118
G1 X119.374 Y138.508 E.81019
G3 X119.395 Y139.024 I-5.489 J.489 E.016
G1 X138.154 Y120.265 E.82178
G2 X138.466 Y120.492 I1.287 J-1.443 E.01194
G1 X119.343 Y139.614 E.83772
G3 X119.158 Y140.336 I-4.114 J-.666 E.02311
G1 X138.803 Y120.692 E.86059
G2 X139.169 Y120.863 I1.04 J-1.745 E.01255
G1 X114.966 Y145.067 E1.06031
G1 X115.271 Y145.299 E.01189
G1 X139.567 Y121.003 E1.06435
G2 X140.002 Y121.105 I.73 J-2.123 E.01387
G1 X115.583 Y145.525 E1.06977
G1 X115.902 Y145.743 E.01198
G1 X140.482 Y121.163 E1.07678
G2 X141.017 Y121.165 I.279 J-2.732 E.01659
G1 X116.222 Y145.961 E1.08621
G2 X116.55 Y146.17 I2.263 J-3.187 E.01207
G1 X141.653 Y121.067 E1.09971
G2 X142.47 Y120.788 I-1.044 J-4.391 E.02676
G1 X116.761 Y146.498 E1.12626
M204 S10000
G1 X114.539 Y144.956 F42000
G1 F9470.195
M204 S6000
G1 X116.645 Y142.85 E.09228
G3 X115.921 Y143.036 I-1.393 J-3.913 E.02319
G1 X114.365 Y144.592 E.06818
G1 X114.073 Y144.347 E.01182
G1 X115.332 Y143.087 E.05519
G3 X114.817 Y143.065 I-.146 J-2.644 E.01601
G1 X113.781 Y144.101 E.04539
G1 X113.502 Y143.843 E.01178
G1 X114.354 Y142.99 E.03734
G3 X113.935 Y142.872 I5.407 J-19.895 E.01349
G1 X113.223 Y143.584 E.0312
G3 X112.947 Y143.322 I2.474 J-2.889 E.01178
G1 X113.55 Y142.719 E.02644
G3 X113.195 Y142.536 I.727 J-1.852 E.01239
G1 X112.681 Y143.05 E.02252
G1 X112.416 Y142.778 E.01178
G1 X112.869 Y142.325 E.01984
G3 X112.568 Y142.088 I1.033 J-1.618 E.01188
G1 X112.156 Y142.501 E.01808
G1 X111.904 Y142.215 E.0118
G1 X112.293 Y141.826 E.01705
G3 X112.042 Y141.539 I1.304 J-1.395 E.01182
G1 X111.652 Y141.93 E.0171
G3 X111.407 Y141.636 I2.815 J-2.593 E.01183
G1 X111.816 Y141.228 E.0179
G3 X111.616 Y140.89 I1.588 J-1.166 E.01218
G1 X111.169 Y141.337 E.01961
G1 X110.93 Y141.038 E.01185
G1 X111.445 Y140.523 E.02255
G3 X111.305 Y140.126 I1.917 J-.897 E.01308
G1 X110.702 Y140.728 E.02641
G1 X110.478 Y140.416 E.01193
G1 X111.202 Y139.691 E.03173
G3 X111.142 Y139.214 I2.359 J-.538 E.01494
G1 X110.253 Y140.103 E.03896
G1 X110.042 Y139.776 E.01204
G1 X111.145 Y138.673 E.04834
G3 X111.239 Y138.041 I3.202 J.154 E.01981
G1 X109.831 Y139.45 E.0617
G3 X109.623 Y139.12 I3.207 J-2.247 E.01208
G1 X111.515 Y137.228 E.08286
G3 X113.539 Y135.204 I3.73 J1.706 E.09058
G1 X139.117 Y109.626 E1.1205
G1 X139.45 Y109.83 E.01211
G1 X114.354 Y134.927 E1.09942
G3 X114.979 Y134.839 I.748 J3.077 E.01957
G1 X139.779 Y110.039 E1.08643
G1 X140.098 Y110.257 E.01198
G1 X115.521 Y134.835 E1.07666
G3 X116.002 Y134.891 I-.741 J8.35 E.015
G1 X140.418 Y110.475 E1.0696
G3 X140.729 Y110.702 I-2.113 J3.23 E.01193
G1 X116.435 Y134.996 E1.06425
G3 X116.833 Y135.136 I-.502 J2.059 E.01308
G1 X141.156 Y110.812 E1.06554
M204 S10000
G1 X130.904 Y106.549 F42000
G1 F9470.195
M204 S6000
G1 X121 Y116.453 E.43389
G2 X121.14 Y115.775 I-3.318 J-1.041 E.02148
G1 X130.271 Y106.645 E.39997
G1 X129.782 Y106.596 E.01521
G1 X121.173 Y115.205 E.37715
G2 X121.133 Y114.708 I-2.509 J-.051 E.0155
G1 X129.278 Y106.562 E.35683
M73 P30 R19
G2 X128.765 Y106.537 I-.562 J6.3 E.01591
G1 X121.045 Y114.257 E.33819
G2 X120.919 Y113.847 I-2.116 J.427 E.01334
G1 X128.233 Y106.532 E.32041
G1 X127.7 Y106.527 E.0165
G1 X120.759 Y113.469 E.30408
G2 X120.569 Y113.121 I-1.831 J.771 E.0123
G1 X127.149 Y106.541 E.28824
G1 X126.583 Y106.569 E.01755
G1 X120.353 Y112.8 E.27294
G2 X120.111 Y112.504 I-1.6 J1.062 E.01185
G1 X125.996 Y106.618 E.25782
G1 X125.399 Y106.678 E.0186
G1 X119.844 Y112.233 E.24333
G2 X119.553 Y111.987 I-1.378 J1.334 E.01184
G1 X124.77 Y106.769 E.22855
G2 X124.129 Y106.873 I.722 J6.487 E.02014
G1 X119.236 Y111.766 E.21432
G2 X118.893 Y111.572 I-1.143 J1.624 E.01224
G1 X123.455 Y107.01 E.19985
G2 X122.75 Y107.177 I1.32 J7.135 E.02244
G1 X118.52 Y111.407 E.18532
G2 X118.114 Y111.276 I-.857 J1.957 E.01325
G1 X122.017 Y107.372 E.171
G1 X121.24 Y107.612 E.0252
G1 X117.668 Y111.183 E.15645
G2 X117.175 Y111.139 I-.468 J2.444 E.01537
G1 X120.401 Y107.913 E.14134
G2 X119.497 Y108.28 I3.225 J9.248 E.03025
G1 X116.619 Y111.157 E.12606
G2 X115.957 Y111.282 I.487 J4.405 E.0209
G1 X118.498 Y108.741 E.11134
G2 X117.359 Y109.342 I5.457 J11.713 E.03992
G1 X109.353 Y117.349 E.35076
G2 X108.737 Y118.502 I11.24 J6.742 E.04051
G1 X113.054 Y114.185 E.18913
G2 X112.934 Y114.842 I4.513 J1.162 E.02072
M73 P31 R19
G1 X108.275 Y119.502 E.20412
G2 X107.913 Y120.401 I8.83 J4.077 E.03006
G1 X112.912 Y115.402 E.21901
G2 X112.956 Y115.895 I10.299 J-.676 E.01534
G1 X107.619 Y121.232 E.2338
G2 X107.376 Y122.014 I7.696 J2.829 E.02536
G1 X113.051 Y116.338 E.24863
G2 X113.184 Y116.743 I2.09 J-.457 E.01323
G1 X107.17 Y122.757 E.26346
G1 X107.011 Y123.454 E.02213
G1 X113.348 Y117.117 E.27762
G2 X113.541 Y117.461 I1.821 J-.794 E.01225
G1 X106.877 Y124.125 E.29192
G1 X106.762 Y124.778 E.02053
G1 X113.76 Y117.779 E.30658
G1 X114.006 Y118.072 E.01182
G1 X106.684 Y125.393 E.32075
G2 X106.615 Y126 I6.039 J.994 E.01892
G1 X114.277 Y118.338 E.33565
G2 X114.575 Y118.578 I1.319 J-1.333 E.01186
G1 X106.571 Y126.581 E.35061
G2 X106.54 Y127.15 I5.682 J.601 E.01767
G1 X114.895 Y118.795 E.36603
G2 X115.244 Y118.983 I1.087 J-1.598 E.01231
G1 X106.526 Y127.702 E.38193
G2 X106.525 Y128.241 I5.396 J.284 E.0167
G1 X115.621 Y119.144 E.3985
G2 X116.032 Y119.271 I.854 J-2.033 E.01333
G1 X106.538 Y128.765 E.41591
G2 X106.561 Y129.28 I5.163 J.024 E.01596
G1 X116.481 Y119.36 E.43456
G2 X116.98 Y119.398 I.985 J-9.471 E.0155
G1 X106.598 Y129.78 E.45478
G2 X106.642 Y130.274 I4.965 J-.191 E.01536
G1 X117.552 Y119.363 E.47795
G2 X118.231 Y119.222 I-.583 J-4.504 E.0215
G1 X106.702 Y130.751 E.50506
G2 X106.763 Y131.228 I4.831 J-.377 E.01489
G1 X131.223 Y106.768 E1.07151
G1 X131.69 Y106.839 E.01464
G1 X106.844 Y131.685 E1.08844
G1 X106.924 Y132.142 E.01438
G1 X132.139 Y106.927 E1.10458
G1 X132.586 Y107.018 E.01413
G1 X107.019 Y132.584 E1.12001
G1 X107.119 Y133.022 E.01391
G1 X133.022 Y107.119 E1.13476
G1 X133.451 Y107.228 E.0137
G1 X107.226 Y133.453 E1.14886
G1 X107.344 Y133.873 E.0135
G1 X133.877 Y107.34 E1.16235
G1 X134.288 Y107.466 E.01332
G1 X107.462 Y134.292 E1.17518
G2 X107.595 Y134.696 I4.114 J-1.136 E.01319
G1 X134.699 Y107.593 E1.18733
G3 X135.099 Y107.731 I-1.178 J4.073 E.01311
G1 X107.731 Y135.099 E1.19893
G2 X107.872 Y135.495 I4.047 J-1.222 E.01304
G1 X135.493 Y107.874 E1.20999
G3 X135.885 Y108.019 I-1.251 J3.989 E.01297
G1 X108.024 Y135.881 E1.22055
G1 X108.175 Y136.267 E.01285
G1 X136.263 Y108.179 E1.23048
G1 X136.642 Y108.338 E.01271
G1 X108.339 Y136.641 E1.23987
G1 X108.506 Y137.011 E.01259
G1 X137.012 Y108.505 E1.24878
G1 X137.375 Y108.68 E.01248
G1 X108.676 Y137.379 E1.25725
G1 X108.858 Y137.734 E.01237
G1 X137.738 Y108.854 E1.26516
G3 X138.089 Y109.041 I-1.695 J3.6 E.01231
G1 X109.04 Y138.09 E1.27254
G2 X109.23 Y138.438 I3.584 J-1.722 E.01229
G1 X138.437 Y109.231 E1.27949
G3 X138.783 Y109.422 I-1.738 J3.554 E.01226
G1 X109.302 Y138.903 E1.29148
M204 S10000
G1 X109.656 Y116.507 F42000
G1 F9470.195
M204 S6000
G1 X115.916 Y110.248 E.27422
G2 X113.044 Y112.582 I11.481 J17.059 E.11481
G1 X110.906 Y114.72 E.09363
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9470.195
G1 X112.321 Y113.306 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/76
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z.8 I-.832 J.888 P1  F42000
G1 X137.912 Y137.293 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.159 Y137.229 E.00845
G3 X138.665 Y137.15 I.808 J3.506 E.01703
G3 X140.601 Y137.53 I.307 J3.552 E.06629
G3 X137.814 Y137.327 I-1.635 J3.206 E.65476
G1 X137.855 Y137.312 E.00146
M204 S10000
G1 X138.022 Y137.685 F42000
G1 F5400
M204 S6000
G1 X138.249 Y137.626 E.00777
G3 X138.696 Y137.556 I.718 J3.108 E.01501
G3 X140.125 Y137.762 I.261 J3.252 E.04829
G3 X137.943 Y137.713 I-1.158 J2.972 E.591
G1 X137.966 Y137.705 E.00079
M204 S250
G1 X138.129 Y138.062 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.336 Y138.008 E.00659
G3 X138.725 Y137.947 I.632 J2.726 E.01211
G3 X139.717 Y138.038 I.249 J2.717 E.03077
G3 X138.068 Y138.085 I-.749 J2.697 E.48888
G1 X138.072 Y138.083 E.00013
; WIPE_START
M204 S6000
G1 X138.336 Y138.008 E-.10426
G1 X138.725 Y137.947 E-.1496
G1 X139.168 Y137.941 E-.16815
G1 X139.445 Y137.976 E-.1061
G1 X139.717 Y138.038 E-.10608
G1 X139.982 Y138.127 E-.1061
G1 X140.029 Y138.149 E-.0197
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.805 Y130.519 Z1 F42000
G1 X139.314 Y113.736 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.589 Y113.635 E.00973
G3 X140.441 Y113.458 I1.153 J3.409 E.02893
G3 X142.377 Y113.838 I.307 J3.553 E.0663
G3 X139.256 Y113.766 I-1.635 J3.205 E.64286
G1 X139.261 Y113.764 E.00018
M204 S10000
G1 X139.463 Y114.115 F42000
G1 F5400
M204 S6000
G1 X139.719 Y114.021 E.00905
G3 X140.471 Y113.863 I1.024 J3.021 E.02556
G3 X141.9 Y114.069 I.261 J3.252 E.0483
G3 X139.41 Y114.143 I-1.158 J2.972 E.57997
M204 S250
G1 X139.606 Y114.48 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X139.844 Y114.392 E.00779
G3 X140.501 Y114.254 I.9 J2.65 E.02067
G3 X141.492 Y114.346 I.249 J2.718 E.03077
G3 X139.554 Y114.509 I-.749 J2.697 E.47927
; WIPE_START
M204 S6000
G1 X139.844 Y114.392 E-.11874
G1 X140.111 Y114.312 E-.10599
G1 X140.501 Y114.254 E-.14974
G1 X140.943 Y114.249 E-.16815
G1 X141.22 Y114.284 E-.10611
G1 X141.492 Y114.346 E-.10606
G1 X141.505 Y114.35 E-.00521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.924 Y115.236 Z1 F42000
G1 X114.251 Y117.534 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.177 Y117.435 E.00409
G3 X116.748 Y111.682 I2.872 J-2.168 E.25467
G3 X118.684 Y112.062 I.308 J3.552 E.06629
G3 X114.407 Y117.71 I-1.635 J3.206 E.41711
G1 X114.291 Y117.579 E.00582
M204 S10000
G1 X114.563 Y117.273 F42000
G1 F5400
M204 S6000
G1 X114.504 Y117.188 E.00342
G3 X116.779 Y112.088 I2.546 J-1.922 E.22562
G3 X118.208 Y112.294 I.261 J3.252 E.0483
G3 X114.708 Y117.432 I-1.158 J2.972 E.3804
G1 X114.603 Y117.317 E.00515
M204 S250
G1 X114.863 Y117.021 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X114.816 Y116.952 E.00256
G3 X116.808 Y112.479 I2.235 J-1.685 E.18316
G3 X117.8 Y112.57 I.249 J2.717 E.03077
G3 X114.995 Y117.165 I-.749 J2.697 E.31783
G1 X114.903 Y117.065 E.00417
; WIPE_START
M204 S6000
G1 X114.816 Y116.952 E-.05438
G1 X114.652 Y116.726 E-.10592
G1 X114.519 Y116.481 E-.10611
G1 X114.41 Y116.224 E-.10606
G1 X114.328 Y115.957 E-.10608
G1 X114.273 Y115.683 E-.10608
G1 X114.245 Y115.406 E-.1061
G1 X114.245 Y115.223 E-.06926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.661 Y122.723 Z1 F42000
G1 X118.391 Y137.175 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X118.431 Y137.235 E.00238
G3 X114.973 Y135.374 I-3.158 J1.725 E.61217
G3 X116.909 Y135.755 I.307 J3.553 E.0663
G3 X118.244 Y136.928 I-1.635 J3.205 E.05959
G1 X118.36 Y137.124 E.00754
M204 S10000
G1 X118.043 Y137.388 F42000
G1 F5400
M204 S6000
G1 X118.074 Y137.429 E.00171
G3 X115.004 Y135.78 I-2.799 J1.53 E.54257
G3 X116.433 Y135.986 I.261 J3.252 E.0483
G3 X117.907 Y137.158 I-1.158 J2.972 E.06342
G1 X118.013 Y137.336 E.00687
M204 S250
G1 X117.709 Y137.592 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.731 Y137.616 E.001
G3 X115.033 Y136.171 I-2.455 J1.343 E.44082
G3 X116.024 Y136.263 I.249 J2.718 E.03077
G3 X117.584 Y137.378 I-.749 J2.697 E.06014
G1 X117.679 Y137.54 E.00577
; WIPE_START
M204 S6000
G1 X117.731 Y137.616 E-.03498
G1 X117.846 Y137.871 E-.10627
G1 X117.942 Y138.133 E-.10606
G1 X118.011 Y138.404 E-.10607
G1 X118.052 Y138.68 E-.10608
G1 X118.066 Y138.958 E-.1061
G1 X118.052 Y139.237 E-.1061
G1 X118.018 Y139.467 E-.08834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.462 Y137.782 Z1 F42000
G1 X149.487 Y132.344 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X118.98 Y108.009 I-21.495 J-4.343 E2.97484
G3 X128.713 Y106.083 I9.006 J19.957 E.33203
G3 X149.499 Y132.285 I-.721 J21.917 E1.26177
M204 S10000
G1 X149.885 Y132.424 F42000
G1 F5400
M204 S6000
G3 X118.812 Y107.638 I-21.893 J-4.424 E3.02997
G3 X128.734 Y105.677 I9.172 J20.326 E.33843
G3 X149.897 Y132.365 I-.742 J22.323 E1.28496
M204 S250
G1 X150.281 Y132.502 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.27 Y132.502 E.00033
G3 X117.63 Y107.772 I-22.278 J-4.501 E2.82117
G3 X128.753 Y105.285 I10.397 J20.383 E.35397
G3 X150.467 Y131.386 I-.761 J22.716 E1.17805
G1 X150.291 Y132.442 E.0329
; WIPE_START
M204 S6000
G1 X150.27 Y132.502 E-.02396
G1 X150.029 Y133.609 E-.43056
G1 X149.811 Y134.383 E-.30548
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
G1 X149.578 Y130.824 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42179
G1 F9501.939
M204 S6000
G1 X139.542 Y120.788 E.4382
G2 X140.233 Y120.943 I1.121 J-3.375 E.0219
M73 P32 R19
G1 X149.486 Y130.196 E.404
G2 X149.525 Y129.7 I-4.94 J-.643 E.01538
G1 X140.796 Y120.97 E.38113
G2 X141.293 Y120.931 I.054 J-2.502 E.01541
G1 X149.562 Y129.201 E.36107
G2 X149.582 Y128.685 I-5.16 J-.45 E.01597
G1 X141.739 Y120.842 E.3424
G2 X142.145 Y120.712 I-.446 J-2.092 E.01318
G1 X149.595 Y128.162 E.32525
G2 X149.589 Y127.621 I-5.42 J-.216 E.01672
G1 X142.516 Y120.548 E.3088
G2 X142.857 Y120.353 I-.805 J-1.801 E.01214
G1 X149.575 Y127.071 E.29333
G2 X149.54 Y126.5 I-5.745 J.07 E.01768
G1 X143.17 Y120.13 E.27814
G2 X143.456 Y119.88 I-1.103 J-1.553 E.01174
G1 X149.497 Y125.921 E.26375
G2 X149.424 Y125.312 I-6.128 J.423 E.01893
G1 X143.716 Y119.604 E.24921
G2 X143.95 Y119.303 I-1.39 J-1.321 E.01181
G1 X149.342 Y124.695 E.23542
G1 X149.228 Y124.044 E.02039
G1 X144.158 Y118.974 E.22136
G2 X144.336 Y118.617 I-1.695 J-1.071 E.01235
G1 X149.091 Y123.372 E.20759
G1 X148.932 Y122.677 E.02199
G1 X144.483 Y118.228 E.19425
G2 X144.593 Y117.802 I-9.725 J-2.726 E.01359
G1 X148.723 Y121.932 E.18033
G2 X148.477 Y121.15 I-7.962 J2.079 E.02534
G1 X144.654 Y117.327 E.16691
G2 X144.656 Y116.793 I-2.663 J-.276 E.01651
G1 X148.18 Y120.318 E.1539
G2 X147.816 Y119.417 I-9.209 J3.206 E.03001
G1 X144.566 Y116.168 E.14188
G2 X144.277 Y115.343 I-3.92 J.91 E.02704
G1 X147.714 Y118.78 E.15008
M204 S10000
G1 X145.174 Y114.632 F42000
G1 F9501.939
M204 S6000
G1 X143.063 Y112.522 E.09215
G2 X140.171 Y110.165 I-14.57 J14.929 E.11535
G1 X145.858 Y115.853 E.24833
G3 X146.734 Y117.264 I-13.703 J9.477 E.05129
G1 X138.724 Y109.254 E.34973
G2 X137.584 Y108.65 I-6.619 J11.118 E.03982
G1 X142.431 Y113.496 E.21159
G2 X141.609 Y113.211 I-1.718 J3.62 E.02689
G1 X136.585 Y108.187 E.21936
G2 X135.68 Y107.818 I-4.158 J8.894 E.0302
G1 X140.98 Y113.117 E.23139
G2 X140.449 Y113.123 I-.238 J2.654 E.0164
G1 X134.841 Y107.514 E.24487
G1 X134.066 Y107.275 E.02503
G1 X139.979 Y113.188 E.25815
G2 X139.548 Y113.293 I.189 J1.702 E.01372
G1 X133.332 Y107.077 E.27143
G2 X132.626 Y106.906 I-2.058 J6.985 E.02243
G1 X139.158 Y113.439 E.28522
G2 X138.801 Y113.617 I.712 J1.877 E.01236
G1 X131.954 Y106.771 E.29893
G2 X131.311 Y106.663 I-1.399 J6.396 E.02014
G1 X138.472 Y113.825 E.31268
G2 X138.171 Y114.06 I1.022 J1.62 E.01181
G1 X130.68 Y106.568 E.32707
G1 X130.085 Y106.509 E.01847
G1 X137.896 Y114.32 E.34106
G2 X137.647 Y114.607 I1.308 J1.387 E.01175
G1 X129.496 Y106.456 E.3559
G1 X128.932 Y106.428 E.01743
G1 X137.425 Y114.92 E.3708
G2 X137.23 Y115.261 I1.607 J1.146 E.01214
G1 X128.383 Y106.414 E.38626
G1 X127.843 Y106.411 E.01665
G1 X137.064 Y115.631 E.40259
G2 X136.932 Y116.035 I1.951 J.86 E.01314
G1 X127.312 Y106.415 E.42002
G1 X126.802 Y106.441 E.01578
G1 X136.841 Y116.48 E.43832
G2 X136.805 Y116.979 I2.474 J.432 E.01548
G1 X126.296 Y106.471 E.45882
G1 X125.809 Y106.519 E.01511
G1 X136.836 Y117.546 E.48143
G2 X136.991 Y118.237 I4.191 J-.579 E.02189
G1 X125.322 Y106.568 E.50947
G2 X124.856 Y106.638 I.488 J4.847 E.01455
G1 X149.366 Y131.148 E1.07015
G3 X149.289 Y131.607 I-4.639 J-.546 E.01436
G1 X124.39 Y106.708 E1.0871
G2 X123.939 Y106.792 I.618 J4.575 E.01419
G1 X149.209 Y132.062 E1.10332
G3 X149.118 Y132.508 I-4.506 J-.682 E.01404
G1 X123.493 Y106.882 E1.11883
G2 X123.053 Y106.979 I.743 J4.449 E.0139
G1 X149.019 Y132.944 E1.13368
G3 X148.917 Y133.378 I-4.381 J-.797 E.01377
G1 X122.626 Y107.087 E1.14789
G1 X122.199 Y107.196 E.01361
G1 X148.799 Y133.796 E1.1614
G1 X148.682 Y134.214 E.01341
G1 X121.788 Y107.32 E1.17422
G1 X121.378 Y107.447 E.01323
G1 X148.553 Y134.622 E1.18649
G1 X148.419 Y135.023 E.01306
G1 X120.975 Y107.579 E1.19822
G1 X120.582 Y107.722 E.01291
G1 X148.282 Y135.422 E1.20942
G1 X148.131 Y135.807 E.01276
G1 X120.189 Y107.865 E1.21998
G2 X119.809 Y108.021 I1.371 J3.892 E.01269
G1 X147.98 Y136.192 E1.22998
G3 X147.822 Y136.569 I-3.857 J-1.4 E.01264
G1 X119.432 Y108.18 E1.23952
G2 X119.058 Y108.341 I1.428 J3.829 E.01259
G1 X147.655 Y136.938 E1.24859
G1 X147.488 Y137.308 E.01251
G1 X118.696 Y108.515 E1.25711
G1 X118.335 Y108.689 E.01239
G1 X147.309 Y137.664 E1.26508
G1 X147.128 Y138.019 E.01229
G1 X117.98 Y108.871 E1.27263
G1 X117.633 Y109.06 E.01219
G1 X146.945 Y138.371 E1.27977
G1 X146.748 Y138.711 E.01211
G1 X117.286 Y109.248 E1.28635
G2 X116.95 Y109.448 I1.831 J3.465 E.01208
G1 X146.552 Y139.05 E1.29247
G3 X146.351 Y139.385 I-3.451 J-1.851 E.01206
G1 X120.632 Y113.666 E1.12292
G3 X120.891 Y114.461 I-4.094 J1.774 E.02585
G1 X146.141 Y139.71 E1.10242
G1 X145.93 Y140.036 E.01196
G1 X120.966 Y115.071 E1.08998
G3 X120.959 Y115.6 I-2.642 J.23 E.01636
G1 X145.712 Y140.353 E1.08074
G1 X145.488 Y140.665 E.01185
G1 X120.892 Y116.069 E1.07389
G3 X120.777 Y116.49 I-2.161 J-.36 E.0135
G1 X145.264 Y140.977 E1.0691
G3 X145.029 Y141.277 I-3.141 J-2.209 E.01179
G1 X120.627 Y116.876 E1.0654
G3 X120.446 Y117.23 I-1.861 J-.729 E.01231
G1 X140.232 Y137.017 E.8639
G2 X139.525 Y136.845 I-1.305 J3.829 E.02252
G1 X120.236 Y117.556 E.84217
G3 X119.999 Y117.855 I-1.612 J-1.033 E.0118
G1 X138.947 Y136.803 E.82729
G2 X138.452 Y136.844 I-.007 J2.926 E.01535
G1 X119.736 Y118.128 E.81715
G3 X119.448 Y118.375 I-1.38 J-1.32 E.01175
G1 X137.995 Y136.923 E.80981
G2 X137.587 Y137.051 I.435 J2.103 E.01322
G1 X119.132 Y118.596 E.80577
G3 X118.789 Y118.788 I-1.133 J-1.62 E.01217
G1 X137.214 Y137.213 E.80444
G2 X136.87 Y137.405 I.791 J1.816 E.01217
G1 X118.415 Y118.95 E.80579
M73 P33 R19
G3 X118.005 Y119.076 I-.837 J-1.982 E.01325
G1 X136.554 Y137.625 E.80987
G2 X136.265 Y137.872 I1.089 J1.57 E.01175
G1 X117.555 Y119.162 E.81692
G3 X117.054 Y119.196 I-.423 J-2.49 E.01554
G1 X136.002 Y138.145 E.82731
G2 X135.765 Y138.443 I1.372 J1.334 E.01179
G1 X116.478 Y119.157 E.84207
G3 X115.776 Y118.99 I.871 J-5.248 E.02228
G1 X135.555 Y138.769 E.86354
G2 X135.373 Y139.123 I1.679 J1.082 E.01231
G1 X110.972 Y114.722 E1.0654
G1 X111.21 Y114.424 E.01177
G1 X113.321 Y116.535 E.0922
G3 X113.149 Y115.827 I4.784 J-1.539 E.02252
G1 X111.447 Y114.126 E.07429
G3 X111.698 Y113.841 I2.966 J2.357 E.01173
G1 X113.112 Y115.255 E.06175
G3 X113.144 Y114.751 I2.533 J-.092 E.01561
G1 X111.949 Y113.556 E.05218
G3 X112.202 Y113.273 I2.962 J2.395 E.01172
G1 X113.228 Y114.299 E.0448
G3 X113.357 Y113.892 I13.156 J3.925 E.01319
G1 X112.467 Y113.002 E.03886
G1 X112.731 Y112.731 E.0117
G1 X113.519 Y113.519 E.0344
G3 X113.712 Y113.175 I1.812 J.79 E.01217
G1 X113 Y112.463 E.03108
G1 X113.278 Y112.205 E.01171
G1 X113.932 Y112.859 E.02856
G3 X114.178 Y112.57 I1.568 J1.086 E.01175
G1 X113.556 Y111.948 E.02718
G3 X113.84 Y111.696 I2.668 J2.722 E.01172
G1 X114.451 Y112.307 E.02668
G3 X114.749 Y112.069 I1.319 J1.351 E.01179
G1 X114.131 Y111.451 E.02699
G1 X114.422 Y111.207 E.01174
G1 X115.075 Y111.859 E.02848
G3 X115.429 Y111.678 I1.079 J1.675 E.01232
G1 X114.722 Y110.971 E.03088
G1 X115.027 Y110.74 E.01181
G1 X115.816 Y111.529 E.03446
G3 X116.242 Y111.419 I.635 J1.576 E.01361
G1 X115.332 Y110.509 E.03974
G3 X115.648 Y110.289 I2.355 J3.046 E.01189
G1 X116.712 Y111.351 E.04641
G3 X117.235 Y111.34 I.312 J2.607 E.01618
G1 X115.966 Y110.072 E.0554
G1 X116.285 Y109.855 E.01191
G1 X117.851 Y111.421 E.06837
G3 X118.645 Y111.679 I-.827 J3.892 E.02583
G1 X116.494 Y109.528 E.09392
M204 S10000
G1 X110.615 Y114.901 F42000
G1 F9501.939
M204 S6000
G1 X135.224 Y139.51 E1.07445
G2 X135.112 Y139.933 I2.061 J.774 E.01354
G1 X110.513 Y115.334 E1.07401
G1 X110.289 Y115.646 E.01185
G1 X135.043 Y140.4 E1.0808
G2 X135.029 Y140.922 I2.605 J.33 E.01615
G1 X110.07 Y115.963 E1.08974
G1 X109.86 Y116.289 E.01196
G1 X135.113 Y141.542 E1.10259
G2 X135.369 Y142.333 I3.919 J-.829 E.02572
G1 X109.65 Y116.614 E1.12292
G2 X109.448 Y116.949 I3.244 J2.183 E.01206
G1 X139.051 Y146.551 E1.29248
G1 X139.383 Y146.348 E.01203
G1 X137.365 Y144.329 E.08814
G2 X138.153 Y144.582 I1.771 J-4.174 E.02558
G1 X139.716 Y146.145 E.06825
G1 X140.035 Y145.928 E.01191
G1 X138.767 Y144.66 E.05536
G2 X139.294 Y144.652 I.184 J-5.275 E.0163
G1 X140.353 Y145.711 E.04623
G2 X140.669 Y145.491 I-2.047 J-3.276 E.01189
G1 X139.76 Y144.581 E.0397
G2 X140.182 Y144.468 I-.355 J-2.167 E.01352
G1 X140.974 Y145.26 E.03457
G1 X141.279 Y145.029 E.01181
G1 X140.568 Y144.318 E.03102
G2 X140.923 Y144.137 I-.729 J-1.862 E.01231
G1 X141.578 Y144.793 E.02863
G1 X141.87 Y144.548 E.01174
G1 X141.248 Y143.927 E.02713
G2 X141.547 Y143.69 I-1.035 J-1.611 E.01179
G1 X142.161 Y144.304 E.02681
G2 X142.445 Y144.052 I-2.385 J-2.975 E.01172
G1 X141.82 Y143.427 E.02729
G2 X142.067 Y143.138 I-1.321 J-1.379 E.01175
G1 X142.723 Y143.794 E.02865
G1 X143.001 Y143.536 E.01171
G1 X142.287 Y142.822 E.03117
G2 X142.479 Y142.479 I-1.62 J-1.132 E.01217
G1 X143.269 Y143.269 E.03449
G1 X143.534 Y142.997 E.0117
G1 X142.641 Y142.104 E.03899
G2 X142.768 Y141.696 I-1.978 J-.84 E.01323
G1 X143.798 Y142.726 E.04499
G2 X144.051 Y142.443 I-2.713 J-2.681 E.01172
G1 X142.855 Y141.247 E.05225
G2 X142.892 Y140.748 I-2.477 J-.435 E.01546
G1 X144.303 Y142.159 E.06159
G2 X144.553 Y141.874 I-2.739 J-2.662 E.01173
G1 X142.847 Y140.167 E.07452
G2 X142.676 Y139.461 I-3.988 J.587 E.02245
G1 X144.912 Y141.696 E.0976
M204 S10000
G1 X138.84 Y146.876 F42000
G1 F9501.939
M204 S6000
G1 X109.252 Y117.288 E1.29183
G1 X109.056 Y117.628 E.01211
G1 X138.368 Y146.94 E1.27979
G1 X138.021 Y147.129 E.01219
G1 X108.873 Y117.981 E1.27265
G1 X108.691 Y118.335 E.01229
G1 X137.666 Y147.31 E1.2651
G1 X137.305 Y147.484 E.01239
G1 X108.512 Y118.691 E1.25713
G1 X108.345 Y119.061 E.01251
G1 X136.943 Y147.658 E1.24861
G3 X136.569 Y147.82 I-1.802 J-3.666 E.01259
G1 X108.179 Y119.43 E1.23954
G2 X108.02 Y119.807 I3.698 J1.777 E.01264
G1 X136.192 Y147.979 E1.23001
G3 X135.812 Y148.134 I-1.752 J-3.736 E.01269
G1 X107.869 Y120.192 E1.22001
G1 X107.718 Y120.577 E.01276
G1 X135.419 Y148.277 E1.20945
G1 X135.026 Y148.42 E.01291
G1 X107.582 Y120.976 E1.19825
G1 X107.447 Y121.377 E.01306
G1 X134.623 Y148.553 E1.18652
G1 X134.213 Y148.679 E.01323
G1 X107.318 Y121.784 E1.17426
G1 X107.201 Y122.203 E.01341
G1 X133.802 Y148.804 E1.16143
G1 X133.375 Y148.912 E.01361
G1 X107.083 Y122.621 E1.14792
G2 X106.981 Y123.055 I4.301 J1.237 E.01377
G1 X132.948 Y149.021 E1.13372
G3 X132.508 Y149.117 I-1.183 J-4.352 E.0139
G1 X106.882 Y123.491 E1.11887
G2 X106.791 Y123.936 I4.417 J1.129 E.01404
G1 X132.062 Y149.207 E1.10336
G3 X131.611 Y149.292 I-1.07 J-4.493 E.01419
G1 X106.711 Y124.392 E1.08715
G2 X106.634 Y124.85 I4.566 J1.005 E.01436
G1 X131.145 Y149.362 E1.07019
G3 X130.679 Y149.432 I-.95 J-4.744 E.01455
G1 X119.013 Y137.766 E.50935
G3 X119.163 Y138.451 I-4.574 J1.359 E.02169
G1 X130.192 Y149.48 E.48154
G1 X129.705 Y149.529 E.01511
G1 X119.197 Y139.021 E.4588
G3 X119.156 Y139.515 I-2.493 J.04 E.01534
G1 X129.199 Y149.559 E.43851
G1 X128.689 Y149.584 E.01578
G1 X119.065 Y139.961 E.42017
G3 X118.935 Y140.366 I-2.094 J-.45 E.01317
G1 X128.161 Y149.592 E.4028
G1 X127.625 Y149.592 E.01654
G1 X118.77 Y140.738 E.38659
G3 X118.575 Y141.078 I-1.799 J-.803 E.01214
G1 X127.069 Y149.572 E.37086
G1 X126.505 Y149.544 E.01743
G1 X118.352 Y141.391 E.35597
G3 X118.103 Y141.678 I-1.555 J-1.102 E.01174
G1 X125.917 Y149.491 E.34115
G1 X125.321 Y149.432 E.01847
G1 X117.828 Y141.938 E.32718
G3 X117.526 Y142.173 I-1.322 J-1.388 E.01181
G1 X124.691 Y149.337 E.31281
G3 X124.048 Y149.23 I.754 J-6.499 E.02014
G1 X117.198 Y142.38 E.29906
G3 X116.841 Y142.559 I-1.07 J-1.695 E.01235
G1 X123.376 Y149.094 E.28534
G3 X122.67 Y148.924 I1.352 J-7.158 E.02243
G1 X116.452 Y142.705 E.27151
G3 X116.026 Y142.815 I-.763 J-2.072 E.0136
G1 X121.936 Y148.725 E.25804
G1 X121.161 Y148.486 E.02503
G1 X115.556 Y142.882 E.2447
G3 X115.019 Y142.88 I-.261 J-2.684 E.01662
G1 X120.322 Y148.183 E.23154
G3 X119.417 Y147.814 I3.253 J-9.267 E.03019
G1 X114.398 Y142.795 E.21912
G3 X113.573 Y142.506 I.537 J-2.855 E.02709
G1 X118.418 Y147.351 E.21153
G3 X117.279 Y146.748 I5.477 J-11.719 E.0398
G1 X109.264 Y138.733 E.34994
G3 X108.647 Y137.58 I11.243 J-6.76 E.04039
G1 X111.714 Y140.646 E.13388
G3 X111.434 Y139.831 I3.963 J-1.815 E.02666
G1 X108.183 Y136.58 E.14192
G3 X107.819 Y135.68 I8.839 J-4.103 E.03
G1 X111.342 Y139.203 E.15382
G3 X111.346 Y138.671 I5.164 J-.224 E.01642
G1 X107.523 Y134.848 E.16693
G3 X107.276 Y134.066 I7.718 J-2.861 E.02533
G1 X111.411 Y138.2 E.18051
G3 X111.52 Y137.773 I2.188 J.332 E.01362
G1 X107.067 Y133.321 E.1944
G1 X106.909 Y132.627 E.02199
G1 X111.666 Y137.384 E.2077
G3 X111.844 Y137.026 I1.875 J.713 E.01235
G1 X106.772 Y131.954 E.22145
G1 X106.657 Y131.304 E.02039
G1 X112.052 Y136.698 E.23552
G3 X112.286 Y136.397 I1.621 J1.021 E.01181
G1 X106.576 Y130.686 E.24933
G3 X106.503 Y130.078 I6.051 J-1.03 E.01892
G1 X112.547 Y136.122 E.26388
G3 X112.834 Y135.873 I1.389 J1.308 E.01175
G1 X106.46 Y129.499 E.27829
G3 X106.424 Y128.927 I5.704 J-.64 E.01767
G1 X113.147 Y135.65 E.2935
G3 X113.488 Y135.455 I1.146 J1.607 E.01214
G1 X106.411 Y128.378 E.30898
G3 X106.405 Y127.837 I5.408 J-.324 E.01672
G1 X113.858 Y135.29 E.32541
G3 X114.263 Y135.159 I.858 J1.958 E.01316
G1 X106.418 Y127.314 E.34251
G3 X106.438 Y126.797 I5.185 J-.066 E.01597
G1 X114.715 Y135.075 E.36141
G3 X115.202 Y135.026 I.597 J3.516 E.01513
G1 X106.475 Y126.299 E.38105
G3 X106.515 Y125.803 I4.989 J.148 E.01538
G1 X115.774 Y135.062 E.40428
G3 X116.463 Y135.216 I-.519 J3.956 E.02183
G1 X106.422 Y125.175 E.4384
; WIPE_START
G1 X107.836 Y126.589 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.459 Y133.756 Z1 F42000
G1 X114.64 Y145.18 Z1
G1 Z.6
G1 E.8 F1800
G1 F9501.939
M204 S6000
G1 X112.814 Y143.354 E.07974
G3 X110.154 Y140.167 I14.995 J-15.216 E.12835
G1 X110.139 Y140.143 E.00086
G1 X116.426 Y146.431 E.27451
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9501.939
M73 P34 R19
G1 X115.012 Y145.016 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/76
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1 I.379 J1.156 P1  F42000
G1 X138.017 Y137.471 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.202 Y137.419 E.00638
G3 X138.539 Y137.36 I.758 J3.313 E.01134
G1 X138.874 Y137.335 E.01114
G3 X137.876 Y137.511 I.086 J3.398 E.67468
G1 X137.959 Y137.487 E.00288
M204 S10000
G1 X138.127 Y137.863 F42000
G1 F5400
M204 S6000
G1 X138.293 Y137.816 E.0057
G3 X138.589 Y137.764 I.667 J2.916 E.00999
G1 X138.884 Y137.742 E.0098
G3 X138.006 Y137.897 I.076 J2.991 E.59381
G1 X138.07 Y137.879 E.0022
M204 S250
G1 X138.233 Y138.24 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.38 Y138.199 E.00468
G3 X138.638 Y138.154 I.58 J2.534 E.00805
G1 X138.894 Y138.134 E.00788
G3 X138.131 Y138.269 I.066 J2.598 E.47792
G1 X138.176 Y138.257 E.00144
; WIPE_START
M204 S6000
G1 X138.38 Y138.199 E-.08063
G1 X138.638 Y138.154 E-.09953
G1 X138.894 Y138.134 E-.09745
G1 X139.153 Y138.141 E-.0985
G1 X139.41 Y138.173 E-.09838
G1 X139.662 Y138.231 E-.09851
G1 X139.909 Y138.313 E-.09869
G1 X140.12 Y138.409 E-.08831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.901 Y130.78 Z1.2 F42000
G1 X139.417 Y113.91 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.65 Y113.818 E.00833
G3 X140.311 Y113.668 I1.081 J3.222 E.02251
G1 X140.645 Y113.643 E.01112
G3 X139.335 Y113.942 I.087 J3.398 E.66356
G1 X139.361 Y113.932 E.00091
M204 S10000
G1 X139.566 Y114.289 F42000
G1 F5400
M204 S6000
G1 X139.78 Y114.204 E.00766
G3 X140.362 Y114.072 I.952 J2.836 E.01981
G1 X140.656 Y114.05 E.00978
G3 X139.503 Y114.313 I.076 J2.991 E.58402
G1 X139.51 Y114.311 E.00024
M204 S250
G1 X139.709 Y114.654 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X139.905 Y114.577 E.00649
G3 X140.411 Y114.461 I.827 J2.464 E.01595
G1 X140.666 Y114.442 E.00787
G3 X139.653 Y114.676 I.066 J2.598 E.46966
; WIPE_START
M204 S6000
G1 X139.905 Y114.577 E-.10307
G1 X140.155 Y114.506 E-.09862
G1 X140.411 Y114.461 E-.0985
G1 X140.666 Y114.442 E-.09728
G1 X140.928 Y114.449 E-.09971
G1 X141.185 Y114.481 E-.09854
G1 X141.438 Y114.538 E-.09853
G1 X141.602 Y114.594 E-.06575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.01 Y115.373 Z1.2 F42000
G1 X114.387 Y117.387 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.331 Y117.319 E.00291
G3 X116.619 Y111.892 I2.708 J-2.054 E.23628
G1 X116.953 Y111.867 E.01112
G3 X114.549 Y117.579 I.087 J3.398 E.44978
G1 X114.426 Y117.432 E.00634
M204 S10000
G1 X114.699 Y117.125 F42000
G1 F5400
M204 S6000
G1 X114.656 Y117.073 E.00223
G3 X116.669 Y112.297 I2.383 J-1.808 E.20796
G1 X116.963 Y112.274 E.00978
G3 X114.848 Y117.301 I.076 J2.99 E.39585
G1 X114.738 Y117.171 E.00567
M204 S250
G1 X115 Y116.873 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X114.969 Y116.836 E.00147
G3 X116.718 Y112.686 I2.071 J-1.571 E.16737
G1 X116.973 Y112.667 E.00787
G3 X115.136 Y117.034 I.066 J2.598 E.31859
G1 X115.038 Y116.919 E.00465
; WIPE_START
M204 S6000
G1 X114.969 Y116.836 E-.04095
G1 X114.823 Y116.622 E-.09849
G1 X114.699 Y116.394 E-.09861
G1 X114.598 Y116.156 E-.09838
G1 X114.522 Y115.908 E-.09855
G1 X114.47 Y115.653 E-.09862
G1 X114.445 Y115.396 E-.09832
G1 X114.445 Y115.137 E-.09859
G1 X114.452 Y115.059 E-.0295
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.725 Y122.585 Z1.2 F42000
G1 X118.205 Y137.255 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X118.254 Y137.332 E.00301
G3 X114.847 Y135.584 I-2.986 J1.625 E.57351
G1 X115.181 Y135.559 E.01113
G3 X118.077 Y137.043 I.087 J3.398 E.11253
G1 X118.174 Y137.204 E.00626
M204 S10000
G1 X117.858 Y137.468 F42000
G1 F5400
M204 S6000
G1 X117.896 Y137.527 E.00233
G3 X114.897 Y135.989 I-2.628 J1.43 E.50479
G1 X115.191 Y135.967 E.00978
M73 P34 R18
G3 X117.74 Y137.272 I.076 J2.991 E.09905
G1 X117.827 Y137.416 E.00558
M204 S250
G1 X117.523 Y137.672 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.551 Y137.715 E.00156
G3 X114.946 Y136.378 I-2.283 J1.243 E.40626
G1 X115.201 Y136.359 E.00787
G3 X117.416 Y137.493 I.067 J2.598 E.07972
G1 X117.492 Y137.621 E.00457
; WIPE_START
M204 S6000
G1 X117.551 Y137.715 E-.0421
G1 X117.662 Y137.948 E-.09837
G1 X117.751 Y138.191 E-.09822
G1 X117.815 Y138.443 E-.09857
G1 X117.853 Y138.699 E-.09868
G1 X117.866 Y138.958 E-.09853
G1 X117.853 Y139.217 E-.09845
G1 X117.815 Y139.474 E-.09862
G1 X117.796 Y139.546 E-.02845
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y137.86 Z1.2 F42000
G1 X149.538 Y132.354 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X112.65 Y112.262 I-21.546 J-4.351 E2.72736
G3 X129.034 Y106.047 I15.357 J15.778 E.59783
G3 X149.549 Y132.295 I-1.042 J21.956 E1.25406
M204 S10000
G1 X149.937 Y132.435 F42000
G1 F5400
M204 S6000
G3 X111.586 Y112.77 I-21.945 J-4.432 E2.74082
G3 X129.054 Y105.64 I16.4 J15.216 E.64607
G3 X149.949 Y132.376 I-1.062 J22.362 E1.2773
M204 S250
G1 X150.331 Y132.518 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.069 Y133.619 E.0348
G3 X111.298 Y112.503 I-22.077 J-5.616 E2.54842
G3 X129.074 Y105.249 I16.687 J15.483 E.60897
G3 X150.331 Y132.464 I-1.081 J22.754 E1.20423
; WIPE_START
M204 S6000
G1 X150.069 Y133.619 E-.45003
G1 X149.855 Y134.406 E-.30997
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


G1 X148.182 Y136.284 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4227
G1 F9479.172
M204 S6000
G1 X142.467 Y141.999 E.25016
G2 X142.647 Y141.281 I-3.511 J-1.266 E.02295
G1 X148.229 Y135.7 E.2443
G2 X148.497 Y134.952 I-7.361 J-3.059 E.02459
G1 X148.526 Y134.866 E.00281
G1 X142.691 Y140.701 E.25539
G2 X142.65 Y140.205 I-2.494 J-.046 E.01544
G1 X148.773 Y134.081 E.26798
G2 X148.983 Y133.335 I-7.489 J-2.506 E.02401
G1 X142.559 Y139.759 E.28117
G2 X142.425 Y139.355 I-2.082 J.463 E.01318
G1 X149.142 Y132.639 E.29395
G2 X149.279 Y131.965 I-6.685 J-1.709 E.0213
G1 X142.256 Y138.987 E.30734
G2 X142.056 Y138.65 I-1.782 J.835 E.01214
G1 X149.394 Y131.313 E.32115
G2 X149.476 Y130.694 I-6.169 J-1.132 E.01933
G1 X141.826 Y138.343 E.33479
G2 X141.568 Y138.064 I-1.516 J1.14 E.01178
G1 X149.548 Y130.084 E.34926
G1 X149.592 Y129.503 E.01802
G1 X141.283 Y137.812 E.36365
G2 X140.969 Y137.589 I-1.27 J1.452 E.01194
G1 X149.627 Y128.931 E.37893
G1 X149.641 Y128.38 E.01705
G1 X140.626 Y137.395 E.39456
G2 X140.25 Y137.234 I-.994 J1.798 E.01268
G1 X149.647 Y127.837 E.41124
G1 X149.634 Y127.313 E.01622
G1 X139.838 Y137.109 E.42873
G2 X139.381 Y137.028 I-.632 J2.237 E.01436
G1 X149.614 Y126.795 E.44786
G1 X149.577 Y126.296 E.01551
G1 X138.871 Y137.001 E.46854
G2 X138.266 Y137.069 I.279 J5.216 E.01885
G1 X149.537 Y125.798 E.49328
G1 X149.477 Y125.321 E.01489
G1 X137.497 Y137.301 E.52432
G2 X135.528 Y139.27 I1.47 J3.439 E.08831
G1 X125.315 Y149.483 E.44699
G1 X125.803 Y149.532 E.01519
G1 X135.293 Y140.042 E.41535
G2 X135.229 Y140.644 I3.892 J.721 E.01874
G1 X126.291 Y149.581 E.39116
G2 X126.799 Y149.611 I.553 J-5.074 E.01573
G1 X135.253 Y141.157 E.37
G2 X135.332 Y141.615 I2.323 J-.165 E.01441
G1 X127.31 Y149.636 E.35107
G2 X127.84 Y149.644 I.34 J-5.299 E.0164
G1 X135.456 Y142.027 E.33335
G2 X135.62 Y142.401 I1.956 J-.632 E.01264
G1 X128.377 Y149.644 E.31699
G2 X128.934 Y149.624 I.081 J-5.588 E.01725
G1 X135.815 Y142.743 E.30115
G2 X136.039 Y143.056 I1.672 J-.96 E.01193
G1 X129.499 Y149.596 E.28622
G2 X130.089 Y149.543 I-.237 J-5.937 E.01835
G1 X136.291 Y143.341 E.27141
G2 X136.57 Y143.599 I1.43 J-1.27 E.01178
G1 X130.686 Y149.483 E.25752
G2 X131.318 Y149.388 I-.65 J-6.474 E.01979
G1 X136.877 Y143.829 E.2433
G2 X137.213 Y144.03 I1.176 J-1.587 E.01214
G1 X131.963 Y149.281 E.22979
G1 X132.636 Y149.145 E.02125
G1 X137.581 Y144.2 E.21642
G2 X137.984 Y144.334 I.872 J-1.945 E.01316
G1 X133.344 Y148.974 E.20308
G2 X134.08 Y148.775 I-1.627 J-7.476 E.02361
M73 P35 R18
G1 X138.427 Y144.427 E.19028
G2 X138.927 Y144.465 I.621 J-4.854 E.0155
G1 X134.857 Y148.535 E.17812
G2 X135.698 Y148.231 I-2.627 J-8.585 E.02769
G1 X139.505 Y144.424 E.16663
G2 X140.222 Y144.244 I-.598 J-3.892 E.02293
G1 X136.605 Y147.861 E.15833
G2 X137.606 Y147.397 I-4.146 J-10.254 E.03417
G1 X147.399 Y137.604 E.42857
G3 X146.78 Y138.76 I-11.886 J-5.62 E.0406
G1 X138.748 Y146.792 E.35151
G2 X140.198 Y145.879 I-13.517 J-23.079 E.05303
G1 X145.903 Y140.175 E.24967
G3 X143.871 Y142.726 I-17.843 J-12.122 E.10102
G3 X141.397 Y145.217 I-101.165 J-97.996 E.10866
M204 S10000
G1 X124.699 Y149.562 F42000
G1 F9479.172
M204 S6000
G1 X149.418 Y124.844 E1.08185
G2 X149.34 Y124.384 I-4.649 J.547 E.01443
G1 X124.381 Y149.343 E1.09236
G3 X123.928 Y149.259 I.619 J-4.584 E.01426
G1 X149.26 Y123.927 E1.10865
G2 X149.169 Y123.481 I-4.516 J.684 E.0141
G1 X123.482 Y149.168 E1.12424
G3 X123.041 Y149.072 I.745 J-4.459 E.01396
G1 X149.069 Y123.044 E1.13915
G2 X148.967 Y122.608 I-4.418 J.805 E.01384
G1 X122.613 Y148.963 E1.15343
G1 X122.185 Y148.854 E.01367
G1 X148.849 Y122.189 E1.167
G1 X148.731 Y121.77 E.01348
G1 X121.772 Y148.729 E1.17989
G1 X121.362 Y148.603 E.01329
G1 X148.603 Y121.362 E1.19222
G1 X148.468 Y120.96 E.01313
G1 X120.958 Y148.47 E1.204
G1 X120.564 Y148.326 E.01297
G1 X148.331 Y120.559 E1.21525
G1 X148.18 Y120.174 E.01282
G1 X120.17 Y148.183 E1.22586
G3 X119.789 Y148.027 I1.377 J-3.907 E.01275
G1 X148.028 Y119.788 E1.23592
G2 X147.869 Y119.41 I-3.869 J1.404 E.0127
G1 X119.411 Y147.868 E1.24549
G3 X119.036 Y147.706 I1.428 J-3.828 E.01265
G1 X147.702 Y119.04 E1.25461
G1 X147.535 Y118.67 E.01257
G1 X118.673 Y147.532 E1.26317
G1 X118.311 Y147.357 E.01245
G1 X147.356 Y118.312 E1.27118
G1 X147.174 Y117.957 E.01235
G1 X117.955 Y147.175 E1.27877
G1 X117.608 Y146.986 E.01225
G1 X146.99 Y117.604 E1.28594
G1 X146.793 Y117.263 E.01217
G1 X117.26 Y146.797 E1.29256
G3 X116.923 Y146.596 I1.836 J-3.473 E.01213
G1 X146.597 Y116.923 E1.2987
G2 X146.395 Y116.588 I-3.457 J1.855 E.01211
G1 X116.59 Y146.393 E1.30445
G1 X116.256 Y146.189 E.01209
G1 X141.842 Y120.604 E1.11976
G3 X141.162 Y120.747 I-1.137 J-3.721 E.02153
G1 X115.937 Y145.971 E1.10399
G1 X115.618 Y145.754 E.01196
G1 X140.6 Y120.771 E1.09337
G3 X140.115 Y120.719 I.018 J-2.453 E.01512
G1 X115.301 Y145.533 E1.086
G1 X114.995 Y145.302 E.01186
G1 X139.678 Y120.619 E1.08027
G3 X139.282 Y120.478 I.505 J-2.053 E.01304
G1 X114.69 Y145.07 E1.0763
G3 X114.389 Y144.833 I2.222 J-3.13 E.01184
G1 X116.918 Y142.304 E.11069
G3 X116.09 Y142.596 I-1.693 J-3.489 E.02724
G1 X114.097 Y144.588 E.08721
G1 X113.805 Y144.343 E.0118
G1 X115.464 Y142.684 E.07262
G3 X114.938 Y142.674 I-.212 J-2.634 E.01633
G1 X113.521 Y144.091 E.06202
G1 X113.242 Y143.832 E.01176
G1 X114.469 Y142.605 E.05372
G3 X114.05 Y142.487 I1.816 J-7.294 E.01349
G1 X112.963 Y143.574 E.04755
G3 X112.694 Y143.306 I2.548 J-2.827 E.01176
G1 X113.669 Y142.331 E.04267
G3 X113.321 Y142.142 I.77 J-1.836 E.01228
G1 X112.429 Y143.034 E.03904
G1 X112.164 Y142.762 E.01175
G1 X113.003 Y141.923 E.0367
G3 X112.712 Y141.677 I1.084 J-1.573 E.01181
G1 X111.91 Y142.479 E.03508
G1 X111.659 Y142.193 E.01178
G1 X112.449 Y141.403 E.03459
G3 X112.213 Y141.101 I1.387 J-1.326 E.01186
G1 X111.407 Y141.908 E.03528
G1 X111.169 Y141.609 E.01183
G1 X112.007 Y140.771 E.03666
G3 X111.831 Y140.41 I1.722 J-1.062 E.01245
G1 X110.931 Y141.31 E.03939
G3 X110.695 Y141.008 I2.904 J-2.51 E.01185
G1 X111.689 Y140.014 E.0435
G3 X111.587 Y139.58 I2.123 J-.728 E.01385
G1 X110.471 Y140.696 E.04885
G1 X110.246 Y140.383 E.01191
G1 X111.537 Y139.093 E.05649
G3 X111.561 Y138.531 I2.815 J-.16 E.01741
G1 X110.027 Y140.065 E.06713
G1 X109.816 Y139.739 E.01202
G1 X111.991 Y137.565 E.09517
; WIPE_START
G1 X110.576 Y138.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.186 Y135.517 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F9479.172
M204 S6000
G1 X141.005 Y110.699 E1.08621
G1 X140.699 Y110.467 E.01186
G1 X115.889 Y135.278 E1.08587
G2 X115.398 Y135.231 I-.478 J2.423 E.01527
G1 X140.383 Y110.247 E1.09347
G1 X140.063 Y110.029 E.01196
G1 X114.842 Y135.25 E1.10384
G2 X114.16 Y135.396 I.6 J4.493 E.02161
G1 X139.744 Y109.811 E1.11972
G1 X139.41 Y109.608 E.01209
G1 X109.605 Y139.413 E1.30445
G3 X109.403 Y139.078 I3.257 J-2.191 E.01211
G1 X139.077 Y109.404 E1.2987
G2 X138.74 Y109.204 I-2.178 J3.281 E.01213
G1 X109.207 Y138.737 E1.29256
G1 X109.01 Y138.397 E.01217
G1 X138.393 Y109.014 E1.28595
G1 X138.045 Y108.825 E.01225
G1 X108.826 Y138.043 E1.27877
G1 X108.644 Y137.688 E.01235
G1 X137.689 Y108.643 E1.27119
G1 X137.327 Y108.469 E.01245
G1 X108.465 Y137.331 E1.26318
G1 X108.298 Y136.961 E.01257
G1 X136.964 Y108.294 E1.25462
G2 X136.589 Y108.132 I-1.801 J3.662 E.01265
G1 X108.131 Y136.59 E1.2455
G3 X107.972 Y136.212 I3.709 J-1.782 E.0127
G1 X136.211 Y107.973 E1.23592
G2 X135.83 Y107.817 I-1.754 J3.74 E.01275
G1 X107.821 Y135.827 E1.22587
G1 X107.669 Y135.441 E.01282
G1 X135.436 Y107.674 E1.21526
G1 X135.043 Y107.53 E.01297
G1 X107.533 Y135.04 E1.20401
G1 X107.397 Y134.638 E.01313
G1 X134.638 Y107.397 E1.19223
G1 X134.228 Y107.271 E.01329
G1 X107.269 Y134.23 E1.1799
G1 X107.151 Y133.811 E.01348
G1 X133.815 Y107.146 E1.16701
G1 X133.387 Y107.037 E.01367
G1 X107.033 Y133.392 E1.15344
G3 X106.931 Y132.957 I4.314 J-1.24 E.01384
G1 X132.959 Y106.928 E1.13917
G2 X132.519 Y106.832 I-1.186 J4.362 E.01396
G1 X106.831 Y132.519 E1.12425
G3 X106.74 Y132.073 I4.422 J-1.13 E.0141
G1 X132.072 Y106.741 E1.10866
G2 X131.619 Y106.657 I-1.072 J4.498 E.01426
G1 X106.66 Y131.616 E1.09237
G3 X106.582 Y131.157 I4.571 J-1.007 E.01443
G1 X131.152 Y106.587 E1.07533
G2 X130.685 Y106.517 I-.949 J4.734 E.01462
G1 X120.48 Y116.722 E.44667
G2 X120.709 Y115.956 I-2.413 J-1.14 E.02486
G1 X130.197 Y106.468 E.41525
G1 X129.709 Y106.419 E.01519
G1 X120.771 Y115.357 E.39117
G2 X120.749 Y114.842 I-4.609 J-.059 E.01596
G1 X129.202 Y106.389 E.36995
G1 X128.69 Y106.364 E.01585
G1 X120.666 Y114.387 E.35117
G2 X120.541 Y113.976 I-2.121 J.422 E.01334
G1 X128.161 Y106.356 E.33349
G1 X127.623 Y106.356 E.01662
G1 X120.379 Y113.601 E.31707
G2 X120.185 Y113.258 I-1.807 J.796 E.01222
G1 X127.067 Y106.376 E.30119
G1 X126.501 Y106.404 E.01752
G1 X119.961 Y112.944 E.28624
G2 X119.71 Y112.659 I-1.551 J1.113 E.0118
G1 X125.911 Y106.457 E.27142
M73 P36 R18
G1 X125.314 Y106.517 E.01856
G1 X119.431 Y112.4 E.25751
G2 X119.124 Y112.17 I-1.305 J1.417 E.01189
G1 X124.682 Y106.612 E.24327
G2 X124.038 Y106.719 I.758 J6.527 E.02024
G1 X118.789 Y111.968 E.22974
G2 X118.422 Y111.798 I-1.04 J1.752 E.01253
G1 X123.365 Y106.855 E.2163
G2 X122.657 Y107.026 I1.356 J7.177 E.02254
G1 X118.019 Y111.664 E.20299
G2 X117.572 Y111.574 I-.67 J2.167 E.01413
G1 X121.921 Y107.225 E.19034
G1 X121.144 Y107.465 E.02515
G1 X117.072 Y111.536 E.17821
G2 X116.496 Y111.575 I-.015 J4.067 E.01788
G1 X120.303 Y107.768 E.16661
G2 X119.396 Y108.139 I3.254 J9.274 E.03034
G1 X115.779 Y111.755 E.15828
G2 X113.527 Y114.007 I1.247 J3.499 E.10188
G1 X108.136 Y119.399 E.23595
G2 X107.77 Y120.301 I8.858 J4.112 E.03015
G1 X113.348 Y114.724 E.2441
G2 X113.312 Y115.297 I2.848 J.465 E.01779
G1 X107.474 Y121.135 E.25553
G2 X107.227 Y121.919 I7.73 J2.866 E.02545
G1 X113.347 Y115.799 E.26786
G2 X113.44 Y116.243 I6.416 J-1.115 E.01404
G1 X107.017 Y122.666 E.28111
G1 X106.858 Y123.362 E.02209
G1 X113.575 Y116.645 E.29399
G2 X113.746 Y117.011 I1.922 J-.668 E.01254
G1 X106.721 Y124.036 E.30743
G1 X106.606 Y124.688 E.02049
G1 X113.947 Y117.347 E.32127
G2 X114.177 Y117.654 I1.644 J-.994 E.01189
G1 X106.524 Y125.307 E.33493
G2 X106.451 Y125.917 I6.079 J1.035 E.01902
G1 X114.435 Y117.933 E.3494
G2 X114.72 Y118.185 I1.401 J-1.3 E.0118
G1 X106.408 Y126.497 E.3638
G2 X106.373 Y127.07 I5.718 J.641 E.01776
G1 X115.034 Y118.409 E.37906
G2 X115.376 Y118.603 I1.145 J-1.618 E.01221
G1 X106.359 Y127.621 E.39466
G2 X106.353 Y128.163 I5.432 J.325 E.0168
G1 X115.751 Y118.766 E.41129
G2 X116.161 Y118.893 I.837 J-1.984 E.01331
G1 X106.366 Y128.687 E.42867
G2 X106.386 Y129.205 I5.202 J.066 E.01604
G1 X116.617 Y118.974 E.44777
G2 X117.133 Y118.994 I.36 J-2.571 E.01603
G1 X106.423 Y129.705 E.46875
G2 X106.463 Y130.202 I4.981 J-.147 E.01545
G1 X117.731 Y118.934 E.49316
G2 X118.505 Y118.697 I-.787 J-3.956 E.02508
G1 X106.371 Y130.831 E.53106
M204 S10000
G1 X108.238 Y118.759 F42000
G1 F9479.172
M204 S6000
G1 X118.395 Y108.603 E.4445
G2 X117.253 Y109.207 I5.482 J11.732 E.04
G1 X109.22 Y117.241 E.35158
G3 X110.097 Y115.827 I14.618 J8.087 E.05151
G1 X115.803 Y110.12 E.24977
G2 X112.916 Y112.47 I11.631 J17.237 E.11539
G1 X110.783 Y114.603 E.09333
; WIPE_START
G1 X112.197 Y113.189 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.584 Y115.111 Z1.2 F42000
G1 X139.046 Y120.177 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F9479.172
M204 S6000
G1 X118.608 Y140.615 E.89451
G2 X118.905 Y139.78 I-3.45 J-1.7 E.02749
G1 X138.589 Y120.096 E.8615
G3 X138.288 Y119.861 I1.024 J-1.624 E.01186
G1 X118.99 Y139.158 E.84458
G2 X118.984 Y138.628 I-2.651 J-.233 E.01645
G1 X138.014 Y119.598 E.83287
G3 X137.767 Y119.308 I1.329 J-1.38 E.01181
G1 X118.912 Y138.163 E.82521
G2 X118.793 Y137.744 I-2.157 J.387 E.01348
G1 X137.548 Y118.989 E.82084
G3 X137.36 Y118.64 I14.465 J-7.995 E.01227
G1 X118.637 Y137.363 E.81944
G2 X118.449 Y137.014 I-1.838 J.768 E.01229
G1 X137.206 Y118.257 E.82093
G3 X137.09 Y117.836 I2.042 J-.791 E.01353
G1 X118.231 Y136.695 E.82539
G2 X117.984 Y136.405 I-1.576 J1.086 E.01181
G1 X137.019 Y117.37 E.83307
G3 X137.005 Y116.846 I5.455 J-.401 E.01622
G1 X117.71 Y136.142 E.84447
G2 X117.409 Y135.906 I-1.328 J1.388 E.01186
G1 X137.095 Y116.22 E.86159
G3 X137.386 Y115.392 I2.774 J.509 E.02725
G1 X117.079 Y135.699 E.88874
G2 X116.718 Y135.522 I-1.064 J1.716 E.01244
G1 X141.311 Y110.93 E1.0763
G3 X141.611 Y111.167 I-2.219 J3.125 E.01184
G1 X139.078 Y113.699 E.11084
G3 X139.916 Y113.399 I1.398 J2.579 E.02765
G1 X141.903 Y111.412 E.08696
G1 X142.195 Y111.657 E.0118
G1 X140.535 Y113.317 E.07264
G3 X141.065 Y113.324 I.196 J4.665 E.01639
G1 X142.48 Y111.909 E.06193
G1 X142.758 Y112.168 E.01176
G1 X141.528 Y113.398 E.05382
G3 X141.948 Y113.515 I-.378 J2.154 E.0135
G1 X143.037 Y112.426 E.04765
G3 X143.306 Y112.694 I-2.551 J2.83 E.01176
G1 X142.33 Y113.67 E.04271
G3 X142.679 Y113.858 I-.766 J1.841 E.01229
G1 X143.571 Y112.966 E.03904
G1 X143.836 Y113.238 E.01175
G1 X142.998 Y114.076 E.03668
G3 X143.289 Y114.322 I-1.083 J1.574 E.01181
G1 X144.09 Y113.522 E.03505
G1 X144.342 Y113.807 E.01178
G1 X143.552 Y114.596 E.03454
G3 X143.788 Y114.897 I-1.39 J1.332 E.01186
G1 X144.593 Y114.093 E.03522
G1 X144.831 Y114.392 E.01183
G1 X143.996 Y115.227 E.03657
G3 X144.173 Y115.587 I-1.709 J1.064 E.01244
G1 X145.07 Y114.69 E.03925
G3 X145.305 Y114.992 I-2.906 J2.511 E.01185
G1 X144.313 Y115.984 E.04342
G3 X144.412 Y116.422 I-2.135 J.713 E.01392
G1 X145.53 Y115.304 E.04891
G1 X145.754 Y115.617 E.01191
G1 X144.461 Y116.91 E.05658
G3 X144.441 Y117.467 I-4.364 J.122 E.01727
G1 X145.973 Y115.935 E.06705
G1 X146.184 Y116.261 E.01202
G1 X144.017 Y118.428 E.09483
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9479.172
G1 X145.431 Y117.014 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/76
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.2 I-1.147 J-.406 P1  F42000
G1 X138.127 Y137.647 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.248 Y137.619 E.00412
G3 X138.731 Y137.546 I.72 J3.115 E.01623
G3 X140.128 Y137.755 I.226 J3.262 E.04723
G3 X137.941 Y137.706 I-1.16 J2.98 E.59239
G1 X138.069 Y137.665 E.00447
M204 S10000
G1 X138.237 Y138.039 F42000
G1 F5400
M204 S6000
G1 X138.338 Y138.016 E.00345
G3 X138.761 Y137.952 I.63 J2.719 E.01421
G3 X139.715 Y138.045 I.215 J2.705 E.03195
G3 X138.071 Y138.092 I-.746 J2.689 E.52635
G1 X138.18 Y138.057 E.00379
M204 S250
G1 X138.35 Y138.419 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.425 Y138.398 E.0024
G3 X138.791 Y138.342 I.542 J2.337 E.01136
G3 X139.608 Y138.423 I.078 J3.391 E.02532
G3 X137.974 Y138.551 I-.641 J2.311 E.41169
G1 X138.293 Y138.439 E.01041
; WIPE_START
M204 S6000
G1 X138.425 Y138.398 E-.05249
G1 X138.791 Y138.342 E-.14039
G1 X139.138 Y138.34 E-.13196
G1 X139.608 Y138.423 E-.18164
G1 X140.053 Y138.598 E-.18164
G1 X140.212 Y138.701 E-.07189
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.998 Y131.071 Z1.4 F42000
G1 X139.522 Y114.084 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.717 Y114.014 E.00687
G3 X140.484 Y113.855 I1.026 J3.028 E.02605
G3 X141.903 Y114.062 I.248 J3.261 E.04798
G3 X139.42 Y114.131 I-1.16 J2.98 E.58183
G1 X139.467 Y114.109 E.00171
M204 S10000
G1 X139.67 Y114.463 F42000
G1 F5400
M204 S6000
G1 X139.846 Y114.4 E.0062
G3 X140.514 Y114.261 I.897 J2.643 E.02269
G3 X141.49 Y114.353 I.237 J2.708 E.0327
G3 X139.588 Y114.502 I-.747 J2.689 E.51714
G1 X139.616 Y114.488 E.00104
M204 S250
G1 X139.809 Y114.833 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X140.201 Y114.706 E.01266
G3 X140.544 Y114.652 I.542 J2.337 E.01067
G3 X141.384 Y114.731 I.112 J3.312 E.02601
G3 X139.749 Y114.859 I-.642 J2.311 E.4117
G1 X139.754 Y114.857 E.00016
; WIPE_START
M204 S6000
G1 X140.201 Y114.706 E-.17933
G1 X140.544 Y114.652 E-.13186
G1 X140.913 Y114.648 E-.14049
G1 X141.384 Y114.731 E-.18166
G1 X141.694 Y114.853 E-.12666
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.091 Y115.521 Z1.4 F42000
G1 X114.524 Y117.239 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.498 Y117.193 E.00177
G3 X116.791 Y112.079 I2.552 J-1.926 E.22658
G3 X118.211 Y112.287 I.248 J3.26 E.04797
G3 X114.702 Y117.437 I-1.16 J2.98 E.38131
G1 X114.565 Y117.284 E.00684
M204 S10000
G1 X114.836 Y116.977 F42000
G1 F5400
M204 S6000
G1 X114.822 Y116.947 E.00111
G3 X116.822 Y112.485 I2.229 J-1.68 E.19761
G3 X117.798 Y112.578 I.236 J2.708 E.0327
G3 X115 Y117.16 I-.747 J2.689 E.34222
G1 X114.876 Y117.022 E.00616
M204 S250
G1 X115.149 Y116.723 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X115 Y116.513 E.00791
G3 X116.851 Y112.876 I2.05 J-1.246 E.14994
G3 X117.692 Y112.956 I.112 J3.312 E.02601
G3 X115.287 Y116.894 I-.642 J2.311 E.27244
G1 X115.187 Y116.77 E.0049
; WIPE_START
M204 S6000
G1 X115 Y116.513 E-.12055
G1 X114.786 Y116.087 E-.18133
G1 X114.668 Y115.624 E-.18162
G1 X114.644 Y115.146 E-.18163
G1 X114.668 Y114.908 E-.09095
G1 X114.671 Y114.898 E-.00393
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.797 Y122.447 Z1.4 F42000
G1 X118.019 Y137.334 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X118.081 Y137.425 E.00365
G3 X115.038 Y135.77 I-2.806 J1.533 E.54503
G3 X116.435 Y135.979 I.226 J3.263 E.04723
G3 X117.914 Y137.153 I-1.16 J2.98 E.06357
G1 X117.989 Y137.282 E.00495
M204 S10000
G1 X117.672 Y137.546 F42000
G1 F5400
M204 S6000
G1 X117.725 Y137.62 E.00299
G3 X115.069 Y136.176 I-2.448 J1.34 E.47578
G3 X116.023 Y136.27 I.215 J2.705 E.03196
G3 X117.579 Y137.382 I-.746 J2.689 E.06475
G1 X117.642 Y137.494 E.00429
M204 S250
G1 X117.338 Y137.758 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.379 Y137.808 E.00198
G3 X115.098 Y136.567 I-2.104 J1.152 E.37882
G3 X115.916 Y136.648 I.078 J3.39 E.02532
G3 X117.108 Y137.413 I-.641 J2.311 E.04418
G1 X117.305 Y137.708 E.0109
; WIPE_START
M204 S6000
G1 X117.379 Y137.808 E-.04729
G1 X117.478 Y138.026 E-.09107
G1 X117.619 Y138.483 E-.18167
G1 X117.666 Y138.958 E-.1816
G1 X117.619 Y139.434 E-.1816
G1 X117.559 Y139.627 E-.07677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.002 Y137.935 Z1.4 F42000
G1 X149.545 Y132.355 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X125.266 Y106.18 I-21.552 J-4.357 E3.20097
G3 X128.595 Y106.019 I2.72 J21.681 E.11067
G3 X149.557 Y132.297 I-.602 J21.98 E1.26925
M204 S10000
G1 X149.943 Y132.436 F42000
G1 F5400
M204 S6000
G3 X124.111 Y105.943 I-21.95 J-4.438 E3.22294
G3 X128.615 Y105.612 I3.982 J23.406 E.15004
G3 X149.955 Y132.377 I-.622 J22.385 E1.29246
M204 S250
G1 X150.337 Y132.518 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.074 Y133.621 E.03482
G3 X124.043 Y105.556 I-22.082 J-5.622 E3.00296
G3 X128.634 Y105.22 I4.048 J23.781 E.14169
G3 X150.337 Y132.466 I-.642 J22.778 E1.21827
; WIPE_START
M204 S6000
G1 X150.074 Y133.621 E-.45004
G1 X149.861 Y134.408 E-.30996
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


G1 X149.636 Y130.832 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42281
G1 F9476.427
M204 S6000
G1 X125.314 Y106.51 E1.06477
G2 X124.847 Y106.58 I.471 J4.735 E.01463
G1 X149.424 Y131.157 E1.07595
G3 X149.347 Y131.617 I-4.632 J-.544 E.01444
G1 X124.38 Y106.651 E1.093
G2 X123.927 Y106.735 I.618 J4.58 E.01427
G1 X149.266 Y132.074 E1.1093
G3 X149.175 Y132.52 I-4.519 J-.685 E.01411
G1 X123.48 Y106.825 E1.1249
G2 X123.04 Y106.922 I.747 J4.464 E.01397
M73 P37 R18
G1 X149.076 Y132.958 E1.13982
G3 X148.974 Y133.393 I-4.421 J-.806 E.01385
G1 X122.611 Y107.031 E1.15411
G1 X122.183 Y107.14 E.01368
G1 X148.856 Y133.812 E1.16769
G1 X148.738 Y134.232 E.01348
G1 X121.771 Y107.264 E1.18059
G1 X121.36 Y107.391 E.0133
G1 X148.609 Y134.64 E1.19292
G1 X148.474 Y135.042 E.01313
G1 X120.956 Y107.524 E1.20471
G1 X120.562 Y107.667 E.01298
G1 X148.337 Y135.443 E1.21597
G1 X148.186 Y135.829 E.01283
G1 X120.168 Y107.811 E1.22659
G2 X119.787 Y107.967 I1.373 J3.896 E.01276
G1 X148.034 Y136.214 E1.23664
G3 X147.875 Y136.593 I-3.87 J-1.405 E.01271
G1 X119.409 Y108.126 E1.24623
G2 X119.033 Y108.288 I1.434 J3.843 E.01266
G1 X147.708 Y136.963 E1.25535
G1 X147.541 Y137.333 E.01257
G1 X118.671 Y108.463 E1.26391
G1 X118.308 Y108.637 E.01246
G1 X147.362 Y137.691 E1.27193
G1 X147.18 Y138.046 E.01236
G1 X117.953 Y108.819 E1.27952
G1 X117.605 Y109.008 E.01226
G1 X146.996 Y138.399 E1.2867
G1 X146.799 Y138.74 E.01217
G1 X117.257 Y109.198 E1.29332
G2 X116.92 Y109.398 I1.84 J3.48 E.01214
G1 X146.602 Y139.08 E1.29946
G3 X146.4 Y139.416 I-3.464 J-1.858 E.01212
G1 X116.586 Y109.602 E1.30522
G1 X116.253 Y109.806 E.0121
G1 X118.499 Y112.051 E.09831
G2 X117.708 Y111.798 I-1.508 J3.345 E.02576
G1 X115.933 Y110.023 E.07769
G1 X115.614 Y110.241 E.01197
G1 X117.116 Y111.743 E.06575
G2 X116.605 Y111.77 I-.156 J1.921 E.01588
G1 X115.297 Y110.462 E.05726
G1 X114.992 Y110.693 E.01187
G1 X116.149 Y111.851 E.05067
G2 X115.745 Y111.983 I.462 J2.088 E.0132
G1 X114.686 Y110.925 E.04635
G2 X114.385 Y111.161 I2.222 J3.129 E.01185
G1 X115.377 Y112.153 E.04341
G2 X115.042 Y112.356 I.846 J1.775 E.01213
G1 X114.093 Y111.406 E.04155
G1 X113.801 Y111.652 E.0118
G1 X114.738 Y112.589 E.04102
G2 X114.463 Y112.851 I1.174 J1.508 E.01178
G1 X113.516 Y111.904 E.04144
G1 X113.238 Y112.163 E.01177
G1 X114.217 Y113.142 E.04289
G2 X114.003 Y113.465 I1.506 J1.232 E.01202
G1 X112.959 Y112.421 E.04571
G2 X112.69 Y112.689 I2.55 J2.83 E.01176
G1 X113.821 Y113.82 E.0495
G2 X113.673 Y114.21 I1.875 J.93 E.01293
G1 X112.425 Y112.961 E.05467
G1 X112.159 Y113.233 E.01176
G1 X113.567 Y114.641 E.06162
G2 X113.512 Y115.123 I4.602 J.769 E.01503
G1 X111.906 Y113.517 E.07032
G1 X111.654 Y113.802 E.01178
G1 X113.536 Y115.685 E.08241
G2 X113.69 Y116.376 I3.65 J-.45 E.02196
G1 X111.402 Y114.088 E.10015
M73 P37 R17
G1 X111.164 Y114.387 E.01183
G1 X135.846 Y139.069 E1.08054
G3 X136.049 Y138.735 I1.771 J.849 E.01212
G1 X115.936 Y118.622 E.88053
G2 X116.626 Y118.775 I1.335 J-4.396 E.0219
G1 X136.283 Y138.431 E.86055
G3 X136.546 Y138.157 I1.505 J1.177 E.01178
G1 X117.182 Y118.793 E.84771
G2 X117.669 Y118.743 I-.271 J-5.03 E.01517
G1 X136.837 Y137.911 E.83914
G3 X137.158 Y137.695 I1.239 J1.493 E.012
G1 X118.098 Y118.635 E.83443
G2 X118.487 Y118.486 I-.547 J-2.017 E.01291
G1 X137.511 Y137.51 E.83284
G3 X137.902 Y137.364 I.924 J1.881 E.01295
G1 X118.841 Y118.303 E.83448
G2 X119.163 Y118.088 I-.913 J-1.718 E.01201
G1 X138.339 Y137.264 E.8395
G3 X138.824 Y137.212 I.438 J1.785 E.01514
G1 X119.456 Y117.843 E.84792
G2 X119.719 Y117.57 I-1.235 J-1.454 E.01178
G1 X139.379 Y137.229 E.86067
G3 X140.071 Y137.384 I-.422 J3.511 E.02199
G1 X119.954 Y117.267 E.8807
G2 X120.157 Y116.933 I-8.37 J-5.305 E.01211
G1 X144.836 Y141.612 E1.08045
G1 X145.075 Y141.314 E.01183
G1 X120.325 Y116.564 E1.0835
G2 X120.457 Y116.158 I-1.963 J-.86 E.01323
G1 X145.31 Y141.012 E1.08806
G1 X145.535 Y140.699 E.01192
G1 X120.544 Y115.709 E1.09406
G2 X120.572 Y115.199 I-4.114 J-.481 E.0158
G1 X145.76 Y140.387 E1.10267
G2 X145.979 Y140.069 I-3.081 J-2.357 E.01196
G1 X120.511 Y114.601 E1.11496
G2 X120.258 Y113.811 I-2.627 J.404 E.02576
G1 X146.312 Y139.865 E1.14061
M204 S10000
G1 X144.719 Y142.032 F42000
G1 F9476.427
M204 S6000
G1 X142.311 Y139.624 E.10542
G3 X142.465 Y140.315 I-3.718 J1.192 E.02196
G1 X144.347 Y142.197 E.08238
G1 X144.095 Y142.483 E.01178
G1 X142.486 Y140.873 E.07045
G3 X142.434 Y141.359 I-2.456 J-.016 E.01514
G1 X143.841 Y142.766 E.06161
G1 X143.576 Y143.038 E.01176
G1 X142.33 Y141.792 E.05456
G3 X142.18 Y142.179 I-2.013 J-.554 E.01288
G1 X143.311 Y143.31 E.0495
G3 X143.041 Y143.578 I-2.815 J-2.557 E.01176
G1 X141.996 Y142.533 E.04578
G3 X141.78 Y142.854 I-1.713 J-.915 E.01201
G1 X142.763 Y143.837 E.04301
G1 X142.484 Y144.095 E.01177
G1 X141.535 Y143.146 E.04155
G3 X141.261 Y143.409 I-1.45 J-1.236 E.01178
G1 X142.199 Y144.348 E.04108
G1 X141.907 Y144.593 E.0118
G1 X140.958 Y143.644 E.04156
G3 X140.625 Y143.848 I-1.185 J-1.562 E.01212
G1 X141.615 Y144.838 E.04336
G3 X141.315 Y145.075 I-2.523 J-2.893 E.01185
M73 P38 R17
G1 X140.259 Y144.019 E.04621
G3 X139.853 Y144.15 I-2.239 J-6.256 E.01322
G1 X141.009 Y145.306 E.05062
G1 X140.703 Y145.538 E.01187
G1 X139.401 Y144.236 E.05701
G3 X138.894 Y144.266 I-.406 J-2.518 E.01574
G1 X140.387 Y145.759 E.06533
G1 X140.067 Y145.976 E.01197
G1 X138.291 Y144.2 E.07775
G3 X137.511 Y143.958 I.742 J-3.761 E.02533
G1 X139.748 Y146.194 E.0979
G1 X139.414 Y146.398 E.0121
G1 X109.6 Y116.584 E1.30523
G1 X109.811 Y116.257 E.01203
G1 X135.74 Y142.187 E1.13517
G3 X135.492 Y141.402 I3.305 J-1.476 E.02555
G1 X110.022 Y115.931 E1.11508
G3 X110.241 Y115.613 I3.299 J2.038 E.01196
G1 X135.429 Y140.801 E1.1027
G3 X135.456 Y140.29 I2.563 J-.122 E.01585
G1 X110.465 Y115.3 E1.09403
G1 X110.69 Y114.988 E.01192
G1 X135.541 Y139.838 E1.08794
G3 X135.675 Y139.436 I2.079 J.47 E.01317
G1 X110.805 Y114.565 E1.08879
M204 S10000
G1 X116.482 Y135.822 F42000
G1 F9476.427
M204 S6000
G1 X106.456 Y125.797 E.43891
G2 X106.417 Y126.294 I4.977 J.647 E.01546
G1 X115.56 Y135.438 E.4003
G1 X115.022 Y135.437 E.01667
G1 X106.379 Y126.794 E.37838
G2 X106.36 Y127.312 I5.184 J.452 E.01605
G1 X114.55 Y135.502 E.35856
G2 X114.125 Y135.614 I1.051 J4.845 E.01361
G1 X106.347 Y127.836 E.34052
G2 X106.352 Y128.379 I5.434 J.218 E.0168
G1 X113.745 Y135.772 E.32365
G2 X113.399 Y135.963 I.781 J1.826 E.01226
G1 X106.366 Y128.93 E.30789
G2 X106.401 Y129.502 I5.758 J-.069 E.01777
G1 X113.083 Y136.184 E.29253
G2 X112.797 Y136.436 I1.114 J1.556 E.0118
G1 X106.445 Y130.083 E.2781
G2 X106.518 Y130.693 I6.153 J-.425 E.01903
G1 X112.54 Y136.716 E.26366
G2 X112.312 Y137.025 I1.43 J1.293 E.01191
G1 X106.6 Y131.312 E.25009
G1 X106.715 Y131.965 E.0205
G1 X112.115 Y137.365 E.23641
G2 X111.95 Y137.738 I1.779 J1.008 E.01263
G1 X106.852 Y132.639 E.22322
G1 X107.01 Y133.335 E.0221
G1 X111.828 Y138.152 E.21091
G2 X111.753 Y138.615 I2.272 J.605 E.01453
G1 X107.22 Y134.082 E.19845
G2 X107.467 Y134.866 I7.976 J-2.081 E.02546
G1 X111.736 Y139.136 E.18691
G2 X111.828 Y139.764 I3.185 J-.142 E.0197
G1 X107.764 Y135.7 E.17792
G2 X108.129 Y136.603 I9.227 J-3.211 E.03016
G1 X119.394 Y147.868 E.49316
G3 X118.393 Y147.404 I4.149 J-10.263 E.03418
G1 X108.594 Y137.605 E.42896
G2 X109.213 Y138.761 I11.883 J-5.617 E.04061
G1 X117.251 Y146.799 E.35189
G1 X117.171 Y146.756 E.00281
G3 X115.802 Y145.887 I8.018 J-14.157 E.05022
G1 X110.09 Y140.175 E.25005
G1 X110.106 Y140.2 E.0009
G2 X112.759 Y143.382 I17.682 J-12.047 E.12846
G1 X114.603 Y145.225 E.0807
M204 S10000
G1 X114.218 Y142.154 F42000
G1 F9476.427
M204 S6000
G1 X120.302 Y148.238 E.26635
G2 X121.143 Y148.542 I3.464 J-8.272 E.0277
G1 X115.085 Y142.484 E.26518
G2 X115.611 Y142.473 I.172 J-3.984 E.01628
G1 X121.92 Y148.781 E.2762
G2 X122.656 Y148.981 I2.365 J-7.286 E.02362
G1 X116.071 Y142.395 E.2883
G2 X116.485 Y142.272 I-.406 J-2.131 E.0134
G1 X123.364 Y149.151 E.30115
G1 X124.037 Y149.287 E.02127
G1 X116.861 Y142.111 E.31417
G2 X117.201 Y141.914 I-4.552 J-8.261 E.01217
G1 X124.682 Y149.395 E.32749
G2 X125.314 Y149.49 I1.271 J-6.31 E.0198
G1 X117.51 Y141.686 E.34166
G2 X117.79 Y141.428 I-1.146 J-1.524 E.01179
G1 X125.911 Y149.55 E.35555
G2 X126.502 Y149.603 I.827 J-5.894 E.01835
G1 X118.04 Y141.141 E.37042
G2 X118.262 Y140.826 I-1.468 J-1.264 E.01196
G1 X127.067 Y149.631 E.38549
G2 X127.624 Y149.65 I.475 J-5.571 E.01726
G1 X118.452 Y140.478 E.40154
G2 X118.608 Y140.097 I-1.828 J-.971 E.01277
G1 X128.161 Y149.65 E.41823
G2 X128.691 Y149.643 I.189 J-5.311 E.01641
G1 X118.725 Y139.677 E.43628
G2 X118.788 Y139.203 I-4.955 J-.895 E.01483
G1 X129.203 Y149.617 E.45594
G2 X129.71 Y149.587 I-.046 J-5.096 E.01574
G1 X118.785 Y138.663 E.47826
G2 X118.666 Y138.006 I-3.974 J.384 E.02069
G1 X130.198 Y149.539 E.50487
G1 X130.687 Y149.49 E.01519
G1 X106.516 Y125.319 E1.05815
G1 X106.576 Y124.842 E.01489
G1 X131.154 Y149.42 E1.07599
G1 X131.621 Y149.349 E.01462
G1 X106.653 Y124.382 E1.09303
G1 X106.734 Y123.925 E.01436
G1 X132.074 Y149.265 E1.10933
G1 X132.52 Y149.175 E.01411
G1 X106.825 Y123.479 E1.12493
G1 X106.925 Y123.041 E.01389
G1 X132.961 Y149.078 E1.13985
G1 X133.389 Y148.969 E.01368
G1 X107.027 Y122.606 E1.15413
G1 X107.144 Y122.187 E.01348
G1 X133.818 Y148.86 E1.16771
G2 X134.23 Y148.735 I-1.041 J-4.19 E.01335
G1 X107.262 Y121.768 E1.18061
G3 X107.391 Y121.359 I4.156 J1.088 E.01326
G1 X134.641 Y148.609 E1.19294
G2 X135.045 Y148.476 I-1.129 J-4.115 E.01318
G1 X107.526 Y120.957 E1.20473
G3 X107.663 Y120.557 I4.084 J1.17 E.01311
G1 X135.439 Y148.332 E1.21599
G1 X135.833 Y148.189 E.01298
G1 X107.815 Y120.171 E1.2266
G1 X107.966 Y119.785 E.01283
G1 X136.214 Y148.033 E1.23666
G1 X136.592 Y147.874 E.0127
G1 X108.125 Y119.407 E1.24624
G1 X108.292 Y119.036 E.01257
G1 X136.967 Y147.712 E1.25537
G1 X137.33 Y147.537 E.01246
G1 X108.459 Y118.666 E1.26393
G3 X108.639 Y118.309 I3.672 J1.619 E.01239
G1 X137.693 Y147.362 E1.27194
G2 X138.048 Y147.181 I-1.643 J-3.65 E.01236
G1 X108.821 Y117.953 E1.27953
G3 X109.005 Y117.6 I3.631 J1.665 E.01234
G1 X138.396 Y146.991 E1.28671
G1 X138.744 Y146.802 E.01226
G1 X109.201 Y117.259 E1.29333
G1 X109.398 Y116.919 E.01217
G1 X139.204 Y146.725 E1.30488
; WIPE_START
G1 X137.79 Y145.311 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.832 Y138.311 Z1.4 F42000
G1 X148.53 Y120.593 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X144.17 Y116.233 E.19086
G3 X144.259 Y116.859 I-3.522 J.817 E.01959
G1 X148.532 Y121.132 E.18709
G3 X148.78 Y121.917 I-7.724 J2.865 E.02547
G1 X144.251 Y117.388 E.19827
G3 X144.171 Y117.846 I-5.648 J-.741 E.01439
G1 X148.989 Y122.664 E.21092
G1 X149.148 Y123.36 E.0221
G1 X144.047 Y118.259 E.22332
G3 X143.885 Y118.634 I-1.955 J-.623 E.01267
G1 X149.285 Y124.034 E.23642
G1 X149.4 Y124.686 E.0205
G1 X143.689 Y118.975 E.25003
G3 X143.462 Y119.286 I-1.665 J-.978 E.01192
G1 X149.482 Y125.306 E.26355
G3 X149.555 Y125.916 I-6.067 J1.034 E.01903
G1 X143.206 Y119.567 E.27795
G3 X142.919 Y119.817 I-8.674 J-9.62 E.01179
G1 X149.598 Y126.496 E.2924
G3 X149.634 Y127.069 I-5.719 J.642 E.01777
G1 X142.603 Y120.038 E.30781
G3 X142.255 Y120.228 I-1.119 J-1.642 E.01228
G1 X149.648 Y127.62 E.32364
G3 X149.653 Y128.163 I-5.435 J.326 E.01681
G1 X141.873 Y120.382 E.34061
G3 X141.451 Y120.498 I-.788 J-2.045 E.01355
G1 X149.64 Y128.687 E.35849
G3 X149.621 Y129.205 I-5.195 J.067 E.01605
G1 X140.982 Y120.566 E.3782
G3 X140.438 Y120.559 I-.236 J-2.722 E.01688
G1 X149.583 Y129.705 E.4004
G3 X149.544 Y130.202 I-5.017 J-.149 E.01546
G1 X139.513 Y120.172 E.43912
; WIPE_START
G1 X140.928 Y121.586 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.601 Y118.26 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X125.803 Y106.461 E.51652
G1 X126.291 Y106.412 E.01519
G1 X137.216 Y117.338 E.47829
G3 X137.211 Y116.795 I3.923 J-.307 E.0168
G1 X126.798 Y106.383 E.45586
G1 X127.31 Y106.357 E.01586
G1 X137.278 Y116.325 E.43637
G3 X137.392 Y115.901 I2.168 J.357 E.01359
G1 X127.841 Y106.35 E.41814
G1 X128.379 Y106.351 E.01667
G1 X137.546 Y115.518 E.4013
G3 X137.737 Y115.172 I8.213 J4.306 E.01224
G1 X128.934 Y106.369 E.38537
G1 X129.499 Y106.397 E.01753
G1 X137.959 Y114.857 E.37036
G3 X138.211 Y114.572 I1.552 J1.115 E.0118
G1 X130.09 Y106.451 E.35553
G1 X130.687 Y106.51 E.01857
G1 X138.492 Y114.315 E.34168
G3 X138.802 Y114.088 I1.29 J1.434 E.01192
G1 X131.319 Y106.605 E.32757
G3 X131.964 Y106.713 I-.756 J6.515 E.02025
G1 X139.142 Y113.891 E.31425
G3 X139.516 Y113.728 I1.002 J1.785 E.01265
G1 X132.637 Y106.849 E.30114
G3 X133.345 Y107.02 I-1.356 J7.178 E.02255
G1 X139.927 Y113.602 E.28815
G1 X140.394 Y113.531 E.01461
G1 X134.082 Y107.219 E.27634
G1 X134.859 Y107.459 E.02517
G1 X140.917 Y113.517 E.26525
G3 X141.543 Y113.606 I-.165 J3.425 E.01959
G1 X135.7 Y107.763 E.25581
G3 X136.607 Y108.133 I-3.258 J9.282 E.03036
G1 X147.87 Y119.395 E.49305
G2 X147.405 Y118.393 I-10.283 J4.163 E.03423
G1 X137.609 Y108.597 E.42883
G3 X138.751 Y109.202 I-5.493 J11.752 E.04003
G1 X146.785 Y117.236 E.35173
G2 X145.908 Y115.822 I-14.618 J8.087 E.05155
G1 X140.201 Y110.115 E.24983
G3 X143.094 Y112.471 I-11.659 J17.273 E.11563
G1 X145.22 Y114.597 E.09309
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9476.427
G1 X143.806 Y113.183 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/76
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S196.35
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.4 I-1.187 J-.268 P1  F42000
G1 X138.24 Y137.823 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
M73 P39 R17
G1 X138.291 Y137.809 E.00175
G3 X138.585 Y137.757 I.668 J2.924 E.00991
G1 X138.884 Y137.734 E.00994
G3 X138.003 Y137.89 I.075 J2.998 E.59528
G1 X138.182 Y137.839 E.00619
M204 S10000
G1 X138.35 Y138.215 F42000
G1 F5400
M204 S6000
G1 X138.382 Y138.206 E.00108
G3 X138.636 Y138.161 I.577 J2.526 E.00857
G1 X138.894 Y138.142 E.00858
G3 X138.133 Y138.276 I.065 J2.591 E.5144
G1 X138.293 Y138.231 E.00551
M204 S250
G1 X138.45 Y138.604 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.685 Y138.551 E.00739
G1 X138.904 Y138.534 E.00674
G3 X138.258 Y138.648 I.055 J2.194 E.40356
G1 X138.392 Y138.618 E.00423
; WIPE_START
M204 S6000
G1 X138.685 Y138.551 E-.11418
G1 X138.904 Y138.534 E-.08341
G1 X139.34 Y138.567 E-.16645
G1 X139.762 Y138.686 E-.16655
G1 X140.152 Y138.886 E-.16651
G1 X140.282 Y138.989 E-.0629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.668 Y138.453 Z1.6 F42000
G1 X117.831 Y137.409 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.9 Y137.524 E.00443
G3 X114.893 Y135.981 I-2.634 J1.433 E.50594
G1 X115.191 Y135.959 E.00993
G3 X117.744 Y137.269 I.075 J2.998 E.09925
G1 X117.8 Y137.358 E.00349
M204 S10000
G1 X117.484 Y137.622 F42000
G1 F5400
M204 S6000
G1 X117.543 Y137.719 E.00376
G3 X114.944 Y136.386 I-2.277 J1.239 E.43727
G1 X115.201 Y136.366 E.00858
G3 X117.408 Y137.498 I.064 J2.591 E.08577
G1 X117.452 Y137.57 E.00282
M204 S250
G1 X117.139 Y137.821 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.29 Y138.105 E.00989
G3 X114.992 Y136.775 I-2.025 J.848 E.33619
G1 X115.211 Y136.759 E.00674
G3 X117.082 Y137.72 I.054 J2.194 E.06739
G1 X117.11 Y137.769 E.00171
; WIPE_START
M204 S6000
G1 X117.29 Y138.105 E-.1451
G1 X117.423 Y138.522 E-.16634
G1 X117.466 Y138.958 E-.16653
G1 X117.423 Y139.394 E-.1665
G1 X117.333 Y139.685 E-.11552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.426 Y132.107 Z1.6 F42000
G1 X114.623 Y117.039 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.483 Y116.829 E.00837
G3 X116.668 Y112.289 I2.559 J-1.565 E.19845
G1 X116.967 Y112.267 E.00994
G3 X114.66 Y117.087 I.075 J2.998 E.40634
M204 S10000
G1 X114.96 Y116.81 F42000
G1 F5400
M204 S6000
G1 X114.831 Y116.617 E.0077
G3 X116.719 Y112.693 I2.211 J-1.352 E.17149
G1 X116.977 Y112.674 E.00858
G3 X114.997 Y116.857 I.065 J2.591 E.35037
M204 S250
G1 X115.287 Y116.575 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X115.171 Y116.409 E.00622
G3 X116.768 Y113.083 I1.871 J-1.148 E.13466
G1 X116.987 Y113.067 E.00674
G3 X115.435 Y116.757 I.055 J2.194 E.26895
G1 X115.325 Y116.622 E.00535
; WIPE_START
M204 S6000
G1 X115.171 Y116.409 E-.0997
G1 X114.974 Y116.019 E-.16615
G1 X114.866 Y115.594 E-.16672
G1 X114.844 Y115.156 E-.16638
G1 X114.907 Y114.737 E-.16106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.538 Y114.589 Z1.6 F42000
G1 X139.629 Y114.256 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.778 Y114.197 E.00531
G3 X140.361 Y114.064 I.956 J2.843 E.01985
G1 X140.659 Y114.042 E.00993
G3 X139.5 Y114.307 I.075 J2.999 E.58549
G1 X139.573 Y114.278 E.00262
M204 S10000
G1 X139.778 Y114.635 F42000
G1 F5400
M204 S6000
G1 X139.908 Y114.584 E.00464
G3 X140.411 Y114.469 I.826 J2.457 E.01715
G1 X140.669 Y114.45 E.00858
G3 X139.667 Y114.678 I.065 J2.592 E.50602
G1 X139.722 Y114.657 E.00195
M204 S250
G1 X139.932 Y115.001 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X140.033 Y114.956 E.0034
G3 X140.46 Y114.858 I.7 J2.08 E.01348
G1 X140.679 Y114.842 E.00674
G3 X139.634 Y115.136 I.054 J2.194 E.39008
G1 X139.878 Y115.026 E.00821
; WIPE_START
M204 S6000
G1 X140.033 Y114.956 E-.06487
G1 X140.46 Y114.858 E-.16647
G1 X140.679 Y114.842 E-.08339
G1 X141.116 Y114.875 E-.16645
G1 X141.538 Y114.993 E-.16656
G1 X141.801 Y115.128 E-.11226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.93 Y122.09 Z1.6 F42000
G1 X149.544 Y132.355 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X117.968 Y108.431 I-21.552 J-4.355 E2.94639
G3 X128.738 Y106.026 I10.057 J19.716 E.36997
G3 X149.556 Y132.297 I-.746 J21.975 E1.26438
M204 S10000
G1 X149.942 Y132.436 F42000
G1 F5400
M204 S6000
G3 X117.782 Y108.069 I-21.951 J-4.435 E3.00086
G3 X128.758 Y105.619 I10.243 J20.079 E.37705
G3 X149.954 Y132.377 I-.766 J22.381 E1.28758
M204 S250
G1 X150.338 Y132.518 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.075 Y133.621 E.03485
G3 X116.605 Y108.263 I-22.083 J-5.62 E2.75861
G3 X128.778 Y105.228 I11.38 J19.71 E.39054
G3 X150.337 Y132.465 I-.785 J22.773 E1.21377
; WIPE_START
M204 S6000
G1 X150.075 Y133.621 E-.45023
G1 X149.862 Y134.408 E-.30977
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


G1 X145.143 Y140.572 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X146.057 Y139.225 I-13.037 J-9.823 E.05402
G1 X145.69 Y139.34 E.01276
G3 X144.379 Y140.374 I-6.436 J-6.81 E.05544
G3 X143.16 Y140.275 I-.499 J-1.404 E.04181
G1 X143.164 Y140.303 E.00094
G3 X142.689 Y142.722 I-4.318 J.407 E.08293
G1 X143.07 Y142.995 E.01556
G3 X141.5 Y144.423 I-13.897 J-13.702 E.07044
G1 X141.104 Y144.376 E.01324
G3 X140.245 Y144.757 I-2.311 J-4.048 E.03123
G3 X139.138 Y145.615 I-5.354 J-5.761 E.04652
G3 X137.173 Y144.923 I-.444 J-1.876 E.07303
G1 X136.517 Y144.454 E.02674
G2 X134.552 Y145.146 I-.444 J1.876 E.07303
G1 X133.897 Y145.615 E.02674
G3 X131.931 Y144.923 I-.444 J-1.876 E.07303
G1 X131.276 Y144.454 E.02674
G2 X129.311 Y145.146 I-.444 J1.876 E.07303
G1 X128.655 Y145.615 E.02674
G3 X126.69 Y144.923 I-.444 J-1.876 E.07303
G1 X126.035 Y144.454 E.02674
G2 X124.069 Y145.146 I-.444 J1.876 E.07303
G1 X123.414 Y145.615 E.02674
G3 X121.449 Y144.923 I-.444 J-1.876 E.07303
G1 X120.794 Y144.454 E.02674
G2 X118.828 Y145.146 I-.444 J1.876 E.07303
G1 X118.173 Y145.615 E.02674
G3 X116.207 Y144.923 I-.444 J-1.876 E.07303
G1 X115.552 Y144.454 E.02674
G1 X114.897 Y144.376 E.02189
G1 X114.567 Y144.479 E.01147
G3 X112.937 Y143.002 I14.34 J-17.468 E.07301
G1 X112.761 Y143.362 E.01329
G1 X112.431 Y143.024 E.01568
G2 X113.193 Y142.642 I-.063 J-1.076 E.02907
G2 X116.75 Y142.914 I2.072 J-3.706 E.12211
G1 X116.863 Y142.995 E.00461
G2 X118.828 Y142.303 I.444 J-1.876 E.07303
G1 X119.483 Y141.833 E.02674
G3 X121.449 Y142.525 I.444 J1.876 E.07303
G1 X122.104 Y142.995 E.02674
G2 X124.069 Y142.303 I.444 J-1.876 E.07303
G1 X124.724 Y141.833 E.02674
G3 X126.69 Y142.525 I.444 J1.876 E.07303
G1 X127.345 Y142.995 E.02674
G2 X129.311 Y142.303 I.444 J-1.876 E.07303
G1 X129.966 Y141.833 E.02674
G3 X131.931 Y142.525 I.444 J1.876 E.07303
G1 X132.586 Y142.995 E.02674
G2 X134.552 Y142.303 I.444 J-1.876 E.07303
G1 X134.937 Y142.026 E.01573
G3 X134.882 Y139.62 I4.047 J-1.296 E.08095
G3 X133.897 Y140.374 I-4.71 J-5.135 E.04122
G3 X131.931 Y139.682 I-.444 J-1.876 E.07303
G1 X131.276 Y139.212 E.02674
G2 X129.311 Y139.905 I-.444 J1.876 E.07303
G1 X128.655 Y140.374 E.02674
G3 X126.69 Y139.682 I-.444 J-1.876 E.07303
G1 X126.035 Y139.212 E.02674
G2 X124.069 Y139.905 I-.444 J1.876 E.07303
G1 X123.414 Y140.374 E.02674
G3 X121.449 Y139.682 I-.444 J-1.876 E.07303
G1 X120.794 Y139.212 E.02674
G2 X119.475 Y139.347 I-.512 J1.509 E.04532
G2 X118.986 Y136.948 I-4.199 J-.392 E.08239
G1 X119.483 Y136.592 E.02031
G3 X121.449 Y137.284 I.444 J1.876 E.07303
G1 X122.104 Y137.753 E.02674
G2 X124.069 Y137.061 I.444 J-1.876 E.07303
G1 X124.724 Y136.592 E.02674
G3 X126.69 Y137.284 I.444 J1.876 E.07303
G1 X127.345 Y137.753 E.02674
G2 X129.311 Y137.061 I.444 J-1.876 E.07303
G1 X129.966 Y136.592 E.02674
G3 X131.931 Y137.284 I.444 J1.876 E.07303
G1 X132.586 Y137.753 E.02674
G2 X134.552 Y137.061 I.444 J-1.876 E.07303
G1 X135.207 Y136.592 E.02674
G3 X136.896 Y137.045 I.449 J1.7 E.0607
G3 X140.27 Y136.719 I2.061 J3.705 E.1157
G1 X140.448 Y136.592 E.00727
G3 X142.414 Y137.284 I.444 J1.876 E.07303
G1 X143.069 Y137.753 E.02674
G2 X145.035 Y137.061 I.444 J-1.876 E.07303
G1 X145.69 Y136.592 E.02674
G3 X147.279 Y136.96 I.449 J1.676 E.05635
G2 X148.126 Y134.846 I-19.726 J-9.127 E.07558
G2 X147 Y133.971 I-5.455 J5.858 E.04736
G2 X145.035 Y134.663 I-.444 J1.876 E.07303
G1 X144.379 Y135.133 E.02674
G3 X142.414 Y134.441 I-.444 J-1.876 E.07303
G1 X141.759 Y133.971 E.02674
G2 X139.793 Y134.663 I-.444 J1.876 E.07303
G1 X139.138 Y135.133 E.02674
G3 X137.173 Y134.441 I-.444 J-1.876 E.07303
G1 X136.517 Y133.971 E.02674
G2 X134.552 Y134.663 I-.444 J1.876 E.07303
G1 X133.897 Y135.133 E.02674
G3 X131.931 Y134.441 I-.444 J-1.876 E.07303
G1 X131.276 Y133.971 E.02674
G2 X129.311 Y134.663 I-.444 J1.876 E.07303
G1 X128.655 Y135.133 E.02674
G3 X126.69 Y134.441 I-.444 J-1.876 E.07303
G1 X126.035 Y133.971 E.02674
G2 X124.069 Y134.663 I-.444 J1.876 E.07303
G1 X123.414 Y135.133 E.02674
G3 X121.449 Y134.441 I-.444 J-1.876 E.07303
G1 X120.794 Y133.971 E.02674
G2 X118.828 Y134.663 I-.444 J1.876 E.07303
G1 X118.173 Y135.133 E.02674
G3 X116.207 Y134.441 I-.444 J-1.876 E.07303
G1 X115.552 Y133.971 E.02674
G2 X113.587 Y134.663 I-.444 J1.876 E.07303
G1 X112.932 Y135.133 E.02674
G3 X110.966 Y134.441 I-.444 J-1.876 E.07303
G1 X110.311 Y133.971 E.02674
G2 X108.345 Y134.663 I-.444 J1.876 E.07303
G1 X107.916 Y134.971 E.01752
G2 X108.664 Y136.833 I20.717 J-7.235 E.06659
G1 X109.001 Y136.592 E.01375
G3 X110.966 Y137.284 I.444 J1.876 E.07303
G1 X111.291 Y137.517 E.01327
G2 X111.133 Y139.825 I4.06 J1.439 E.07771
G2 X110.311 Y139.212 I-3.839 J4.289 E.03405
G1 X109.904 Y139.164 E.0136
G2 X110.814 Y140.513 I13.961 J-8.439 E.05402
M204 S10000
G1 X113.042 Y143.615 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G2 X141.613 Y144.801 I14.958 J-15.599 E.86572
M204 S10000
G1 X138.188 Y146.658 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X136.733 Y147.388 I-14.386 J-26.833 E.054
G1 X136.517 Y147.202 E.00946
G2 X134.552 Y147.544 I-.756 J1.475 E.07101
G1 X133.897 Y148.108 E.02868
G3 X131.931 Y147.767 I-.756 J-1.475 E.07101
G1 X131.276 Y147.202 E.02868
G2 X129.311 Y147.544 I-.756 J1.475 E.07101
G1 X128.655 Y148.108 E.02868
G3 X126.69 Y147.767 I-.756 J-1.475 E.07101
G1 X126.035 Y147.202 E.02868
G2 X124.069 Y147.544 I-.756 J1.475 E.07101
G1 X123.414 Y148.108 E.02868
G3 X121.449 Y147.767 I-.756 J-1.475 E.07101
G1 X120.794 Y147.202 E.02868
G2 X119.483 Y147.074 I-.797 J1.391 E.045
G1 X119.133 Y147.325 E.01427
G3 X117.682 Y146.587 I6.67 J-14.917 E.05402
; WIPE_START
G1 X119.133 Y147.325 E-.61857
G1 X119.436 Y147.108 E-.14143
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.395 Y139.547 Z1.6 F42000
G1 X117.94 Y136.24 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459841
G1 F8634.728
M204 S6000
G1 X117.348 Y135.764 E.02579
G1 X116.674 Y135.415 E.02579
G1 X115.943 Y135.206 E.02581
M73 P40 R17
G1 X115.212 Y135.143 E.02495
G1 X114.776 Y135.176 E.01484
G1 X114.067 Y135.339 E.02473
G1 X113.373 Y135.648 E.0258
G1 X112.755 Y136.089 E.0258
G1 X112.236 Y136.643 E.02578
G1 X111.838 Y137.29 E.02581
G1 X111.575 Y138.002 E.0258
G1 X111.458 Y138.752 E.02578
G1 X111.494 Y139.511 E.02581
G1 X111.678 Y140.248 E.02579
G1 X112.004 Y140.933 E.02579
G1 X112.46 Y141.54 E.02579
G1 X113.027 Y142.045 E.0258
G1 X113.684 Y142.427 E.0258
G1 X114.402 Y142.672 E.02579
G1 X115.153 Y142.77 E.02573
G1 X115.934 Y142.712 E.02659
G1 X116.668 Y142.504 E.02592
G1 X117.321 Y142.171 E.02492
G1 X117.935 Y141.682 E.02666
G1 X118.408 Y141.119 E.02496
G1 X118.774 Y140.454 E.0258
G1 X119 Y139.731 E.02575
G1 X119.079 Y138.95 E.02667
G1 X119.007 Y138.218 E.02498
G1 X118.786 Y137.492 E.02577
G1 X118.426 Y136.824 E.02579
G1 X117.978 Y136.286 E.02378
M204 S10000
G1 X117.861 Y136.755 F42000
; LINE_WIDTH: 0.445029
G1 F8952.811
M204 S6000
G1 X118.246 Y137.313 E.02221
G1 X118.513 Y137.936 E.0222
G1 X118.651 Y138.6 E.02222
G1 X118.655 Y139.277 E.02221
G1 X118.525 Y139.943 E.02221
G1 X118.265 Y140.569 E.02222
G1 X117.887 Y141.131 E.0222
G1 X117.404 Y141.607 E.02221
G1 X116.837 Y141.978 E.02221
G1 X116.207 Y142.229 E.02221
G1 X115.541 Y142.351 E.02218
G1 X114.866 Y142.339 E.02214
G1 X114.202 Y142.192 E.02228
G1 X113.568 Y141.908 E.02276
G1 X113.014 Y141.511 E.02233
G1 X112.565 Y141.029 E.02159
G1 X112.208 Y140.453 E.0222
G1 X111.972 Y139.817 E.02221
G1 X111.867 Y139.129 E.02281
G1 X111.897 Y138.47 E.02162
G3 X112.757 Y136.658 I3.64 J.617 E.06657
G1 X113.263 Y136.206 E.02221
G1 X113.848 Y135.864 E.0222
G1 X114.489 Y135.644 E.02222
G1 X115.161 Y135.552 E.02221
G1 X115.851 Y135.612 E.0227
G1 X116.207 Y135.687 E.01193
G1 X116.801 Y135.92 E.02091
G1 X117.373 Y136.285 E.02222
G1 X117.817 Y136.714 E.02024
M204 S10000
G1 X106.942 Y130.927 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X107.229 Y132.529 I23.263 J-3.334 E.054
G1 X107.69 Y132.384 E.01605
G1 X108.345 Y131.82 E.02868
G3 X110.311 Y131.478 I1.209 J1.133 E.07101
G1 X110.966 Y132.043 E.02868
G2 X112.932 Y132.384 I1.209 J-1.133 E.07101
G1 X113.587 Y131.82 E.02868
G3 X115.552 Y131.478 I1.209 J1.133 E.07101
G1 X116.207 Y132.043 E.02868
G2 X118.173 Y132.384 I1.209 J-1.133 E.07101
G1 X118.828 Y131.82 E.02868
G3 X120.794 Y131.478 I1.209 J1.133 E.07101
G1 X121.449 Y132.043 E.02868
G2 X123.414 Y132.384 I1.209 J-1.133 E.07101
G1 X124.069 Y131.82 E.02868
G3 X126.035 Y131.478 I1.209 J1.133 E.07101
G1 X126.69 Y132.043 E.02868
G2 X128.655 Y132.384 I1.209 J-1.133 E.07101
G1 X129.311 Y131.82 E.02868
G3 X131.276 Y131.478 I1.209 J1.133 E.07101
G1 X131.931 Y132.043 E.02868
G2 X133.897 Y132.384 I1.209 J-1.133 E.07101
G1 X134.552 Y131.82 E.02868
G3 X136.517 Y131.478 I1.209 J1.133 E.07101
G1 X137.173 Y132.043 E.02868
G2 X139.138 Y132.384 I1.209 J-1.133 E.07101
G1 X139.793 Y131.82 E.02868
G3 X141.759 Y131.478 I1.209 J1.133 E.07101
G1 X142.414 Y132.043 E.02868
G2 X144.379 Y132.384 I1.209 J-1.133 E.07101
G1 X145.035 Y131.82 E.02868
G3 X147 Y131.478 I1.209 J1.133 E.07101
G2 X148.31 Y132.512 I6.437 J-6.812 E.05544
G1 X148.763 Y132.566 E.01511
G2 X149.172 Y129.945 I-44.208 J-8.246 E.08801
G1 X148.966 Y129.969 E.0069
G1 X148.31 Y129.764 E.02278
G1 X147.655 Y129.199 E.02868
G2 X145.69 Y128.858 I-1.209 J1.133 E.07101
G1 X145.035 Y129.422 E.02868
G3 X143.069 Y129.764 I-1.209 J-1.133 E.07101
G1 X142.414 Y129.199 E.02868
G2 X140.448 Y128.858 I-1.209 J1.133 E.07101
G1 X139.793 Y129.422 E.02868
G3 X137.828 Y129.764 I-1.209 J-1.133 E.07101
G1 X137.173 Y129.199 E.02868
G2 X135.207 Y128.858 I-1.209 J1.133 E.07101
G1 X134.552 Y129.422 E.02868
G3 X132.586 Y129.764 I-1.209 J-1.133 E.07101
G1 X131.931 Y129.199 E.02868
G2 X129.966 Y128.858 I-1.209 J1.133 E.07101
G1 X129.311 Y129.422 E.02868
G3 X127.345 Y129.764 I-1.209 J-1.133 E.07101
G1 X126.69 Y129.199 E.02868
G2 X124.724 Y128.858 I-1.209 J1.133 E.07101
G1 X124.069 Y129.422 E.02868
G3 X122.104 Y129.764 I-1.209 J-1.133 E.07101
G1 X121.449 Y129.199 E.02868
G2 X119.483 Y128.858 I-1.209 J1.133 E.07101
G1 X118.828 Y129.422 E.02868
G3 X116.863 Y129.764 I-1.209 J-1.133 E.07101
G1 X116.207 Y129.199 E.02868
G2 X114.242 Y128.858 I-1.209 J1.133 E.07101
G1 X113.587 Y129.422 E.02868
G3 X111.621 Y129.764 I-1.209 J-1.133 E.07101
G1 X110.966 Y129.199 E.02868
G2 X109.001 Y128.858 I-1.209 J1.133 E.07101
G3 X107.69 Y129.891 I-6.436 J-6.81 E.05544
G1 X107.035 Y129.969 E.02189
G1 X106.825 Y129.903 E.00731
G3 X106.752 Y127.315 I21.958 J-1.911 E.08594
G1 X107.035 Y127.349 E.00945
G1 X107.69 Y127.143 E.02278
G1 X108.345 Y126.579 E.02868
G3 X110.311 Y126.237 I1.209 J1.133 E.07101
G1 X110.966 Y126.801 E.02868
G2 X112.932 Y127.143 I1.209 J-1.133 E.07101
G1 X113.587 Y126.579 E.02868
G3 X115.552 Y126.237 I1.209 J1.133 E.07101
G1 X116.207 Y126.801 E.02868
G2 X118.173 Y127.143 I1.209 J-1.133 E.07101
G1 X118.828 Y126.579 E.02868
G3 X120.794 Y126.237 I1.209 J1.133 E.07101
G1 X121.449 Y126.801 E.02868
G2 X123.414 Y127.143 I1.209 J-1.133 E.07101
G1 X124.069 Y126.579 E.02868
G3 X126.035 Y126.237 I1.209 J1.133 E.07101
G1 X126.69 Y126.801 E.02868
G2 X128.655 Y127.143 I1.209 J-1.133 E.07101
G1 X129.311 Y126.579 E.02868
G3 X131.276 Y126.237 I1.209 J1.133 E.07101
G1 X131.931 Y126.801 E.02868
G2 X133.897 Y127.143 I1.209 J-1.133 E.07101
G1 X134.552 Y126.579 E.02868
G3 X136.517 Y126.237 I1.209 J1.133 E.07101
G1 X137.173 Y126.801 E.02868
G2 X139.138 Y127.143 I1.209 J-1.133 E.07101
G1 X139.793 Y126.579 E.02868
G3 X141.759 Y126.237 I1.209 J1.133 E.07101
G1 X142.414 Y126.801 E.02868
G2 X144.379 Y127.143 I1.209 J-1.133 E.07101
G1 X145.035 Y126.579 E.02868
G3 X147 Y126.237 I1.209 J1.133 E.07101
G2 X148.31 Y127.271 I6.437 J-6.812 E.05544
G1 X148.966 Y127.349 E.02189
G1 X149.246 Y127.261 E.00977
G2 X149.008 Y124.723 I-52.223 J3.619 E.08455
G1 X148.31 Y124.522 E.02409
G1 X147.655 Y123.958 E.02868
G2 X145.69 Y123.616 I-1.209 J1.133 E.07101
G1 X145.035 Y124.181 E.02868
G3 X143.069 Y124.522 I-1.209 J-1.133 E.07101
G1 X142.414 Y123.958 E.02868
G2 X140.448 Y123.616 I-1.209 J1.133 E.07101
G1 X139.793 Y124.181 E.02868
G3 X137.828 Y124.522 I-1.209 J-1.133 E.07101
G1 X137.173 Y123.958 E.02868
G2 X135.207 Y123.616 I-1.209 J1.133 E.07101
G1 X134.552 Y124.181 E.02868
G3 X132.586 Y124.522 I-1.209 J-1.133 E.07101
G1 X131.931 Y123.958 E.02868
G2 X129.966 Y123.616 I-1.209 J1.133 E.07101
G1 X129.311 Y124.181 E.02868
G3 X127.345 Y124.522 I-1.209 J-1.133 E.07101
G1 X126.69 Y123.958 E.02868
G2 X124.724 Y123.616 I-1.209 J1.133 E.07101
G1 X124.069 Y124.181 E.02868
G3 X122.104 Y124.522 I-1.209 J-1.133 E.07101
G1 X121.449 Y123.958 E.02868
G2 X119.483 Y123.616 I-1.209 J1.133 E.07101
G1 X118.828 Y124.181 E.02868
G3 X116.863 Y124.522 I-1.209 J-1.133 E.07101
G1 X116.207 Y123.958 E.02868
G2 X114.242 Y123.616 I-1.209 J1.133 E.07101
G1 X113.587 Y124.181 E.02868
G3 X111.621 Y124.522 I-1.209 J-1.133 E.07101
G1 X110.966 Y123.958 E.02868
G2 X109.001 Y123.616 I-1.209 J1.133 E.07101
G3 X107.69 Y124.65 I-6.437 J-6.812 E.05544
G1 X106.993 Y124.715 E.02323
G3 X107.626 Y121.922 I22.528 J3.64 E.09507
G1 X108.345 Y121.337 E.03073
G3 X110.311 Y120.996 I1.209 J1.133 E.07101
G1 X110.966 Y121.56 E.02868
G2 X112.932 Y121.902 I1.209 J-1.133 E.07101
G1 X113.587 Y121.337 E.02868
G3 X115.552 Y120.996 I1.209 J1.133 E.07101
G1 X116.207 Y121.56 E.02868
G2 X118.173 Y121.902 I1.209 J-1.133 E.07101
G1 X118.828 Y121.337 E.02868
G3 X120.794 Y120.996 I1.209 J1.133 E.07101
G1 X121.449 Y121.56 E.02868
G2 X123.414 Y121.902 I1.209 J-1.133 E.07101
G1 X124.069 Y121.337 E.02868
G3 X126.035 Y120.996 I1.209 J1.133 E.07101
G1 X126.69 Y121.56 E.02868
G2 X128.655 Y121.902 I1.209 J-1.133 E.07101
G1 X129.311 Y121.337 E.02868
G3 X131.276 Y120.996 I1.209 J1.133 E.07101
G1 X131.931 Y121.56 E.02868
G2 X133.897 Y121.902 I1.209 J-1.133 E.07101
G1 X134.552 Y121.337 E.02868
G3 X136.517 Y120.996 I1.209 J1.133 E.07101
G1 X137.173 Y121.56 E.02868
G2 X139.138 Y121.902 I1.209 J-1.133 E.07101
G3 X139.987 Y121.198 I4.356 J4.395 E.03662
G2 X141.868 Y121.114 I.752 J-4.245 E.06294
G1 X142.414 Y121.56 E.02339
G2 X144.379 Y121.902 I1.209 J-1.133 E.07101
G1 X145.035 Y121.337 E.02868
G3 X147 Y120.996 I1.209 J1.133 E.07101
G2 X148.31 Y122.03 I6.437 J-6.812 E.05544
G1 X148.407 Y122.041 E.00323
G2 X146.882 Y118.233 I-20.528 J6.012 E.13628
G1 X146.345 Y118.169 E.01794
G1 X145.69 Y118.375 E.02278
G3 X144.379 Y119.409 I-6.436 J-6.81 E.05544
G1 X144.225 Y119.427 E.00517
G2 X144.882 Y116.227 I-3.555 J-2.398 E.11118
G3 X145.423 Y115.817 I2.563 J2.823 E.02255
G2 X144.369 Y114.43 I-14.427 J9.874 E.05783
G1 X144.544 Y114.049 E.01391
G1 X144.379 Y114.168 E.00673
G1 X143.883 Y114.227 E.01657
G2 X142.654 Y113.274 I-3.297 J2.988 E.05186
G1 X142.595 Y113.248 E.00212
M204 S10000
G1 X144.795 Y114.383 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G3 X142.619 Y143.929 I-16.796 J13.616 E.90425
; WIPE_START
G1 X143.1 Y143.478 E-.25077
G1 X143.855 Y142.709 E-.40952
G1 X144.029 Y142.512 E-.09971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.522 Y138.523 Z1.6 F42000
G1 X136.447 Y137.864 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.459861
G1 F8634.329
M204 S6000
G1 X135.929 Y138.419 E.0258
G1 X135.53 Y139.065 E.0258
G1 X135.267 Y139.777 E.02579
G1 X135.151 Y140.527 E.02576
G1 X135.185 Y141.284 E.02575
G1 X135.37 Y142.023 E.0259
G1 X135.697 Y142.709 E.02579
G1 X136.152 Y143.315 E.02577
G1 X136.717 Y143.819 E.02572
G1 X137.374 Y144.202 E.02583
G1 X138.115 Y144.452 E.02658
G1 X138.872 Y144.546 E.02592
G1 X139.605 Y144.492 E.02494
G1 X140.337 Y144.289 E.02583
G1 X141.014 Y143.945 E.02579
G1 X141.609 Y143.475 E.02579
G1 X142.1 Y142.895 E.02579
G1 X142.466 Y142.23 E.0258
G1 X142.693 Y141.505 E.0258
G1 X142.771 Y140.75 E.02581
G1 X142.699 Y139.994 E.0258
G1 X142.478 Y139.267 E.02579
G1 X142.118 Y138.599 E.02579
G1 X141.632 Y138.015 E.02581
G1 X141.041 Y137.54 E.02578
G1 X140.367 Y137.19 E.02579
G1 X139.636 Y136.982 E.02583
G1 X138.904 Y136.918 E.02494
G1 X138.469 Y136.952 E.01484
G1 X137.759 Y137.114 E.02473
G1 X137.066 Y137.424 E.0258
G1 X136.496 Y137.83 E.02376
M204 S10000
G1 X136.955 Y137.982 F42000
; LINE_WIDTH: 0.445048
G1 F8952.379
M204 S6000
G1 X137.54 Y137.64 E.02221
G1 X138.182 Y137.42 E.02222
G1 X138.853 Y137.327 E.02221
G1 X139.543 Y137.388 E.02269
G1 X139.9 Y137.463 E.01193
G1 X140.493 Y137.696 E.02091
G1 X141.065 Y138.06 E.02222
G1 X141.553 Y138.531 E.02221
G1 X141.938 Y139.089 E.02221
G1 X142.205 Y139.711 E.02221
G1 X142.343 Y140.375 E.02221
G1 X142.347 Y141.053 E.02221
G1 X142.217 Y141.718 E.02221
G1 X141.957 Y142.344 E.02221
G1 X141.579 Y142.906 E.0222
G1 X141.097 Y143.382 E.02221
G1 X140.529 Y143.754 E.02222
G1 X139.9 Y144.005 E.02221
G1 X139.234 Y144.127 E.02217
G1 X138.558 Y144.114 E.02216
G1 X137.895 Y143.967 E.02227
G1 X137.261 Y143.684 E.02274
G1 X136.707 Y143.286 E.02234
G1 X136.257 Y142.805 E.0216
G1 X135.9 Y142.229 E.02219
G1 X135.665 Y141.593 E.02223
G1 X135.559 Y140.905 E.02281
G1 X135.59 Y140.246 E.02162
G3 X136.45 Y138.433 I3.639 J.616 E.06658
G1 X136.911 Y138.022 E.02025
M204 S10000
G1 X137.54 Y119.805 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X136.929 Y118.885 I3.435 J-2.943 E.03671
G2 X136.517 Y118.247 I-.978 J.179 E.02585
G2 X135.207 Y118.375 I-.513 J1.519 E.045
G1 X134.552 Y118.939 E.02868
G3 X132.586 Y119.281 I-1.209 J-1.133 E.07101
G1 X131.931 Y118.717 E.02868
G2 X129.966 Y118.375 I-1.209 J1.133 E.07101
G1 X129.311 Y118.939 E.02868
G3 X127.345 Y119.281 I-1.209 J-1.133 E.07101
G1 X126.69 Y118.717 E.02868
G2 X124.724 Y118.375 I-1.209 J1.133 E.07101
G1 X124.069 Y118.939 E.02868
G3 X122.104 Y119.281 I-1.209 J-1.133 E.07101
G2 X120.794 Y118.247 I-6.437 J6.812 E.05544
G1 X120.138 Y118.169 E.02189
G2 X119.686 Y118.565 I1.767 J2.475 E.01998
G3 X118.173 Y119.409 I-7.347 J-11.398 E.0575
G3 X115.853 Y119.319 I-.963 J-5.119 E.07768
M204 S10000
G1 X119.692 Y118.007 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459853
G1 F8634.485
M204 S6000
G1 X120.183 Y117.427 E.0258
G1 X120.549 Y116.762 E.02581
G1 X120.776 Y116.037 E.0258
G1 X120.855 Y115.282 E.0258
G1 X120.782 Y114.526 E.02579
G1 X120.561 Y113.8 E.0258
G1 X120.201 Y113.131 E.02579
G1 X119.715 Y112.547 E.02581
G1 X119.124 Y112.072 E.02579
G1 X118.45 Y111.723 E.02579
G1 X117.719 Y111.514 E.02582
G1 X116.987 Y111.451 E.02494
G1 X116.552 Y111.484 E.01484
G1 X115.842 Y111.647 E.02472
G1 X115.149 Y111.956 E.0258
G1 X114.53 Y112.397 E.0258
G1 X114.012 Y112.951 E.0258
G1 X113.613 Y113.597 E.02579
G1 X113.351 Y114.309 E.02579
G1 X113.234 Y115.059 E.02577
G1 X113.269 Y115.816 E.02575
G1 X113.453 Y116.555 E.02589
G1 X113.78 Y117.241 E.02579
G1 X114.235 Y117.847 E.02575
G1 X114.82 Y118.365 E.02655
G1 X115.482 Y118.745 E.02593
G1 X116.177 Y118.98 E.02493
G1 X116.955 Y119.078 E.02666
G1 X117.688 Y119.024 E.02495
G1 X118.42 Y118.821 E.02582
G1 X119.097 Y118.478 E.02579
G1 X119.645 Y118.044 E.02374
M204 S10000
G1 X119.18 Y117.915 F42000
; LINE_WIDTH: 0.445045
G1 F8952.453
M204 S6000
G1 X118.612 Y118.286 E.02221
G1 X117.983 Y118.537 E.02222
G1 X117.317 Y118.659 E.02217
G1 X116.641 Y118.646 E.02216
G1 X115.978 Y118.5 E.02226
G1 X115.344 Y118.216 E.02275
G1 X114.79 Y117.818 E.02234
G1 X114.34 Y117.337 E.02159
G1 X113.984 Y116.761 E.02219
G1 X113.748 Y116.125 E.02222
G1 X113.642 Y115.437 E.02281
G1 X113.673 Y114.778 E.02162
G3 X114.533 Y112.966 I3.639 J.617 E.06657
G1 X115.039 Y112.514 E.02222
G1 X115.623 Y112.172 E.0222
G1 X116.265 Y111.952 E.02222
G1 X116.936 Y111.86 E.02221
G1 X117.626 Y111.92 E.02269
G1 X117.983 Y111.995 E.01193
G1 X118.577 Y112.228 E.02091
G1 X119.148 Y112.592 E.02221
G1 X119.636 Y113.063 E.02221
G1 X120.021 Y113.621 E.02221
G1 X120.288 Y114.244 E.02221
G1 X120.426 Y114.907 E.02222
G1 X120.43 Y115.585 E.02221
G1 X120.3 Y116.25 E.02222
G1 X120.04 Y116.877 E.02221
G1 X119.662 Y117.439 E.0222
G1 X119.222 Y117.873 E.02024
M204 S10000
G1 X121.193 Y114.475 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G3 X121.188 Y116.094 I-4.107 J.795 E.05402
G1 X121.449 Y116.319 E.01143
G2 X123.414 Y116.66 I1.209 J-1.133 E.07101
G1 X124.069 Y116.096 E.02868
G3 X126.035 Y115.754 I1.209 J1.133 E.07101
G1 X126.69 Y116.319 E.02868
G2 X128.655 Y116.66 I1.209 J-1.133 E.07101
G1 X129.311 Y116.096 E.02868
G3 X131.276 Y115.754 I1.209 J1.133 E.07101
G1 X131.931 Y116.319 E.02868
G2 X133.897 Y116.66 I1.209 J-1.133 E.07101
G1 X134.552 Y116.096 E.02868
G3 X136.517 Y115.754 I1.209 J1.133 E.07101
G1 X136.671 Y115.886 E.0067
G3 X137.793 Y114.01 I3.959 J1.095 E.07342
G1 X137.173 Y113.475 E.02718
G2 X135.207 Y113.134 I-1.209 J1.133 E.07101
G1 X134.552 Y113.698 E.02868
G3 X132.586 Y114.04 I-1.209 J-1.133 E.07101
G1 X131.931 Y113.475 E.02868
G2 X129.966 Y113.134 I-1.209 J1.133 E.07101
G1 X129.311 Y113.698 E.02868
G3 X127.345 Y114.04 I-1.209 J-1.133 E.07101
G1 X126.69 Y113.475 E.02868
G2 X124.724 Y113.134 I-1.209 J1.133 E.07101
G1 X124.069 Y113.698 E.02868
G3 X122.104 Y114.04 I-1.209 J-1.133 E.07101
G2 X120.794 Y113.006 I-6.437 J6.812 E.05544
G1 X120.595 Y112.982 E.00662
G2 X119.476 Y111.815 I-3.579 J2.311 E.05397
M204 S10000
G1 X117.076 Y109.763 F42000
G1 F8843.478
M204 S6000
G2 X115.711 Y110.65 I8.212 J14.127 E.05402
G2 X116.26 Y111.115 I2.88 J-2.842 E.02393
G3 X118.363 Y111.255 I.79 J4.011 E.07071
G1 X118.828 Y110.855 E.02034
G3 X120.794 Y110.513 I1.209 J1.133 E.07101
G1 X121.449 Y111.077 E.02868
G2 X123.414 Y111.419 I1.209 J-1.133 E.07101
G1 X124.069 Y110.855 E.02868
G3 X126.035 Y110.513 I1.209 J1.133 E.07101
G1 X126.69 Y111.077 E.02868
G2 X128.655 Y111.419 I1.209 J-1.133 E.07101
G1 X129.311 Y110.855 E.02868
G3 X131.276 Y110.513 I1.209 J1.133 E.07101
G1 X131.931 Y111.077 E.02868
G2 X133.897 Y111.419 I1.209 J-1.133 E.07101
G1 X134.552 Y110.855 E.02868
G3 X136.517 Y110.513 I1.209 J1.133 E.07101
G1 X137.173 Y111.077 E.02868
G2 X139.138 Y111.419 I1.209 J-1.133 E.07101
G3 X140.182 Y110.576 I5.234 J5.415 E.04455
G2 X135.119 Y107.968 I-13.368 J19.733 E.18937
G1 X134.552 Y108.457 E.02482
G3 X132.586 Y108.798 I-1.209 J-1.133 E.07101
G1 X131.931 Y108.234 E.02868
G2 X129.966 Y107.892 I-1.209 J1.133 E.07101
G1 X129.311 Y108.457 E.02868
G3 X127.345 Y108.798 I-1.209 J-1.133 E.07101
G1 X126.69 Y108.234 E.02868
G2 X124.724 Y107.892 I-1.209 J1.133 E.07101
G1 X124.069 Y108.457 E.02868
G3 X122.104 Y108.798 I-1.209 J-1.133 E.07101
G2 X121.012 Y107.921 I-5.452 J5.668 E.04653
G3 X122.569 Y107.446 I7.663 J22.348 E.054
M204 S10000
G1 X115.07 Y110.671 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G3 X142.883 Y112.315 I12.93 J17.343 E.83868
; WIPE_START
G1 X142.31 Y111.784 E-.29658
G1 X141.485 Y111.091 E-.40969
G1 X141.372 Y111.005 E-.05373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.009 Y116.436 Z1.6 F42000
G1 X111.176 Y141.581 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F10588.235
M204 S6000
G3 X114.421 Y111.171 I16.809 J-13.585 E.94129
M204 S10000
G1 X113.689 Y112.691 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G2 X112.969 Y114.141 I3.518 J2.65 E.05398
G1 X112.276 Y114.246 E.02324
G1 X111.892 Y114.125 E.01336
G2 X110.503 Y115.92 I17.677 J15.117 E.07532
G1 X110.966 Y116.319 E.02028
G2 X112.932 Y116.66 I1.209 J-1.133 E.07101
G1 X113.027 Y116.578 E.00416
G2 X114.209 Y118.404 I3.951 J-1.264 E.07299
G1 X113.587 Y118.939 E.02723
G3 X111.621 Y119.281 I-1.209 J-1.133 E.07101
G1 X110.966 Y118.717 E.02868
G2 X109.054 Y118.358 I-1.198 J1.111 E.06913
G2 X108.368 Y119.834 I23.173 J11.666 E.054
M204 S10000
G1 X137.928 Y119.623 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.459841
G1 F8634.744
M204 S6000
G1 X138.495 Y120.128 E.0258
G1 X139.151 Y120.511 E.0258
G1 X139.87 Y120.755 E.02581
G1 X140.622 Y120.853 E.02575
G1 X141.376 Y120.8 E.02567
G1 X142.133 Y120.588 E.02671
G1 X142.789 Y120.253 E.02502
G1 X143.403 Y119.764 E.02666
G1 X143.876 Y119.203 E.02495
G1 X144.241 Y118.537 E.02579
G1 X144.468 Y117.813 E.02577
G1 X144.546 Y117.032 E.02667
G1 X144.474 Y116.302 E.02494
G1 X144.254 Y115.575 E.0258
G1 X143.893 Y114.907 E.02579
G1 X143.407 Y114.323 E.02581
G1 X142.816 Y113.847 E.0258
G1 X142.142 Y113.498 E.02577
G1 X141.411 Y113.289 E.02582
G1 X140.68 Y113.226 E.02495
G1 X140.244 Y113.259 E.01484
G1 X139.534 Y113.422 E.02473
G1 X138.841 Y113.732 E.02581
G1 X138.223 Y114.172 E.02578
G1 X137.704 Y114.726 E.02579
G1 X137.305 Y115.373 E.02581
G1 X137.043 Y116.085 E.0258
G1 X136.926 Y116.835 E.02578
G1 X136.961 Y117.594 E.02581
G1 X137.145 Y118.331 E.02579
G1 X137.472 Y119.016 E.0258
G1 X137.892 Y119.575 E.02376
M204 S10000
G1 X138.032 Y119.112 F42000
; LINE_WIDTH: 0.445028
G1 F8952.835
M204 S6000
G1 X137.676 Y118.536 E.02219
G1 X137.44 Y117.901 E.02222
G1 X137.335 Y117.213 E.02281
G1 X137.365 Y116.554 E.02161
G3 X138.225 Y114.741 I3.64 J.617 E.06658
G1 X138.731 Y114.289 E.02221
G1 X139.316 Y113.947 E.0222
G1 X139.957 Y113.727 E.02222
G1 X140.629 Y113.635 E.0222
G1 X141.319 Y113.695 E.0227
G1 X141.675 Y113.77 E.01193
G1 X142.269 Y114.003 E.02089
G1 X142.84 Y114.368 E.02222
G1 X143.328 Y114.838 E.02221
G1 X143.714 Y115.396 E.02221
G1 X143.981 Y116.019 E.02221
G1 X144.119 Y116.683 E.02222
G1 X144.122 Y117.361 E.02221
G1 X143.992 Y118.026 E.02221
G1 X143.733 Y118.652 E.02221
G1 X143.354 Y119.214 E.0222
G1 X142.872 Y119.69 E.02221
G1 X142.305 Y120.062 E.02222
G1 X141.675 Y120.312 E.0222
G1 X141.009 Y120.434 E.02217
G1 X140.334 Y120.422 E.02214
G1 X139.67 Y120.275 E.02228
G1 X139.053 Y120.002 E.02209
G1 X138.485 Y119.596 E.02287
G1 X138.073 Y119.156 E.01975
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8952.835
G1 X138.485 Y119.596 E-.22907
G1 X139.053 Y120.002 E-.26522
G1 X139.67 Y120.275 E-.25623
G1 X139.694 Y120.28 E-.00947
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/76
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S158.1
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.6 I-1.214 J-.088 P1  F42000
G1 X138.41 Y137.991 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.61 Y137.955 E.00674
G1 X138.889 Y137.934 E.00927
G3 X138.335 Y138.004 I.07 J2.798 E.56472
G1 X138.351 Y138.001 E.00053
M204 S10000
G1 X138.475 Y138.402 F42000
G1 F5400
M204 S6000
G1 X138.661 Y138.36 E.00633
G1 X138.899 Y138.342 E.00792
G3 X138.196 Y138.466 I.06 J2.39 E.47461
G1 X138.416 Y138.415 E.00749
M204 S250
G1 X138.562 Y138.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X138.71 Y138.749 E.00466
G1 X138.909 Y138.734 E.00613
G3 X138.321 Y138.838 I.05 J1.998 E.36751
G1 X138.503 Y138.796 E.00573
; WIPE_START
M204 S6000
G1 X138.71 Y138.749 E-.08041
G1 X138.909 Y138.734 E-.07584
G1 X139.306 Y138.764 E-.15132
G1 X139.5 Y138.808 E-.07581
G1 X139.871 Y138.954 E-.15139
G1 X140.206 Y139.17 E-.15134
G1 X140.345 Y139.306 E-.0739
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.158 Y131.676 Z1.8 F42000
G1 X139.736 Y114.429 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.842 Y114.387 E.00379
G3 X140.385 Y114.263 I.891 J2.652 E.01851
G1 X140.664 Y114.242 E.00927
G3 X139.582 Y114.489 I.069 J2.797 E.54605
G1 X139.68 Y114.451 E.00348
M204 S10000
G1 X139.88 Y114.815 F42000
G1 F5400
M204 S6000
G1 X139.972 Y114.773 E.00335
G3 X140.436 Y114.667 I.762 J2.266 E.01582
G1 X140.674 Y114.649 E.00792
G3 X139.538 Y114.97 I.059 J2.39 E.45869
G1 X139.825 Y114.84 E.01047
M204 S250
G1 X140.041 Y115.171 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X140.097 Y115.145 E.0019
G3 X140.485 Y115.057 I.637 J1.895 E.01225
G1 X140.684 Y115.042 E.00613
G3 X139.734 Y115.309 I.05 J1.998 E.35522
G1 X139.986 Y115.196 E.0085
; WIPE_START
M204 S6000
G1 X140.097 Y115.145 E-.04634
G1 X140.485 Y115.057 E-.15124
G1 X140.684 Y115.042 E-.07584
G1 X141.081 Y115.072 E-.15131
G1 X141.465 Y115.18 E-.15141
G1 X141.819 Y115.361 E-.15136
G1 X141.886 Y115.415 E-.0325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.265 Y115.827 Z1.8 F42000
G1 X114.762 Y116.883 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.604 Y116.641 E.00959
G3 X116.693 Y112.487 I2.438 J-1.376 E.18197
G1 X116.972 Y112.467 E.00927
G3 X114.814 Y116.96 I.07 J2.798 E.37948
G1 X114.795 Y116.933 E.00112
M204 S10000
G1 X115.101 Y116.659 F42000
G1 F5400
M204 S6000
G1 X114.959 Y116.441 E.00865
G3 X116.744 Y112.892 I2.083 J-1.176 E.15549
G1 X116.982 Y112.874 E.00792
G3 X115.138 Y116.713 I.06 J2.391 E.3243
G1 X115.135 Y116.709 E.00016
M204 S250
G1 X115.428 Y116.444 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X115.306 Y116.245 E.00719
G3 X116.793 Y113.281 I1.736 J-.984 E.12025
G1 X116.992 Y113.266 E.00613
G3 X115.469 Y116.489 I.05 J1.994 E.24977
; WIPE_START
M204 S6000
G1 X115.306 Y116.245 E-.11136
G1 X115.14 Y115.884 E-.15109
G1 X115.055 Y115.495 E-.15125
G1 X115.044 Y115.165 E-.12536
G1 X115.103 Y114.773 E-.15082
G1 X115.166 Y114.599 E-.07011
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.987 Y122.187 Z1.8 F42000
G1 X117.642 Y137.482 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.725 Y137.62 E.00533
G3 X114.918 Y136.18 I-2.459 J1.338 E.47227
G1 X115.196 Y136.159 E.00927
G3 X117.579 Y137.381 I.07 J2.798 E.09264
G1 X117.61 Y137.431 E.00194
M204 S10000
G1 X117.294 Y137.704 F42000
G1 F5400
M204 S6000
G1 X117.471 Y138.029 E.01229
G3 X114.968 Y136.584 I-2.205 J.928 E.39565
G1 X115.206 Y136.566 E.00792
G3 X117.243 Y137.611 I.06 J2.391 E.07915
G1 X117.265 Y137.651 E.00152
M204 S250
G1 X116.951 Y137.89 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2160
M204 S5000
G1 X117.106 Y138.183 E.01018
G3 X115.017 Y136.974 I-1.84 J.77 E.30553
G1 X115.216 Y136.959 E.00613
G3 X116.917 Y137.833 I.049 J1.994 E.06127
G1 X116.92 Y137.839 E.0002
; WIPE_START
M204 S6000
G1 X117.106 Y138.183 E-.14863
G1 X117.227 Y138.562 E-.15115
G1 X117.266 Y138.957 E-.15088
G1 X117.239 Y139.285 E-.12522
G1 X117.134 Y139.672 E-.1524
G1 X117.097 Y139.747 E-.03171
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.538 Y138.052 Z1.8 F42000
G1 X149.544 Y132.355 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X114.289 Y110.807 I-21.552 J-4.353 E2.80092
G3 X128.881 Y106.033 I13.722 J17.254 E.52019
G3 X149.556 Y132.296 I-.889 J21.969 E1.25955
M204 S10000
G1 X149.943 Y132.436 F42000
G1 F5400
M204 S6000
G3 X114.035 Y110.489 I-21.951 J-4.434 E2.85275
G3 X128.901 Y105.626 I13.976 J17.573 E.52996
G3 X149.954 Y132.377 I-.91 J22.376 E1.28276
M204 S250
G1 X150.338 Y132.517 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.075 Y133.621 E.03487
G3 X112.92 Y110.913 I-22.083 J-5.619 E2.61899
G3 X128.921 Y105.235 I15.065 J17.069 E.53461
G3 X150.338 Y132.465 I-.929 J22.768 E1.2093
; WIPE_START
M204 S6000
G1 X150.075 Y133.621 E-.45035
G1 X149.862 Y134.407 E-.30965
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


G1 X146.152 Y140.106 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40042
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X147.612 Y137.088 E.17202
G2 X148.955 Y133.321 I-20.241 J-9.342 E.20543
G1 X145.087 Y141.24 E.45219
G3 X143.928 Y142.617 I-14.37 J-10.922 E.09236
G1 X149.324 Y131.535 E.63239
G2 X149.516 Y130.112 I-32.318 J-5.09 E.07371
G1 X142.934 Y143.628 E.77134
G1 X142.627 Y143.913 E.02153
G1 X142.323 Y143.854 E.01586
G1 X149.598 Y128.915 E.85248
G2 X149.617 Y127.848 I-10.683 J-.725 E.05482
G1 X141.212 Y145.107 E.98496
G1 X140.794 Y145.423 E.02689
G3 X140.429 Y145.685 I-2.801 J-3.518 E.02305
M73 P41 R17
G1 X149.59 Y126.874 E1.07353
G1 X149.523 Y125.982 E.04587
G1 X142.514 Y140.375 E.82139
G2 X142.364 Y139.655 I-4.579 J.577 E.03781
G1 X149.426 Y125.153 E.82759
G2 X149.307 Y124.369 I-7.917 J.801 E.04071
G1 X142.133 Y139.1 E.84067
G2 X141.854 Y138.645 I-3.565 J1.876 E.02741
M73 P41 R16
G1 X149.17 Y123.621 E.85739
G1 X149.01 Y122.92 E.03686
G1 X141.538 Y138.266 E.87572
G2 X141.193 Y137.945 I-1.776 J1.564 E.0242
G1 X148.836 Y122.251 E.89564
G2 X148.651 Y121.6 I-6.624 J1.527 E.03469
G1 X140.818 Y137.686 E.91796
G2 X140.419 Y137.477 I-1.244 J1.891 E.02316
G1 X148.447 Y120.992 E.94077
G2 X148.235 Y120.397 I-6.073 J1.826 E.03239
G1 X139.996 Y137.317 E.96556
G2 X139.547 Y137.21 I-1.425 J5.002 E.02369
G1 X148.012 Y119.828 E.99199
G2 X147.778 Y119.279 I-7.963 J3.076 E.03059
G1 X139.067 Y137.166 E1.02075
G2 X138.557 Y137.184 I-.163 J2.555 E.02623
G1 X147.537 Y118.745 E1.05227
G2 X147.283 Y118.236 I-5.227 J2.283 E.02918
G1 X138.003 Y137.295 E1.08761
G2 X137.388 Y137.528 I.982 J3.517 E.03376
G1 X147.026 Y117.735 E1.1295
G2 X146.757 Y117.26 I-4.888 J2.458 E.02805
G1 X136.654 Y138.006 E1.18391
G2 X135.389 Y140.604 I2.276 J2.716 E.15276
G1 X131.111 Y149.389 E.50133
G3 X130.573 Y149.464 I-1.022 J-5.347 E.02786
G1 X146.485 Y116.789 E1.8647
G2 X146.201 Y116.343 I-4.614 J2.622 E.02714
G1 X130.047 Y149.517 E1.89316
G3 X129.522 Y149.565 I-.74 J-5.221 E.02702
G1 X145.916 Y115.901 E1.92113
G2 X145.619 Y115.481 I-4.37 J2.767 E.0264
G1 X129.009 Y149.591 E1.94657
G3 X128.497 Y149.614 I-.491 J-5.124 E.02633
G1 X143.025 Y119.781 E1.70253
G3 X142.293 Y120.254 I-1.8 J-1.978 E.04493
G1 X127.996 Y149.614 E1.67549
G1 X127.495 Y149.614 E.0257
G1 X141.678 Y120.488 E1.66215
G3 X141.128 Y120.589 I-.762 J-2.614 E.02874
G1 X137.816 Y127.389 E.3881
G3 X137.415 Y127.184 I.169 J-.823 E.0234
G1 X140.616 Y120.612 E.37502
G3 X140.139 Y120.561 I.016 J-2.401 E.02461
G1 X137.051 Y126.903 E.36192
G3 X136.696 Y126.604 I5.592 J-7.005 E.02383
G1 X139.69 Y120.456 E.35087
G3 X139.265 Y120.3 I.568 J-2.201 E.02327
G1 X136.309 Y126.369 E.34635
G2 X135.872 Y126.239 I-.51 J.913 E.02361
G1 X138.868 Y120.086 E.35113
G3 X138.495 Y119.822 I1.132 J-1.995 E.02346
G1 X135.404 Y126.17 E.36224
G1 X135.144 Y126.131 E.01352
G1 X133.913 Y128.658 E.14419
G1 X134.113 Y128.821 E.01324
G1 X124.153 Y149.274 E1.16718
G1 X123.697 Y149.181 E.02387
G1 X138.148 Y119.506 E1.69351
G3 X137.833 Y119.124 I3.313 J-3.052 E.02542
G1 X123.241 Y149.089 E1.71005
G3 X122.794 Y148.978 I.889 J-4.533 E.02364
G1 X137.555 Y118.667 E1.72977
G3 X137.327 Y118.107 I3.374 J-1.698 E.03109
G1 X122.349 Y148.865 E1.75529
G3 X121.908 Y148.74 I1.033 J-4.483 E.02349
G1 X137.367 Y116.996 E1.81156
M106 S158.1
; WIPE_START
G1 X136.491 Y118.794 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P42 R16
G1 X141.891 Y113.878 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X142.721 Y112.174 E.09726
G1 X142.376 Y111.854 E.02415
G1 X141.543 Y113.565 E.09764
G2 X141.079 Y113.487 I-.619 J2.277 E.02414
G1 X142.022 Y111.551 E.1105
G1 X141.667 Y111.253 E.02382
G1 X140.585 Y113.473 E.12672
G2 X140.053 Y113.537 I.053 J2.688 E.02754
G1 X141.306 Y110.964 E.14682
G1 X140.94 Y110.687 E.02356
G1 X139.472 Y113.702 E.17208
G1 X139.446 Y113.712 E.00142
G2 X138.808 Y114.036 I1.292 J3.338 E.03674
G1 X140.573 Y110.412 E.20678
G1 X140.197 Y110.156 E.02336
G1 X121.473 Y148.606 E2.19423
G3 X121.039 Y148.468 I1.164 J-4.41 E.02337
G1 X139.821 Y109.9 E2.20099
G2 X139.437 Y109.659 I-2.603 J3.72 E.02325
G1 X120.613 Y148.313 E2.20589
G1 X120.188 Y148.158 E.02324
G1 X139.051 Y109.423 E2.21052
G2 X138.661 Y109.195 I-2.485 J3.797 E.02319
G1 X119.77 Y147.987 E2.21378
G1 X119.355 Y147.811 E.02314
G1 X138.265 Y108.979 E2.21609
G1 X137.869 Y108.763 E.02313
G1 X118.943 Y147.628 E2.21793
G1 X118.537 Y147.433 E.02311
G1 X137.463 Y108.568 E2.21794
G1 X137.057 Y108.372 E.02311
G1 X118.131 Y147.237 E2.21793
G1 X117.735 Y147.021 E.02313
G1 X136.646 Y108.189 E2.21609
G1 X136.23 Y108.013 E.02314
G1 X117.339 Y146.806 E2.21378
G3 X116.95 Y146.577 I2.093 J-4.022 E.02319
G1 X135.812 Y107.842 E2.21052
G1 X135.387 Y107.688 E.02324
G1 X116.563 Y146.341 E2.20589
G3 X116.18 Y146.101 I2.222 J-3.967 E.02325
G1 X134.961 Y107.533 E2.20099
G2 X134.528 Y107.395 I-1.6 J4.279 E.02337
G1 X115.804 Y145.844 E2.19423
G1 X115.428 Y145.588 E.02336
G1 X117.189 Y141.97 E.20647
G3 X116.528 Y142.299 I-2.598 J-4.397 E.03791
G1 X115.06 Y145.313 E.17204
G1 X114.694 Y145.036 E.02356
G1 X115.946 Y142.465 E.14671
G3 X115.416 Y142.526 I-.878 J-5.33 E.02741
G1 X114.334 Y144.748 E.12679
G1 X113.978 Y144.449 E.02382
G1 X114.921 Y142.512 E.11054
G3 X114.456 Y142.439 I.606 J-5.343 E.02417
G1 X113.624 Y144.146 E.09745
G1 X113.279 Y143.826 E.02415
G1 X114.109 Y142.122 E.09728
M106 S158.1
M204 S10000
G1 X112.278 Y140.014 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.400232
; LAYER_HEIGHT: 0.2
G1 F10075.25
M204 S6000
G1 X112.133 Y139.431 E.01747
G1 X112.101 Y138.8 E.0184
G1 X112.196 Y138.177 E.01836
G1 X112.411 Y137.584 E.01837
G1 X112.741 Y137.045 E.01839
G1 X113.17 Y136.583 E.01837
G1 X113.683 Y136.214 E.0184
G3 X115.17 Y135.785 I1.685 J3.05 E.04545
G1 X115.816 Y135.838 E.01888
G1 X116.424 Y136.009 E.01838
G1 X116.985 Y136.297 E.01837
G1 X117.478 Y136.69 E.01837
M73 P43 R16
G1 X117.884 Y137.174 E.01838
G1 X118.186 Y137.727 E.01836
G1 X118.372 Y138.331 E.01838
G1 X118.436 Y138.936 E.01773
G1 X118.369 Y139.586 E.01904
G1 X118.188 Y140.19 E.01835
G1 X117.885 Y140.744 E.01838
G1 X117.495 Y141.211 E.01773
G1 X116.985 Y141.621 E.01905
G1 X116.446 Y141.902 E.01771
G1 X115.837 Y142.077 E.01844
G1 X115.187 Y142.121 E.01898
G1 X114.562 Y142.048 E.01831
G1 X113.803 Y141.776 E.02348
M204 S10000
G1 X112.794 Y143.329 F42000
; LINE_WIDTH: 0.418756
G1 F9578.654
M204 S6000
G1 X113.516 Y141.848 E.05044
G1 X113.684 Y141.745 E.00606
G1 X113.746 Y141.756 E.00193
G1 X113.168 Y141.364 E.02138
G1 X112.733 Y140.901 E.01947
G1 X112.398 Y140.36 E.01947
G1 X112.278 Y140.014 E.01123
G1 X112.178 Y140.315 E.00973
G3 X111.43 Y141.853 I-462.595 J-223.957 E.05236
G2 X112.752 Y143.286 I17.706 J-15.001 E.05974
M204 S10000
G1 X113.122 Y141.795 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X112.864 Y141.596 E.01003
G1 X112.457 Y141.157 E.01839
G1 X112.302 Y140.925 E.00858
G1 X111.879 Y141.794 E.02969
G2 X112.689 Y142.684 I8.749 J-7.153 E.03701
G1 X113.096 Y141.849 E.02853
M204 S10000
G1 X112.575 Y141.924 F42000
; LINE_WIDTH: 0.5338
G1 F7333.768
M204 S6000
G1 X112.434 Y141.768 E.0084
M204 S10000
G1 X110.889 Y141.534 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40042
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X111.776 Y139.711 E.10403
G3 X111.697 Y138.846 I3.622 J-.771 E.04465
G1 X110.679 Y140.935 E.11919
G1 X110.381 Y140.52 E.02625
G1 X126.991 Y106.409 E1.94659
G3 X127.504 Y106.386 I.491 J5.12 E.02633
G1 X112.976 Y136.219 E1.70251
G3 X113.707 Y135.746 I2.357 J2.844 E.04478
G1 X128.005 Y106.386 E1.67553
G1 X128.506 Y106.386 E.0257
G1 X114.32 Y135.516 E1.66241
G3 X114.874 Y135.408 I1.054 J3.924 E.02897
G1 X128.996 Y106.409 E1.65493
G1 X129.485 Y106.433 E.02513
G1 X115.383 Y135.391 E1.65254
G3 X115.862 Y135.436 I.015 J2.417 E.02473
G1 X129.966 Y106.475 E1.65274
G1 X130.443 Y106.523 E.02463
G1 X116.311 Y135.544 E1.65618
G3 X116.734 Y135.704 I-.591 J2.191 E.02324
G1 X130.916 Y106.581 E1.66199
G1 X131.382 Y106.652 E.02422
G1 X117.132 Y135.914 E1.66994
G3 X117.506 Y136.175 I-3.045 J4.77 E.0234
G1 X131.847 Y106.726 E1.68055
G1 X132.303 Y106.819 E.02387
G1 X117.851 Y136.496 E1.69363
G3 X118.167 Y136.876 I-1.738 J1.766 E.0254
G1 X132.759 Y106.911 E1.71005
G3 X133.206 Y107.022 I-.891 J4.539 E.02364
G1 X118.445 Y137.333 E1.72979
G3 X118.676 Y137.889 I-2.665 J1.429 E.03093
G1 X133.652 Y107.135 E1.75505
G3 X134.092 Y107.26 I-1.031 J4.474 E.02349
G1 X118.634 Y139.004 E1.81153
M106 S158.1
; WIPE_START
G1 X119.509 Y137.206 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.253 Y139.571 Z1.8 F42000
G1 X109.981 Y140.311 Z1.8
G1 Z1.4
G1 E.8 F1800
M106 S255
G1 F3000
M204 S6000
G1 X126.478 Y106.435 E1.93323
G2 X125.954 Y106.483 I.217 J5.279 E.02702
G1 X109.799 Y139.657 E1.89318
G3 X109.515 Y139.211 I4.327 J-3.066 E.02714
G1 X125.427 Y106.536 E1.86472
G2 X124.89 Y106.611 I.483 J5.417 E.02786
G1 X120.609 Y115.401 E.50165
G2 X120.536 Y114.523 I-3.803 J-.126 E.04533
G1 X124.349 Y106.692 E.44686
G2 X123.796 Y106.799 I.789 J5.589 E.0289
G1 X120.341 Y113.894 E.40491
G2 X120.082 Y113.396 I-4.002 J1.763 E.0288
G1 X123.24 Y106.911 E.3701
G2 X122.67 Y107.054 I1.14 J5.775 E.03018
G1 X119.785 Y112.977 E.33803
G2 X119.452 Y112.633 I-4.061 J3.6 E.02459
G1 X122.097 Y107.202 E.3099
G1 X121.507 Y107.384 E.03165
G1 X119.092 Y112.344 E.28304
G2 X118.707 Y112.106 I-1.38 J1.802 E.02327
G1 X120.911 Y107.579 E.25832
G1 X120.302 Y107.801 E.03325
G1 X118.295 Y111.922 E.23517
G2 X117.858 Y111.791 I-.87 J2.115 E.02346
G1 X119.679 Y108.052 E.21339
G2 X119.046 Y108.322 I2.401 J6.494 E.03532
G1 X117.395 Y111.713 E.1935
G2 X116.902 Y111.697 I-.391 J4.482 E.02533
G1 X118.392 Y108.637 E.1746
G2 X117.721 Y108.987 I3.163 J6.893 E.03884
G1 X116.37 Y111.76 E.15825
G2 X115.79 Y111.923 I.704 J3.624 E.03096
G1 X117.032 Y109.372 E.14554
G1 X116.319 Y109.808 E.04289
G1 X114.943 Y112.633 E.1612
M106 S158.1
M204 S10000
G1 X114.698 Y110.915 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F10588.235
M204 S6000
G1 X114.676 Y110.952 E.00118
M73 P44 R16
G1 X114.613 Y110.915 E.00204
G1 X114.624 Y110.908 E.00038
M204 S10000
G1 X113.674 Y115.238 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40042
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X106.477 Y130.019 E.84347
G2 X106.574 Y130.848 I8.344 J-.557 E.04286
G1 X113.638 Y116.342 E.82782
G2 X113.867 Y116.9 I3.563 J-1.136 E.031
G1 X106.693 Y131.632 E.84071
G2 X106.83 Y132.38 I7.561 J-.997 E.03902
G1 X114.146 Y117.356 E.85738
G2 X114.462 Y117.736 I3.586 J-2.655 E.02538
G1 X106.99 Y133.08 E.87565
G2 X107.165 Y133.75 I6.798 J-1.417 E.03553
G1 X114.81 Y118.05 E.89595
G2 X115.182 Y118.315 I1.481 J-1.689 E.02347
G1 X107.349 Y134.4 E.91796
G1 X107.554 Y135.009 E.03295
G1 X115.58 Y118.526 E.94062
G2 X116.005 Y118.683 I1.923 J-4.569 E.02324
G1 X107.765 Y135.603 E.96562
G1 X107.989 Y136.173 E.0314
G1 X116.455 Y118.787 E.99216
G2 X116.854 Y118.83 I.404 J-1.871 E.02064
G1 X116.932 Y118.836 E.00402
G1 X108.223 Y136.721 E1.02066
G1 X108.464 Y137.255 E.03006
G1 X117.444 Y118.813 E1.05244
G2 X117.996 Y118.71 I-.241 J-2.807 E.02883
G1 X108.717 Y137.764 E1.08738
G1 X108.974 Y138.265 E.0289
G1 X118.611 Y118.474 E1.12944
G2 X119.347 Y117.992 I-1.102 J-2.486 E.0453
G1 X109.136 Y138.96 E1.19657
M106 S158.1
M204 S10000
G1 X106.234 Y129.488 F42000
M106 S255
G1 F3000
M204 S6000
G1 X115.571 Y110.314 E1.09422
G2 X115.18 Y110.596 I2.623 J4.055 E.02475
G1 X114.832 Y111.311 E.04079
G1 X114.616 Y111.246 E.01154
G1 X106.383 Y128.153 E.96483
G3 X106.402 Y127.085 I10.7 J-.344 E.05482
G1 X113.959 Y111.566 E.88563
G2 X113.066 Y112.371 I7.627 J9.359 E.06171
G1 X106.484 Y125.889 E.77143
G1 X106.487 Y125.848 E.00214
G3 X106.676 Y124.466 I13.932 J1.202 E.07158
G1 X112.073 Y113.382 E.63252
G2 X110.882 Y114.799 I15.118 J13.919 E.09497
G1 X107.044 Y122.68 E.44978
G1 X107.048 Y122.665 E.00078
G3 X108.513 Y118.635 I20.923 J5.326 E.22037
G1 X109.849 Y115.892 E.15657
M106 S158.1
; WIPE_START
G1 X108.974 Y117.69 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.606 Y117.73 Z1.8 F42000
G1 X119.017 Y117.743 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395101
; LAYER_HEIGHT: 0.2
G1 F10222.027
M204 S6000
G1 X119.469 Y117.303 E.01809
G1 X119.824 Y116.781 E.01812
G1 X120.069 Y116.2 E.01811
G1 X120.194 Y115.581 E.01811
G1 X120.194 Y114.951 E.01809
G1 X120.069 Y114.332 E.01812
G2 X119.27 Y113.004 I-3.395 J1.14 E.04482
G1 X118.779 Y112.609 E.01811
G1 X118.218 Y112.317 E.01815
G1 X117.61 Y112.143 E.01815
G1 X116.98 Y112.092 E.01814
G1 X116.352 Y112.167 E.01814
G1 X115.751 Y112.365 E.01814
G1 X115.202 Y112.678 E.01814
G1 X114.726 Y113.094 E.01815
G1 X114.341 Y113.596 E.01815
G1 X114.064 Y114.164 E.01813
G1 X113.905 Y114.776 E.01816
G1 X113.879 Y115.402 E.01797
G1 X113.97 Y116.049 E.01875
G1 X114.186 Y116.641 E.01809
G1 X114.516 Y117.18 E.01812
G1 X114.929 Y117.627 E.01749
G1 X115.459 Y118.012 E.01879
G1 X116.033 Y118.27 E.01807
G1 X116.649 Y118.414 E.01814
M73 P44 R15
G1 X117.279 Y118.421 E.01809
G1 X117.9 Y118.316 E.01808
G1 X118.487 Y118.086 E.0181
G1 X118.967 Y117.776 E.0164
M204 S10000
G1 X136.421 Y127.996 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8843.478
M204 S6000
G1 X136.921 Y127.859 E.0172
G1 X136.609 Y128.924 E.03682
G1 X137.106 Y129.345 E.02161
G1 X137.819 Y127.881 E.05401
M204 S10000
G1 X137.123 Y138.152 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.384735
G1 F10532.034
M204 S6000
G1 X136.648 Y138.567 E.01757
G1 X136.264 Y139.068 E.01758
G1 X135.987 Y139.635 E.01757
G1 X135.828 Y140.246 E.01758
G1 X135.806 Y141.071 E.02299
G1 X135.938 Y141.697 E.01782
G1 X136.189 Y142.277 E.01759
G1 X136.552 Y142.798 E.01769
G1 X136.939 Y143.176 E.01508
G1 X137.476 Y143.534 E.01797
G1 X138.223 Y143.82 E.02229
G1 X138.902 Y143.905 E.01904
G1 X139.491 Y143.864 E.01647
G1 X140.103 Y143.695 E.01766
G1 X140.667 Y143.41 E.0176
G1 X141.163 Y143.018 E.01761
G1 X141.572 Y142.536 E.01761
G1 X141.877 Y141.983 E.01761
G1 X142.067 Y141.38 E.0176
G2 X142.134 Y140.734 I-10.587 J-1.436 E.01809
G1 X142.074 Y140.121 E.01714
G1 X141.891 Y139.517 E.0176
G1 X141.591 Y138.96 E.01761
G1 X141.187 Y138.473 E.01761
G1 X140.696 Y138.076 E.0176
G1 X140.134 Y137.785 E.01761
G1 X139.526 Y137.61 E.01762
G1 X138.896 Y137.56 E.0176
G1 X138.269 Y137.642 E.01762
G1 X137.671 Y137.84 E.01757
G1 X137.175 Y138.123 E.0159
; WIPE_START
G1 X137.671 Y137.84 E-.21695
G1 X138.269 Y137.642 E-.23965
G1 X138.896 Y137.56 E-.24035
G1 X139.062 Y137.573 E-.06306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.316 Y144.235 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F10588.235
M204 S6000
G1 X142.295 Y144.272 E.00118
G1 X142.231 Y144.235 E.00204
G1 X142.243 Y144.228 E.00038
M204 S10000
G1 X139.517 Y146.529 F42000
; FEATURE: Bridge
; LINE_WIDTH: 0.40042
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
M204 S6000
G1 X140.87 Y143.752 E.15848
G3 X140.21 Y144.079 I-2.166 J-3.543 E.03785
G1 X138.969 Y146.627 E.14541
G3 X138.28 Y147.013 I-7.411 J-12.427 E.04051
G1 X139.629 Y144.242 E.15812
G3 X139.099 Y144.301 I-.731 J-4.155 E.02737
G1 X137.609 Y147.362 E.17469
G1 X136.954 Y147.678 E.03727
G1 X138.606 Y144.287 E.1935
G3 X138.142 Y144.211 I.436 J-4.109 E.02413
G1 X136.322 Y147.948 E.21328
G3 X135.698 Y148.199 I-2.831 J-6.126 E.03449
G1 X137.706 Y144.077 E.23522
G3 X137.295 Y143.892 I.737 J-2.186 E.02316
G1 X135.089 Y148.421 E.25843
G3 X134.493 Y148.616 I-3.004 J-8.168 E.03218
G1 X136.907 Y143.659 E.2829
G3 X136.547 Y143.369 I3.736 J-5.019 E.02371
G1 X133.904 Y148.798 E.30979
G3 X133.331 Y148.946 I-1.776 J-5.673 E.0304
G1 X136.217 Y143.02 E.33822
G3 X135.916 Y142.608 I1.906 J-1.708 E.02619
G1 X132.76 Y149.089 E.36984
G1 X132.204 Y149.201 E.02909
G1 X135.661 Y142.102 E.40513
G3 X135.466 Y141.474 I3.315 J-1.374 E.03379
G1 X131.544 Y149.529 E.45966
M106 S158.1
M204 S10000
G1 X126.908 Y149.789 F42000
M106 S255
G1 F3000
M204 S6000
G1 X136.336 Y130.429 E1.10484
G1 X135.915 Y130.266 E.02319
G1 X126.516 Y149.567 E1.10147
G3 X126.035 Y149.525 I.176 J-4.837 E.02477
G1 X136.284 Y128.479 E1.20109
G1 X135.706 Y128.637 E.03077
G1 X125.557 Y149.477 E1.1893
G3 X125.085 Y149.419 I.352 J-4.762 E.02443
G1 X134.939 Y129.182 E1.15488
G1 X134.742 Y129.334 E.01278
G1 X134.472 Y129.113 E.01789
G1 X124.525 Y149.539 E1.16565
M106 S158.1
M204 S10000
G1 X144.041 Y117.694 F42000
M106 S255
G1 F3000
M204 S6000
G1 X145.321 Y115.065 E.15002
G2 X145.013 Y114.668 I-4.136 J2.883 E.02579
G1 X144.072 Y116.6 E.11026
M106 S158.1
M204 S10000
G1 X143.711 Y115.925 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.399223
; LAYER_HEIGHT: 0.2
G1 F10103.781
M204 S6000
G1 X143.846 Y116.408 E.01456
G1 X143.899 Y117.019 E.0178
G1 X143.836 Y117.669 E.01897
G1 X143.656 Y118.274 E.01832
G1 X143.383 Y118.777 E.01661
G1 X142.962 Y119.295 E.0194
G1 X142.452 Y119.704 E.01896
G1 X141.912 Y119.983 E.01767
G1 X141.282 Y120.163 E.01902
G1 X140.655 Y120.206 E.01825
G1 X140.029 Y120.131 E.0183
G1 X139.431 Y119.93 E.01833
G1 X138.885 Y119.614 E.01831
G1 X138.411 Y119.197 E.01833
G1 X138.03 Y118.694 E.01832
G1 X137.756 Y118.125 E.01834
G1 X137.601 Y117.514 E.0183
G1 X137.569 Y116.883 E.01833
G1 X137.663 Y116.26 E.01831
G1 X137.879 Y115.667 E.01833
G1 X138.208 Y115.128 E.01832
G1 X138.637 Y114.666 E.01831
G1 X139.15 Y114.297 E.01835
G3 X140.638 Y113.868 I1.685 J3.05 E.04532
G1 X141.268 Y113.912 E.01834
G1 X141.851 Y114.078 E.01759
M204 S10000
G1 X142.455 Y114.117 F42000
; LINE_WIDTH: 0.417288
G1 F9616.212
M204 S6000
G1 X142.42 Y114.167 E.00185
M73 P45 R15
G1 X142.232 Y114.212 E.0059
G1 X141.908 Y114.096 E.01051
G1 X142.45 Y114.35 E.01826
G1 X142.886 Y114.694 E.01695
G1 X143.36 Y115.228 E.02179
G1 X143.666 Y115.786 E.01939
G1 X143.711 Y115.925 E.00448
G1 X143.729 Y115.784 E.00434
G3 X144.541 Y114.112 I198.317 J95.206 E.05671
G2 X143.176 Y112.636 I-15.45 J12.92 E.06133
G1 X142.481 Y114.063 E.04842
M204 S10000
G1 X142.845 Y114.178 F42000
; LINE_WIDTH: 0.41999
G1 F9547.299
M204 S6000
G1 X143.256 Y114.517 E.01636
G1 X143.676 Y115.025 E.02028
G1 X144.092 Y114.173 E.02914
G2 X143.281 Y113.283 I-9.31 J7.676 E.037
G1 X142.871 Y114.124 E.02874
M204 S10000
G1 X143.397 Y114.053 F42000
; LINE_WIDTH: 0.53501
G1 F7315.735
M204 S6000
G1 X143.541 Y114.199 E.0082
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7315.735
G1 X143.397 Y114.053 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/76
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S183.6
; OBJECT_ID: 15
M204 S10000
G17
G3 Z1.8 I-1.192 J-.244 P1  F42000
G1 X138.491 Y138.068 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.621 Y138.045 E.0044
G1 X138.891 Y138.024 E.00896
G3 X138.355 Y138.092 I.068 J2.708 E.54661
G1 X138.432 Y138.078 E.00258
M204 S10000
G1 X138.553 Y138.476 F42000
G1 F5400
M204 S6000
G1 X138.672 Y138.449 E.00405
G1 X138.901 Y138.432 E.00762
G3 X138.225 Y138.551 I.057 J2.301 E.45681
G1 X138.495 Y138.489 E.00917
M204 S250
G1 X138.629 Y138.855 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X138.721 Y138.838 E.00285
G3 X140.423 Y141.96 I.224 J1.903 E.13996
G1 X140.357 Y142.035 E.00309
G3 X137.086 Y140.358 I-1.393 J-1.313 E.15155
G1 X137.108 Y140.26 E.00308
G3 X138.534 Y138.874 I1.887 J.516 E.06409
G1 X138.571 Y138.867 E.00115
; WIPE_START
M204 S6000
G1 X138.721 Y138.838 E-.05809
G1 X138.911 Y138.824 E-.07238
G1 X139.29 Y138.853 E-.1445
G1 X139.476 Y138.895 E-.07241
G1 X139.83 Y139.034 E-.14459
G1 X140.15 Y139.24 E-.14456
G1 X140.292 Y139.366 E-.07234
G1 X140.379 Y139.47 E-.05114
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.202 Y131.839 Z2 F42000
G1 X139.801 Y114.5 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.871 Y114.472 E.00247
G3 X140.397 Y114.352 I.863 J2.568 E.01793
G1 X140.666 Y114.332 E.00897
G3 X139.619 Y114.571 I.068 J2.709 E.52885
G1 X139.746 Y114.521 E.0045
M204 S10000
G1 X139.943 Y114.885 F42000
G1 F5400
M204 S6000
G1 X140.001 Y114.859 E.00211
G3 X140.448 Y114.757 I.733 J2.177 E.01523
G1 X140.677 Y114.739 E.00762
G3 X139.583 Y115.048 I.057 J2.296 E.4407
G1 X139.888 Y114.91 E.01111
M204 S250
G1 X140.103 Y115.241 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.126 Y115.231 E.00075
G3 X140.496 Y115.146 I.61 J1.81 E.0117
G3 X142.199 Y118.268 I.224 J1.903 E.13998
G1 X142.125 Y118.35 E.00337
G3 X141.254 Y118.88 I-1.545 J-1.559 E.03163
G1 X141.157 Y118.904 E.00308
G3 X139.779 Y115.388 I-.42 J-1.863 E.16662
G1 X140.049 Y115.266 E.00909
; WIPE_START
M204 S6000
G1 X140.126 Y115.231 E-.03207
G1 X140.496 Y115.146 E-.14451
G1 X140.686 Y115.132 E-.0724
G1 X141.065 Y115.16 E-.14449
G1 X141.251 Y115.203 E-.07243
G1 X141.605 Y115.342 E-.14454
G1 X141.77 Y115.437 E-.07235
G1 X141.929 Y115.564 E-.07721
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.305 Y115.921 Z2 F42000
G1 X114.833 Y116.834 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.804 Y116.791 E.00171
G3 X116.705 Y112.577 I2.237 J-1.527 E.18374
G1 X116.974 Y112.557 E.00897
G3 X114.967 Y117.006 I.068 J2.708 E.36289
G1 X114.87 Y116.881 E.00525
M204 S10000
G1 X115.165 Y116.595 F42000
G1 F5400
M204 S6000
G1 X115.141 Y116.562 E.00135
G3 X116.755 Y112.981 I1.901 J-1.297 E.15611
G1 X116.984 Y112.964 E.00762
G3 X115.436 Y116.913 I.057 J2.301 E.30071
G1 X115.204 Y116.64 E.01186
M204 S250
G1 X115.483 Y116.355 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.365 Y116.179 E.00651
G3 X115.169 Y114.89 I1.676 J-.914 E.04089
G1 X115.191 Y114.792 E.00309
G3 X116.804 Y113.371 I1.887 J.516 E.06994
G3 X115.579 Y116.493 I.237 J1.894 E.24274
G1 X115.517 Y116.404 E.00333
; WIPE_START
M204 S6000
G1 X115.365 Y116.179 E-.10328
G1 X115.281 Y116.008 E-.07233
G1 X115.169 Y115.645 E-.14457
G1 X115.131 Y115.266 E-.14454
G1 X115.169 Y114.89 E-.14355
G1 X115.191 Y114.792 E-.03815
G1 X115.293 Y114.511 E-.11357
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.039 Y122.107 Z2 F42000
G1 X117.55 Y137.505 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.646 Y137.662 E.00611
G3 X114.929 Y136.269 I-2.38 J1.295 E.45708
G1 X115.199 Y136.249 E.00897
G3 X117.505 Y137.432 I.068 J2.708 E.08966
G1 X117.519 Y137.454 E.00087
M204 S10000
G1 X117.205 Y137.728 F42000
G1 F5400
M204 S6000
G1 X117.385 Y138.065 E.01269
G3 X114.98 Y136.674 I-2.119 J.888 E.3798
G1 X115.209 Y136.656 E.00762
G3 X117.167 Y137.663 I.057 J2.296 E.07615
G1 X117.174 Y137.676 E.00051
M204 S250
G1 X116.862 Y137.914 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.024 Y138.217 E.01056
G3 X116.851 Y140.024 I-1.761 J.743 E.05811
G1 X116.787 Y140.114 E.00338
G3 X115.028 Y137.063 I-1.52 J-1.156 E.23099
G3 X116.829 Y137.864 I.234 J1.897 E.06362
; WIPE_START
M204 S6000
G1 X117.024 Y138.217 E-.15326
G1 X117.092 Y138.395 E-.07242
G1 X117.167 Y138.768 E-.14454
G1 X117.176 Y138.958 E-.07234
G1 X117.138 Y139.337 E-.14454
G1 X117.091 Y139.521 E-.07238
G1 X117.026 Y139.7 E-.07236
G1 X116.991 Y139.766 E-.02817
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.433 Y138.072 Z2 F42000
G1 X149.544 Y132.355 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X112.645 Y112.258 I-21.552 J-4.352 E2.7282
G3 X129.024 Y106.04 I15.361 J15.783 E.59767
G3 X149.556 Y132.297 I-1.032 J21.963 E1.25477
M204 S10000
G1 X149.943 Y132.436 F42000
G1 F5400
M204 S6000
G3 X111.581 Y112.766 I-21.951 J-4.433 E2.74162
G3 X129.044 Y105.633 I16.404 J15.221 E.64592
G3 X149.955 Y132.377 I-1.052 J22.369 E1.27801
M204 S250
G1 X150.338 Y132.516 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X150.076 Y133.621 E.03489
G3 X111.294 Y112.499 I-22.083 J-5.618 E2.54917
G3 X129.064 Y105.242 I16.692 J15.487 E.60884
G3 X150.338 Y132.465 I-1.072 J22.761 E1.20487
; WIPE_START
M204 S6000
G1 X150.076 Y133.621 E-.45045
G1 X149.862 Y134.407 E-.30955
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


G1 X141.639 Y141.761 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42281
G1 F9476.427
M204 S6000
G1 X148.532 Y134.868 E.30177
G2 X148.78 Y134.083 I-7.735 J-2.868 E.02547
G1 X141.996 Y140.867 E.29699
G2 X141.975 Y140.351 I-3.172 J-.132 E.01602
G1 X148.989 Y133.336 E.30707
G1 X149.148 Y132.64 E.0221
G1 X141.884 Y139.904 E.318
G2 X141.743 Y139.509 I-3.649 J1.084 E.01301
G1 X149.285 Y131.966 E.3302
G1 X149.4 Y131.314 E.0205
G1 X141.557 Y139.157 E.34335
G2 X141.337 Y138.839 I-1.695 J.942 E.01197
G1 X149.482 Y130.694 E.35657
G2 X149.555 Y130.084 I-6.065 J-1.033 E.01903
G1 X141.084 Y138.555 E.37084
G2 X140.793 Y138.309 I-1.378 J1.332 E.01181
G1 X149.599 Y129.504 E.38548
G2 X149.634 Y128.931 I-5.724 J-.642 E.01777
G1 X140.469 Y138.096 E.40122
G2 X140.11 Y137.918 I-1.068 J1.709 E.01244
G1 X149.648 Y128.38 E.41757
G2 X149.653 Y127.837 I-5.432 J-.326 E.01681
G1 X139.705 Y137.786 E.43554
G2 X139.247 Y137.706 I-.627 J2.245 E.0144
G1 X149.64 Y127.313 E.45499
G2 X149.621 Y126.795 I-5.196 J-.067 E.01605
G1 X138.519 Y137.897 E.48601
; WIPE_START
G1 X139.934 Y136.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.198 Y144.009 Z2 F42000
G1 X141.401 Y145.222 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9476.427
M204 S6000
G2 X143.876 Y142.731 I-98.611 J-100.411 E.10871
G2 X145.908 Y140.178 I-15.811 J-14.674 E.10109
G1 X140.202 Y145.885 E.24983
G3 X138.751 Y146.798 I-14.957 J-22.149 E.05306
G1 X146.785 Y138.764 E.35173
G2 X147.405 Y137.607 I-11.278 J-6.782 E.04062
G1 X137.609 Y147.403 E.42884
G3 X136.608 Y147.867 I-5.15 J-9.796 E.03419
G1 X147.87 Y136.605 E.49305
G2 X148.236 Y135.702 I-8.866 J-4.116 E.03017
G1 X135.7 Y148.237 E.54879
G3 X134.859 Y148.541 I-3.467 J-8.277 E.0277
G1 X139.723 Y143.677 E.21296
G3 X139.09 Y143.773 I-.799 J-3.138 E.01985
G1 X134.082 Y148.781 E.21926
G3 X133.345 Y148.98 I-2.364 J-7.28 E.02363
G1 X138.576 Y143.75 E.22898
G3 X138.127 Y143.662 I.597 J-4.223 E.01417
G1 X132.637 Y149.151 E.24032
G1 X131.964 Y149.287 E.02127
G1 X137.734 Y143.517 E.25261
G3 X137.381 Y143.333 I.74 J-1.859 E.01236
G1 X131.319 Y149.395 E.26536
G3 X130.687 Y149.49 I-1.251 J-6.176 E.0198
G1 X137.061 Y143.114 E.27908
G3 X136.782 Y142.858 I1.139 J-1.52 E.01174
G1 X130.09 Y149.55 E.29296
G3 X129.5 Y149.603 I-.827 J-5.888 E.01836
G1 X136.534 Y142.568 E.30796
G3 X136.319 Y142.246 I1.505 J-1.234 E.01201
G1 X128.934 Y149.631 E.32332
G3 X128.377 Y149.651 I-.476 J-5.572 E.01726
G1 X136.142 Y141.885 E.33995
G3 X136.011 Y141.479 I1.966 J-.859 E.01323
G1 X127.84 Y149.651 E.35772
G3 X127.31 Y149.643 I-.19 J-5.307 E.01641
G1 X135.929 Y141.024 E.37732
G3 X135.927 Y140.489 I2.666 J-.279 E.01659
G1 X126.798 Y149.618 E.39962
G3 X126.291 Y149.588 I.045 J-5.09 E.01574
G1 X136.059 Y139.82 E.42762
G3 X138.046 Y137.832 I2.905 J.918 E.09044
G1 X149.584 Y126.295 E.50508
G2 X149.544 Y125.798 I-5.012 J.149 E.01546
G1 X125.803 Y149.539 E1.03936
G1 X125.314 Y149.49 E.01519
G1 X149.484 Y125.32 E1.05812
G1 X149.424 Y124.843 E.01489
G1 X124.847 Y149.42 E1.07595
G1 X124.38 Y149.35 E.01462
G1 X149.347 Y124.383 E1.093
G1 X149.266 Y123.926 E.01436
G1 X123.927 Y149.265 E1.10931
G1 X123.48 Y149.175 E.01411
G1 X149.176 Y123.48 E1.1249
G1 X149.076 Y123.042 E.01389
G1 X123.04 Y149.078 E1.13983
G1 X122.611 Y148.969 E.01368
G1 X148.974 Y122.607 E1.15411
G1 X148.856 Y122.188 E.01348
G1 X122.183 Y148.86 E1.16769
G3 X121.771 Y148.736 I1.046 J-4.207 E.01335
G1 X148.738 Y121.768 E1.18059
G2 X148.609 Y121.36 I-4.153 J1.086 E.01326
G1 X121.36 Y148.609 E1.19292
G3 X120.956 Y148.476 I1.127 J-4.113 E.01318
G1 X148.474 Y120.958 E1.20471
G2 X148.337 Y120.557 I-4.077 J1.167 E.01311
G1 X120.562 Y148.333 E1.21597
G1 X120.168 Y148.189 E.01298
G1 X148.186 Y120.171 E1.22659
G1 X148.034 Y119.786 E.01283
G1 X119.787 Y148.033 E1.23665
M73 P46 R15
G1 X119.409 Y147.874 E.0127
G1 X147.875 Y119.407 E1.24623
G1 X147.708 Y119.037 E.01257
G1 X119.033 Y147.712 E1.25535
G1 X118.671 Y147.538 E.01246
G1 X147.541 Y118.667 E1.26392
G2 X147.362 Y118.309 I-3.675 J1.62 E.0124
G1 X118.308 Y147.363 E1.27193
G3 X117.953 Y147.181 I1.643 J-3.653 E.01236
G1 X147.18 Y117.954 E1.27953
G2 X146.996 Y117.601 I-3.639 J1.669 E.01234
G1 X117.605 Y146.992 E1.2867
G1 X117.257 Y146.802 E.01226
G1 X146.799 Y117.26 E1.29332
G1 X146.603 Y116.92 E.01217
G1 X116.92 Y146.602 E1.29947
G1 X116.586 Y146.398 E.0121
G1 X146.401 Y116.584 E1.30522
G1 X146.19 Y116.258 E.01203
G1 X116.253 Y146.195 E1.31059
G1 X115.933 Y145.977 E.01197
G1 X145.979 Y115.931 E1.31535
G2 X145.76 Y115.613 I-3.298 J2.037 E.01196
G1 X143.714 Y117.659 E.08957
G2 X143.777 Y117.059 I-4.025 J-.727 E.01871
G1 X145.535 Y115.301 E.07697
G1 X145.31 Y114.988 E.01192
G1 X143.736 Y116.562 E.06892
G2 X143.636 Y116.126 I-3.887 J.663 E.01388
G1 X145.075 Y114.686 E.063
G1 X144.837 Y114.388 E.01183
G1 X143.482 Y115.742 E.05929
G2 X143.291 Y115.396 I-1.821 J.781 E.01226
G1 X144.598 Y114.089 E.05722
G2 X144.347 Y113.803 I-3.008 J2.393 E.01179
G1 X143.065 Y115.084 E.0561
G2 X142.801 Y114.811 I-1.494 J1.179 E.01178
G1 X144.095 Y113.517 E.05664
G2 X143.841 Y113.234 I-2.962 J2.394 E.01178
G1 X142.505 Y114.57 E.05851
G2 X142.175 Y114.363 I-1.2 J1.543 E.01208
G1 X143.576 Y112.962 E.06134
G1 X143.311 Y112.69 E.01176
G1 X141.806 Y114.195 E.06587
G2 X141.39 Y114.073 I-.814 J2.014 E.01343
G1 X143.042 Y112.422 E.07229
G1 X142.763 Y112.163 E.01177
G1 X140.921 Y114.005 E.08064
G2 X140.369 Y114.02 I-.201 J2.766 E.01713
G1 X142.484 Y111.905 E.09262
G2 X142.2 Y111.652 I-2.673 J2.726 E.01179
G1 X139.651 Y114.201 E.11157
G2 X137.893 Y115.959 I1.125 J2.883 E.07922
G1 X117.222 Y136.63 E.90494
G3 X117.496 Y136.892 I-1.177 J1.504 E.01178
G1 X137.715 Y116.674 E.88513
G2 X137.699 Y117.227 I3.239 J.368 E.01714
G1 X117.739 Y137.188 E.87385
G3 X117.946 Y137.517 I-3.897 J2.687 E.01206
G1 X137.764 Y117.699 E.8676
G2 X137.888 Y118.112 I2.125 J-.414 E.01337
G1 X118.112 Y137.889 E.86578
G3 X118.236 Y138.302 I-2.001 J.826 E.01338
G1 X138.054 Y118.484 E.86761
G2 X138.262 Y118.813 I4.138 J-2.381 E.01206
G1 X118.301 Y138.774 E.87387
G3 X118.285 Y139.327 I-3.243 J.184 E.01715
G1 X138.504 Y119.108 E.88517
G2 X138.779 Y119.371 I1.448 J-1.239 E.01178
G1 X118.107 Y140.043 E.905
G3 X116.346 Y141.803 I-2.857 J-1.096 E.07937
G1 X113.801 Y144.349 E.11142
G3 X113.516 Y144.096 I2.391 J-2.982 E.01179
G1 X115.633 Y141.98 E.09265
G3 X115.08 Y141.995 I-.353 J-2.753 E.01714
G1 X113.238 Y143.837 E.08066
G1 X112.959 Y143.579 E.01177
G1 X114.611 Y141.927 E.07231
G3 X114.195 Y141.806 I.4 J-2.143 E.01343
G1 X112.69 Y143.311 E.06589
G1 X112.425 Y143.039 E.01176
G1 X113.826 Y141.637 E.06135
G3 X113.496 Y141.43 I.869 J-1.75 E.01208
G1 X112.159 Y142.767 E.05852
G3 X111.906 Y142.483 I2.711 J-2.68 E.01178
G1 X113.199 Y141.189 E.05664
G3 X112.935 Y140.916 I1.234 J-1.458 E.01178
G1 X111.654 Y142.198 E.0561
G3 X111.402 Y141.912 I2.699 J-2.629 E.01179
G1 X112.709 Y140.605 E.05722
G3 X112.518 Y140.259 I1.635 J-1.13 E.01226
G1 X111.164 Y141.613 E.05928
G1 X110.926 Y141.314 E.01183
G1 X112.365 Y139.875 E.06299
G3 X112.264 Y139.439 I3.774 J-1.099 E.01388
G1 X110.69 Y141.013 E.0689
G1 X110.465 Y140.7 E.01192
G1 X112.223 Y138.943 E.07694
G3 X112.286 Y138.342 I4.137 J.13 E.01869
G1 X110.241 Y140.387 E.08953
G3 X110.022 Y140.069 I3.08 J-2.357 E.01196
G1 X140.067 Y110.024 E1.31537
G1 X140.387 Y110.241 E.01197
G1 X114.648 Y135.98 E1.12682
G3 X115.249 Y135.917 I.656 J3.335 E.01873
G1 X140.703 Y110.462 E1.11438
G1 X141.009 Y110.694 E.01187
G1 X115.748 Y135.955 E1.10591
G3 X116.181 Y136.059 I-.618 J3.533 E.0138
G1 X141.315 Y110.925 E1.10032
G3 X141.615 Y111.162 I-2.22 J3.126 E.01185
G1 X116.567 Y136.21 E1.09658
G3 X116.915 Y136.4 I-.774 J1.832 E.01228
G1 X142.028 Y111.287 E1.09943
; WIPE_START
G1 X140.614 Y112.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.997 Y113.186 Z2 F42000
G1 X110.775 Y114.603 Z2
G1 Z1.6
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X112.924 Y112.454 E.09409
G3 X115.803 Y110.112 I14.453 J14.829 E.11503
G1 X110.09 Y115.825 E.25011
G2 X109.213 Y117.239 I13.732 J9.494 E.05153
G1 X117.252 Y109.201 E.35193
G3 X118.393 Y108.596 I6.627 J11.135 E.04001
G1 X108.594 Y118.395 E.429
G2 X108.129 Y119.398 I9.812 J5.161 E.03422
G1 X119.395 Y108.132 E.4932
G3 X120.302 Y107.762 I4.164 J8.911 E.03035
G1 X107.469 Y120.595 E.56181
M204 S10000
G1 X106.258 Y129.864 F42000
G1 F9476.427
M204 S6000
G1 X117.955 Y118.167 E.51208
G3 X117.289 Y118.296 I-.929 J-3.011 E.02105
G1 X106.379 Y129.206 E.47762
G3 X106.36 Y128.688 I5.182 J-.452 E.01605
G1 X116.754 Y118.294 E.45504
G3 X116.296 Y118.214 I.169 J-2.327 E.0144
G1 X106.347 Y128.164 E.43558
G3 X106.352 Y127.621 I5.43 J-.218 E.0168
G1 X115.891 Y118.082 E.41761
G3 X115.532 Y117.905 I.708 J-1.887 E.01244
G1 X106.366 Y127.07 E.40126
G3 X106.401 Y126.498 I5.755 J.069 E.01777
G1 X115.207 Y117.692 E.38552
G3 X114.916 Y117.445 I1.085 J-1.577 E.01182
G1 X106.445 Y125.917 E.37088
G3 X106.518 Y125.307 I6.143 J.423 E.01902
G1 X114.663 Y117.161 E.35661
G3 X114.443 Y116.844 I1.477 J-1.26 E.01197
G1 X106.599 Y124.688 E.34338
G1 X106.714 Y124.036 E.0205
G1 X114.258 Y116.492 E.33024
G3 X114.116 Y116.097 I3.506 J-1.481 E.01301
G1 X106.851 Y123.361 E.31803
G1 X107.01 Y122.665 E.0221
G1 X114.025 Y115.651 E.3071
G3 X114.004 Y115.134 I3.15 J-.386 E.01602
G1 X107.22 Y121.918 E.29701
G3 X107.467 Y121.134 I7.981 J2.083 E.02546
G1 X114.357 Y114.244 E.30166
; WIPE_START
G1 X112.943 Y115.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.016 Y112.585 Z2 F42000
G1 Z1.6
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X121.143 Y107.458 E.22445
G1 X121.92 Y107.218 E.02517
G1 X116.911 Y112.227 E.21928
G3 X117.425 Y112.25 I.108 J3.334 E.01595
G1 X122.656 Y107.019 E.22901
G3 X123.364 Y106.849 I2.061 J6.998 E.02255
G1 X117.874 Y112.339 E.24035
G3 X118.267 Y112.483 I-.527 J2.032 E.01297
G1 X124.038 Y106.712 E.25265
G3 X124.682 Y106.605 I1.401 J6.415 E.02024
G1 X118.62 Y112.667 E.26539
G3 X118.939 Y112.886 I-.933 J1.7 E.01198
G1 X125.315 Y106.51 E.27912
G1 X125.912 Y106.45 E.01857
G1 X119.219 Y113.143 E.293
G3 X119.467 Y113.433 I-1.324 J1.383 E.01182
G1 X126.502 Y106.397 E.30799
G1 X127.067 Y106.369 E.01753
G1 X119.681 Y113.755 E.32336
G3 X119.858 Y114.116 I-3.66 J2.02 E.01243
G1 X127.624 Y106.349 E.33999
G1 X128.161 Y106.349 E.01663
G1 X119.989 Y114.522 E.35777
G3 X120.071 Y114.977 I-3.934 J.943 E.01433
G1 X128.691 Y106.357 E.37737
G1 X129.203 Y106.383 E.01586
G1 X120.073 Y115.512 E.39968
G3 X119.941 Y116.182 I-4.379 J-.519 E.02116
G1 X129.71 Y106.412 E.4277
G1 X130.198 Y106.461 E.01519
G1 X106.456 Y130.204 E1.0394
G1 X106.516 Y130.681 E.01489
G1 X130.687 Y106.51 E1.05817
G3 X131.154 Y106.58 I-.466 J4.694 E.01463
G1 X106.576 Y131.158 E1.076
G2 X106.653 Y131.618 I4.648 J-.547 E.01444
G1 X131.621 Y106.651 E1.09304
G3 X132.074 Y106.735 I-.62 J4.588 E.01427
G1 X106.734 Y132.075 E1.10934
G2 X106.825 Y132.521 I4.517 J-.685 E.01411
G1 X132.521 Y106.825 E1.12494
G3 X132.961 Y106.922 I-.747 J4.463 E.01397
G1 X106.924 Y132.959 E1.13986
G2 X107.026 Y133.394 I4.417 J-.805 E.01384
G1 X133.39 Y107.031 E1.15414
G1 X133.818 Y107.14 E.01368
G1 X107.144 Y133.813 E1.16773
G1 X107.262 Y134.233 E.01348
G1 X134.23 Y107.265 E1.18062
G1 X134.641 Y107.391 E.0133
G1 X107.391 Y134.641 E1.19295
G1 X107.526 Y135.043 E.01313
G1 X135.045 Y107.524 E1.20474
G1 X135.439 Y107.668 E.01298
G1 X107.663 Y135.444 E1.216
G1 X107.815 Y135.829 E.01283
G1 X135.833 Y107.811 E1.22661
G3 X136.214 Y107.967 I-1.377 J3.905 E.01276
G1 X107.966 Y136.215 E1.23667
M73 P47 R15
G2 X108.125 Y136.593 I3.863 J-1.402 E.01271
G1 X136.592 Y108.126 E1.24625
G3 X136.968 Y108.288 I-1.433 J3.841 E.01266
G1 X108.292 Y136.964 E1.25537
G1 X108.459 Y137.334 E.01257
G1 X137.33 Y108.463 E1.26394
G1 X137.693 Y108.637 E.01246
G1 X108.639 Y137.692 E1.27195
G1 X108.821 Y138.047 E.01236
G1 X138.048 Y108.819 E1.27954
G1 X138.396 Y109.009 E.01226
G1 X109.005 Y138.4 E1.28672
G1 X109.201 Y138.741 E.01217
G1 X138.744 Y109.198 E1.29334
G3 X139.081 Y109.398 I-1.843 J3.485 E.01214
G1 X109.398 Y139.081 E1.29948
G2 X109.6 Y139.417 I3.464 J-1.859 E.01212
G1 X139.414 Y109.602 E1.30524
G1 X139.748 Y109.806 E.0121
G1 X109.688 Y139.866 E1.31598
M204 S10000
G1 X113.973 Y144.714 F42000
G1 F9476.427
M204 S6000
G1 X139.086 Y119.601 E1.09943
G2 X139.434 Y119.79 I1.12 J-1.641 E.01228
G1 X114.385 Y144.839 E1.09659
G2 X114.686 Y145.075 I2.522 J-2.892 E.01185
G1 X139.82 Y119.942 E1.10033
G2 X140.253 Y120.045 I1.049 J-3.427 E.01381
G1 X114.992 Y145.307 E1.10593
G1 X115.297 Y145.539 E.01187
G1 X140.753 Y120.083 E1.11441
G2 X141.354 Y120.019 I-.058 J-3.405 E.01874
G1 X115.492 Y145.881 E1.1322
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9476.427
G1 X116.906 Y144.467 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/76
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2 I.346 J1.167 P1  F42000
G1 X138.557 Y138.056 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.621 Y138.045 E.00216
G1 X138.891 Y138.024 E.00897
G3 X138.355 Y138.092 I.068 J2.708 E.54661
G1 X138.498 Y138.066 E.00482
M204 S10000
G1 X138.613 Y138.463 F42000
G1 F5400
M204 S6000
G1 X138.672 Y138.449 E.00201
G1 X138.901 Y138.432 E.00762
G3 X138.225 Y138.551 I.057 J2.301 E.45681
G1 X138.554 Y138.476 E.0112
M204 S250
G1 X138.7 Y138.843 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X138.721 Y138.839 E.00067
G1 X138.911 Y138.824 E.00586
G3 X138.35 Y138.923 I.048 J1.908 E.35101
G1 X138.641 Y138.857 E.00917
; WIPE_START
M204 S6000
G1 X138.721 Y138.839 E-.03103
G1 X138.911 Y138.824 E-.07241
G1 X139.29 Y138.853 E-.14451
G1 X139.656 Y138.956 E-.14458
G1 X139.995 Y139.129 E-.14458
G1 X140.292 Y139.366 E-.1445
G1 X140.425 Y139.524 E-.07839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.244 Y131.894 Z2.2 F42000
G1 X139.832 Y114.487 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X139.871 Y114.472 E.00136
G3 X140.397 Y114.352 I.863 J2.567 E.01793
G1 X140.666 Y114.332 E.00897
G3 X139.619 Y114.571 I.068 J2.708 E.5287
G1 X139.777 Y114.509 E.0056
M204 S10000
G1 X139.967 Y114.874 F42000
G1 F5400
M204 S6000
G1 X140.001 Y114.859 E.00122
G3 X140.447 Y114.757 I.733 J2.181 E.01523
G1 X140.677 Y114.739 E.00762
G3 X139.583 Y115.047 I.057 J2.301 E.44158
G1 X139.912 Y114.898 E.012
M204 S250
G1 X140.126 Y115.231 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X140.496 Y115.146 I.608 J1.81 E.0117
G1 X140.686 Y115.132 E.00585
G3 X140.069 Y115.251 I.048 J1.908 E.34917
; WIPE_START
M204 S6000
G1 X140.496 Y115.146 E-.16713
G1 X140.686 Y115.132 E-.07241
G1 X141.066 Y115.16 E-.14455
G1 X141.432 Y115.263 E-.14452
G1 X141.77 Y115.437 E-.14461
G1 X141.925 Y115.548 E-.07238
G1 X141.952 Y115.575 E-.01441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.327 Y115.902 Z2.2 F42000
G1 X114.771 Y116.743 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.664 Y116.561 E.007
G3 X116.704 Y112.577 I2.378 J-1.297 E.17478
G1 X116.974 Y112.557 E.00897
G3 X114.805 Y116.792 I.068 J2.708 E.37182
M204 S10000
G1 X115.113 Y116.515 F42000
G1 F5400
M204 S6000
G1 X114.922 Y116.16 E.01339
G3 X116.755 Y112.981 I2.12 J-.895 E.14089
G1 X116.984 Y112.964 E.00762
G3 X115.144 Y116.567 I.057 J2.301 E.31575
M204 S250
G1 X115.456 Y116.328 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.283 Y116.008 E.0112
G3 X116.804 Y113.371 I1.759 J-.743 E.10826
G1 X116.994 Y113.356 E.00586
G3 X115.49 Y116.377 I.048 J1.908 E.2414
; WIPE_START
M204 S6000
G1 X115.283 Y116.008 E-.16114
G1 X115.169 Y115.645 E-.14449
G1 X115.141 Y115.456 E-.07243
G1 X115.141 Y115.077 E-.144
G1 X115.19 Y114.794 E-.10919
G1 X115.306 Y114.476 E-.12876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.042 Y122.073 Z2.2 F42000
G1 X117.535 Y137.48 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.646 Y137.662 E.00707
G3 X114.929 Y136.269 I-2.379 J1.294 E.45696
G1 X115.199 Y136.249 E.00897
G3 X117.503 Y137.429 I.067 J2.708 E.08955
M204 S10000
G1 X117.194 Y137.707 F42000
G1 F5400
M204 S6000
G1 X117.387 Y138.064 E.01347
G3 X114.98 Y136.674 I-2.121 J.893 E.38063
G1 X115.209 Y136.656 E.00762
G3 X117.164 Y137.655 I.057 J2.301 E.07592
M204 S250
G1 X116.851 Y137.894 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X117.026 Y138.217 E.01128
G3 X115.028 Y137.063 I-1.76 J.741 E.29248
G1 X115.218 Y137.049 E.00586
G3 X116.817 Y137.844 I.048 J1.908 E.0571
; WIPE_START
M204 S6000
G1 X117.026 Y138.217 E-.16209
G1 X117.138 Y138.58 E-.14458
G1 X117.176 Y138.958 E-.14453
G1 X117.138 Y139.337 E-.14451
G1 X117.026 Y139.701 E-.14462
G1 X117.002 Y139.746 E-.01967
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.444 Y138.056 Z2.2 F42000
G1 X149.544 Y132.355 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X112.645 Y112.258 I-21.552 J-4.352 E2.72817
G3 X129.167 Y106.047 I15.361 J15.783 E.60243
G3 X149.556 Y132.296 I-1.175 J21.956 E1.25001
M204 S10000
G1 X149.944 Y132.436 F42000
G1 F5400
M204 S6000
G3 X111.581 Y112.766 I-21.951 J-4.433 E2.74162
G3 X129.188 Y105.641 I16.405 J15.221 E.65068
G3 X149.955 Y132.377 I-1.195 J22.362 E1.27326
M204 S250
G1 X150.328 Y132.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X111.294 Y112.499 I-22.335 J-4.511 E2.58404
G3 X129.207 Y105.249 I16.692 J15.487 E.61324
G3 X150.34 Y132.455 I-1.215 J22.754 E1.20014
; WIPE_START
M204 S6000
G1 X150.085 Y133.623 E-.45447
G1 X149.867 Y134.397 E-.30553
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


G1 X145.881 Y140.508 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42281
G1 F9476.427
M204 S6000
G1 X120.022 Y114.649 E1.1321
G3 X120.077 Y115.241 I-3.226 J.6 E.01845
G1 X145.535 Y140.699 E1.11452
G1 X145.31 Y141.012 E.01192
G1 X120.046 Y115.748 E1.10604
G3 X119.941 Y116.18 I-2.219 J-.309 E.0138
G1 X145.075 Y141.314 E1.10031
G1 X144.836 Y141.612 E.01183
G1 X119.792 Y116.568 E1.09641
G3 X119.599 Y116.912 I-4.013 J-2.026 E.01222
G1 X144.719 Y142.032 E1.09971
M204 S10000
G1 X139.87 Y146.316 F42000
G1 F9476.427
M204 S6000
G1 X109.811 Y116.257 E1.31595
G1 X109.6 Y116.584 E.01203
G1 X139.414 Y146.398 E1.30523
G1 X139.081 Y146.602 E.0121
G1 X109.398 Y116.919 E1.29947
G1 X109.201 Y117.259 E.01217
G1 X138.744 Y146.802 E1.29333
G1 X138.396 Y146.991 E.01226
G1 X109.005 Y117.6 E1.28671
G2 X108.821 Y117.953 I3.453 J2.021 E.01234
G1 X138.048 Y147.181 E1.27953
M73 P48 R15
G3 X137.693 Y147.362 I-1.998 J-3.47 E.01236
G1 X108.639 Y118.309 E1.27194
G2 X108.459 Y118.666 I3.498 J1.979 E.0124
M73 P48 R14
G1 X137.33 Y147.537 E1.26393
G1 X136.967 Y147.712 E.01246
G1 X108.292 Y119.036 E1.25537
G1 X108.125 Y119.407 E.01257
G1 X136.592 Y147.874 E1.24624
G1 X136.214 Y148.033 E.0127
G1 X107.966 Y119.785 E1.23666
G1 X107.815 Y120.171 E.01283
G1 X135.833 Y148.189 E1.2266
G1 X135.439 Y148.332 E.01298
G1 X107.663 Y120.557 E1.21599
G2 X107.526 Y120.957 I3.915 J1.559 E.01311
G1 X135.045 Y148.476 E1.20473
G3 X134.641 Y148.609 I-1.534 J-3.986 E.01318
G1 X107.391 Y121.359 E1.19294
G2 X107.262 Y121.768 I4.027 J1.496 E.01326
G1 X134.23 Y148.735 E1.18061
G3 X133.818 Y148.86 I-1.457 J-4.075 E.01335
G1 X107.144 Y122.187 E1.16771
G1 X107.027 Y122.606 E.01348
G1 X133.389 Y148.969 E1.15413
G1 X132.961 Y149.078 E.01368
G1 X106.925 Y123.041 E1.13985
G1 X106.825 Y123.479 E.01389
G1 X132.52 Y149.175 E1.12493
G1 X132.074 Y149.265 E.01411
G1 X106.734 Y123.925 E1.10933
G1 X106.653 Y124.382 E.01436
G1 X131.621 Y149.349 E1.09303
G1 X131.154 Y149.42 E.01462
G1 X106.576 Y124.842 E1.07598
G1 X106.516 Y125.319 E.01489
G1 X130.687 Y149.49 E1.05815
G1 X130.198 Y149.539 E.01519
G1 X106.456 Y125.797 E1.03939
G2 X106.417 Y126.294 I4.974 J.647 E.01546
G1 X116.181 Y136.059 E.42747
G2 X115.51 Y135.925 I-.977 J3.155 E.02121
G1 X106.379 Y126.794 E.39974
G2 X106.36 Y127.312 I5.175 J.452 E.01605
G1 X114.979 Y135.931 E.37733
G2 X114.521 Y136.01 I.337 J3.339 E.01441
G1 X106.347 Y127.836 E.35783
G2 X106.352 Y128.379 I5.441 J.217 E.0168
G1 X114.117 Y136.143 E.33992
G2 X113.754 Y136.317 I.687 J1.902 E.01249
G1 X106.366 Y128.93 E.32342
G2 X106.401 Y129.503 I5.759 J-.069 E.01777
G1 X113.432 Y136.533 E.30777
G2 X113.143 Y136.782 I1.098 J1.562 E.01181
G1 X106.445 Y130.083 E.29325
G2 X106.518 Y130.693 I6.139 J-.423 E.01903
G1 X112.888 Y137.063 E.27886
G2 X112.665 Y137.378 I4.056 J3.105 E.01193
G1 X106.6 Y131.312 E.26553
G1 X106.715 Y131.965 E.0205
G1 X112.483 Y137.733 E.25254
G2 X112.341 Y138.128 I1.898 J.909 E.01301
G1 X106.852 Y132.639 E.24031
G1 X107.01 Y133.335 E.0221
G1 X112.249 Y138.574 E.22934
G2 X112.226 Y139.088 I2.558 J.373 E.01595
G1 X107.22 Y134.082 E.21914
G2 X107.467 Y134.866 I7.973 J-2.08 E.02547
G1 X112.582 Y139.981 E.22392
; WIPE_START
G1 X111.168 Y138.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.244 Y141.644 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X121.143 Y148.542 E.302
G1 X121.92 Y148.782 E.02517
G1 X115.135 Y141.996 E.29704
G2 X115.653 Y141.977 I.108 J-4.14 E.01607
G1 X122.656 Y148.981 E.30659
G2 X123.364 Y149.151 I2.063 J-7.003 E.02255
G1 X116.096 Y141.883 E.31818
G2 X116.493 Y141.743 I-.504 J-2.058 E.01306
G1 X124.037 Y149.287 E.33028
G2 X124.682 Y149.395 I1.401 J-6.41 E.02025
G1 X116.845 Y141.558 E.34309
G2 X117.161 Y141.336 I-.951 J-1.689 E.01196
G1 X125.314 Y149.49 E.35695
G1 X125.911 Y149.55 E.01857
G1 X117.439 Y141.078 E.37089
G2 X117.691 Y140.792 I-1.025 J-1.158 E.01181
G1 X126.502 Y149.603 E.38571
G1 X127.067 Y149.631 E.01753
G1 X117.906 Y140.47 E.40107
G2 X118.083 Y140.109 I-3.663 J-2.022 E.01243
G1 X127.624 Y149.65 E.4177
G1 X128.161 Y149.65 E.01663
G1 X118.214 Y139.703 E.43548
G2 X118.296 Y139.248 I-3.931 J-.942 E.01433
G1 X128.691 Y149.643 E.45509
G1 X129.203 Y149.617 E.01586
G1 X118.298 Y138.713 E.47739
G2 X118.17 Y138.048 I-2.22 J.082 E.02105
G1 X129.865 Y149.742 E.51199
M204 S10000
G1 X120.586 Y148.522 F42000
G1 F9476.427
M204 S6000
G1 X107.764 Y135.7 E.56132
G2 X108.129 Y136.603 I9.233 J-3.213 E.03016
G1 X119.394 Y147.868 E.49316
G3 X118.393 Y147.404 I4.149 J-10.263 E.03418
G1 X108.594 Y137.605 E.42896
G2 X109.213 Y138.761 I11.897 J-5.624 E.04061
G1 X117.251 Y146.799 E.35188
G1 X117.171 Y146.756 E.00281
G3 X115.802 Y145.887 I8.024 J-14.166 E.05023
G1 X110.09 Y140.175 E.25004
G1 X110.106 Y140.2 E.0009
G2 X112.761 Y143.384 I17.685 J-12.05 E.12854
G1 X114.603 Y145.225 E.08063
; WIPE_START
G1 X113.189 Y143.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.702 Y136.194 Z2.2 F42000
G1 X111.282 Y113.967 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X136.401 Y139.087 E1.09971
G2 X136.209 Y139.432 I3.448 J2.153 E.01223
G1 X111.164 Y114.387 E1.09643
G1 X110.926 Y114.686 E.01183
G1 X136.057 Y139.817 E1.10022
G2 X135.956 Y140.254 I3.667 J1.077 E.01387
G1 X110.69 Y114.988 E1.10612
G1 X110.465 Y115.3 E.01192
G1 X135.915 Y140.75 E1.11416
G2 X135.978 Y141.35 I4.133 J-.129 E.01869
G1 X110.241 Y115.613 E1.12674
G2 X110.022 Y115.931 I3.082 J2.358 E.01196
G1 X140.067 Y145.976 E1.31536
G1 X140.387 Y145.759 E.01197
G1 X138.339 Y143.711 E.08964
G2 X138.94 Y143.775 I.632 J-3.096 E.01874
G1 X140.703 Y145.538 E.0772
G1 X141.009 Y145.306 E.01187
G1 X139.439 Y143.736 E.06874
G2 X139.874 Y143.635 I-.29 J-2.221 E.01387
G1 X141.315 Y145.075 E.06306
G2 X141.615 Y144.838 I-2.223 J-3.13 E.01185
G1 X140.26 Y143.483 E.05932
G2 X140.604 Y143.29 I-.79 J-1.813 E.01224
G1 X141.907 Y144.593 E.05704
G1 X142.199 Y144.348 E.0118
G1 X140.914 Y143.063 E.05626
G2 X141.186 Y142.797 I-.892 J-1.183 E.01179
G1 X142.484 Y144.095 E.05684
G1 X142.763 Y143.837 E.01177
G1 X141.431 Y142.505 E.05831
G2 X141.639 Y142.175 I-3.901 J-2.69 E.01206
G1 X143.041 Y143.578 E.06141
G2 X143.311 Y143.31 I-2.55 J-2.829 E.01176
M73 P49 R14
G1 X141.804 Y141.804 E.06594
G2 X141.928 Y141.391 I-2.002 J-.827 E.01338
G1 X143.576 Y143.038 E.07212
G1 X143.841 Y142.766 E.01176
G1 X141.993 Y140.918 E.0809
G2 X141.977 Y140.365 I-3.248 J-.184 E.01715
G1 X144.095 Y142.483 E.09269
G1 X144.347 Y142.197 E.01178
G1 X141.799 Y139.65 E.11152
G2 X140.039 Y137.89 I-2.824 J1.064 E.07942
G1 X119.37 Y117.221 E.90486
G3 X119.109 Y117.497 I-1.512 J-1.17 E.01178
G1 X139.328 Y137.716 E.88518
G2 X138.774 Y137.699 I-.373 J3.054 E.0172
G1 X118.815 Y117.74 E.87378
G3 X118.482 Y117.944 I-1.186 J-1.56 E.01211
G1 X138.3 Y137.763 E.86763
G2 X137.888 Y137.888 I.972 J3.943 E.01334
G1 X118.112 Y118.112 E.86577
G3 X117.7 Y118.237 I-1.39 J-3.835 E.01334
G1 X137.519 Y138.055 E.86762
G2 X137.186 Y138.26 I.854 J1.767 E.01211
G1 X117.227 Y118.301 E.87376
G3 X116.673 Y118.284 I-.183 J-3.069 E.01719
G1 X136.892 Y138.503 E.88516
G2 X136.63 Y138.779 I1.249 J1.445 E.01178
G1 X115.962 Y118.111 E.90482
G3 X114.2 Y116.349 I1.062 J-2.824 E.07952
G1 X111.654 Y113.802 E.11148
G1 X111.906 Y113.517 E.01178
G1 X114.022 Y115.634 E.09267
G3 X114.007 Y115.081 I3.238 J-.368 E.01714
G1 X112.159 Y113.233 E.08088
G1 X112.425 Y112.961 E.01176
G1 X114.074 Y114.611 E.07223
G3 X114.194 Y114.194 I3.203 J.692 E.01346
G1 X112.69 Y112.689 E.06586
G3 X112.959 Y112.421 I2.822 J2.564 E.01176
G1 X114.364 Y113.826 E.0615
G3 X114.57 Y113.495 I1.758 J.862 E.0121
G1 X113.238 Y112.163 E.05831
G1 X113.516 Y111.904 E.01177
G1 X114.809 Y113.197 E.05659
G3 X115.086 Y112.937 I3.952 J3.933 E.01177
G1 X113.801 Y111.652 E.05626
G1 X114.093 Y111.407 E.0118
G1 X115.396 Y112.709 E.05704
G3 X115.741 Y112.517 I1.136 J1.624 E.01224
G1 X114.385 Y111.161 E.05933
G3 X114.686 Y110.925 I2.523 J2.894 E.01185
G1 X116.126 Y112.365 E.06307
G3 X116.562 Y112.263 I.725 J2.121 E.01387
G1 X114.992 Y110.693 E.06875
G1 X115.297 Y110.462 E.01187
G1 X117.061 Y112.225 E.07722
G3 X117.662 Y112.289 I-.031 J3.153 E.01874
G1 X115.614 Y110.241 E.08967
G1 X115.933 Y110.023 E.01197
G1 X145.979 Y140.069 E1.31535
G1 X146.19 Y139.742 E.01203
G1 X116.253 Y109.806 E1.31059
G1 X116.586 Y109.602 E.0121
G1 X146.4 Y139.416 E1.30522
G2 X146.602 Y139.081 I-3.261 J-2.193 E.01212
G1 X116.92 Y109.398 E1.29946
G3 X117.257 Y109.198 I2.175 J3.277 E.01214
G1 X146.799 Y138.74 E1.29332
G1 X146.996 Y138.399 E.01217
G1 X117.605 Y109.008 E1.2867
G1 X117.953 Y108.819 E.01226
G1 X147.18 Y138.046 E1.27952
G1 X147.362 Y137.691 E.01236
G1 X118.308 Y108.637 E1.27193
G1 X118.671 Y108.463 E.01246
G1 X147.541 Y137.333 E1.26391
G1 X147.708 Y136.963 E.01257
G1 X119.033 Y108.288 E1.25535
G3 X119.409 Y108.126 I1.811 J3.685 E.01266
G1 X147.875 Y136.593 E1.24623
G2 X148.034 Y136.214 I-3.707 J-1.781 E.01271
G1 X119.787 Y107.967 E1.23664
G3 X120.168 Y107.811 I1.757 J3.748 E.01276
G1 X148.186 Y135.829 E1.22659
G1 X148.337 Y135.443 E.01283
G1 X120.562 Y107.667 E1.21597
G1 X120.956 Y107.524 E.01298
G1 X148.474 Y135.042 E1.20471
G1 X148.609 Y134.64 E.01313
G1 X121.36 Y107.391 E1.19292
G1 X121.771 Y107.264 E.0133
G1 X148.738 Y134.232 E1.18059
G1 X148.856 Y133.812 E.01348
G1 X122.183 Y107.14 E1.16769
G1 X122.611 Y107.031 E.01368
G1 X148.974 Y133.393 E1.15411
G2 X149.076 Y132.958 I-4.327 J-1.243 E.01385
G1 X123.04 Y106.922 E1.13983
G3 X123.48 Y106.825 I1.187 J4.365 E.01397
G1 X149.175 Y132.52 E1.1249
G2 X149.266 Y132.074 I-4.425 J-1.131 E.01411
G1 X123.927 Y106.735 E1.1093
G3 X124.38 Y106.651 I1.072 J4.498 E.01427
G1 X149.347 Y131.617 E1.093
G2 X149.424 Y131.157 I-4.57 J-1.006 E.01444
G1 X124.847 Y106.58 E1.07595
G3 X125.314 Y106.51 I.934 J4.638 E.01463
G1 X149.484 Y130.68 E1.05812
G1 X149.544 Y130.202 E.01489
G1 X125.803 Y106.461 E1.03936
G1 X126.291 Y106.412 E.01519
G1 X137.829 Y117.951 E.50514
G2 X139.821 Y119.942 I2.892 J-.901 E.09066
G1 X149.583 Y129.705 E.4274
G1 X149.621 Y129.205 E.01551
G1 X140.491 Y120.075 E.39969
G2 X141.022 Y120.069 I.218 J-3.926 E.01645
G1 X149.64 Y128.687 E.37729
G1 X149.653 Y128.163 E.01623
G1 X141.48 Y119.99 E.3578
G2 X141.884 Y119.856 I-.467 J-2.086 E.01318
G1 X149.648 Y127.62 E.33989
G1 X149.634 Y127.069 E.01706
G1 X142.247 Y119.682 E.32339
G2 X142.569 Y119.467 I-2.615 J-4.254 E.01199
G1 X149.598 Y126.496 E.30775
G1 X149.555 Y125.916 E.01803
G1 X142.857 Y119.218 E.29323
G2 X143.113 Y118.936 I-1.281 J-1.421 E.01179
G1 X149.482 Y125.306 E.27884
G2 X149.4 Y124.686 I-6.249 J.512 E.01934
G1 X143.335 Y118.622 E.26551
G2 X143.517 Y118.266 I-1.685 J-1.085 E.01238
G1 X149.285 Y124.034 E.25252
G2 X149.148 Y123.36 I-6.827 J1.036 E.02131
G1 X143.66 Y117.871 E.24028
G2 X143.751 Y117.425 I-3.297 J-.908 E.0141
G1 X148.989 Y122.664 E.22933
G2 X148.78 Y121.917 I-7.544 J1.715 E.02403
G1 X143.767 Y116.904 E.21945
G2 X143.676 Y116.276 I-2.704 J.069 E.01968
G1 X148.532 Y121.132 E.21259
G2 X148.235 Y120.298 I-8.507 J2.558 E.02742
G1 X135.7 Y107.763 E.54879
G3 X136.607 Y108.133 I-3.261 J9.29 E.03036
G1 X147.87 Y119.395 E.49306
G2 X147.405 Y118.393 I-10.28 J4.162 E.03423
G1 X137.609 Y108.597 E.42884
G3 X138.751 Y109.202 I-5.485 J11.737 E.04003
G1 X146.785 Y117.236 E.35173
G2 X145.908 Y115.822 I-14.622 J8.09 E.05155
G1 X140.201 Y110.115 E.24983
G3 X143.094 Y112.471 I-11.658 J17.271 E.11563
G1 X145.22 Y114.597 E.09309
M204 S10000
G1 X141.757 Y114.357 F42000
G1 F9476.427
M204 S6000
G1 X134.859 Y107.459 E.302
G1 X134.082 Y107.219 E.02517
G1 X140.866 Y114.004 E.29703
G2 X140.348 Y114.022 I-.109 J4.158 E.01607
G1 X133.345 Y107.02 E.30657
G2 X132.637 Y106.849 I-2.063 J7.002 E.02255
G1 X139.905 Y114.117 E.31816
G2 X139.508 Y114.257 I.503 J2.055 E.01306
G1 X131.964 Y106.713 E.33026
G2 X131.319 Y106.605 I-1.402 J6.413 E.02025
G1 X139.156 Y114.442 E.34307
G2 X138.84 Y114.663 I.951 J1.69 E.01196
G1 X130.687 Y106.51 E.35693
G1 X130.09 Y106.451 E.01857
G1 X138.557 Y114.918 E.37069
G2 X138.307 Y115.205 I4.087 J3.821 E.01179
G1 X129.499 Y106.397 E.38557
G1 X128.934 Y106.369 E.01753
G1 X138.095 Y115.53 E.40106
G2 X137.919 Y115.892 I1.718 J1.059 E.01246
G1 X128.377 Y106.35 E.41774
G1 X127.84 Y106.35 E.01663
G1 X137.783 Y116.293 E.43532
G2 X137.707 Y116.754 I2.264 J.611 E.01449
G1 X127.31 Y106.357 E.45517
G1 X126.798 Y106.383 E.01586
G1 X137.897 Y117.481 E.48589
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9476.427
G1 X136.483 Y116.067 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/76
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.2 I-1.211 J.122 P1  F42000
G1 X138.702 Y138.039 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.891 Y138.024 E.0063
G3 X138.621 Y138.045 I.067 J2.708 E.55558
G1 X138.642 Y138.043 E.00069
M204 S10000
G1 X138.732 Y138.444 F42000
G1 F5400
M204 S6000
G1 X138.901 Y138.432 E.00562
G3 X138.672 Y138.449 I.057 J2.301 E.47204
G1 X138.672 Y138.449 E.00001
M204 S250
G1 X138.761 Y138.835 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X138.911 Y138.824 E.00461
G3 X138.702 Y138.841 I.048 J1.908 E.36212
; WIPE_START
M204 S6000
G1 X138.911 Y138.824 E-.07972
G1 X139.29 Y138.853 E-.14451
G1 X139.656 Y138.956 E-.14458
G1 X139.995 Y139.129 E-.1446
G1 X140.292 Y139.366 E-.14452
G1 X140.465 Y139.572 E-.10207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.867 Y138.851 Z2.4 F42000
G1 X117.473 Y137.389 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.505 Y137.432 E.00179
G3 X114.929 Y136.269 I-2.239 J1.525 E.46592
G1 X115.199 Y136.249 E.00897
G3 X117.342 Y137.216 I.068 J2.708 E.08069
G1 X117.437 Y137.341 E.00519
M204 S10000
G1 X117.133 Y137.619 F42000
G1 F5400
M204 S6000
G1 X117.168 Y137.662 E.00183
G3 X114.98 Y136.674 I-1.902 J1.295 E.39586
G1 X115.209 Y136.656 E.00762
G3 X116.874 Y137.31 I.057 J2.301 E.06094
G1 X117.095 Y137.573 E.01139
M204 S250
G1 X116.834 Y137.87 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.844 Y137.883 E.0005
M73 P50 R14
G3 X115.028 Y137.063 I-1.578 J1.074 E.30418
G1 X115.218 Y137.049 E.00585
G3 X116.6 Y137.591 I.048 J1.908 E.04683
G1 X116.795 Y137.824 E.00935
; WIPE_START
M204 S6000
G1 X116.844 Y137.883 E-.02894
G1 X117.026 Y138.216 E-.14443
G1 X117.138 Y138.58 E-.14455
G1 X117.167 Y138.768 E-.07244
G1 X117.167 Y139.149 E-.14452
G1 X117.091 Y139.522 E-.14458
G1 X117.009 Y139.717 E-.08054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.261 Y132.121 Z2.4 F42000
G1 X114.743 Y116.696 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.663 Y116.561 E.00519
G3 X116.704 Y112.577 I2.378 J-1.297 E.17478
G1 X116.974 Y112.557 E.00898
G3 X114.804 Y116.791 I.067 J2.708 E.37184
G1 X114.775 Y116.746 E.00178
M204 S10000
G1 X115.108 Y116.498 F42000
G1 F5400
M204 S6000
G1 X115.021 Y116.366 E.00523
G3 X116.755 Y112.981 I2.02 J-1.102 E.1485
G1 X116.984 Y112.964 E.00763
G3 X115.279 Y116.745 I.057 J2.301 E.30831
G1 X115.142 Y116.547 E.00798
M204 S250
G1 X115.431 Y116.278 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.365 Y116.179 E.00364
G3 X116.804 Y113.371 I1.676 J-.914 E.11411
G1 X116.994 Y113.356 E.00586
G3 X115.58 Y116.493 I.047 J1.908 E.23691
G1 X115.465 Y116.327 E.00619
; WIPE_START
M204 S6000
G1 X115.365 Y116.179 E-.06782
G1 X115.216 Y115.829 E-.14446
G1 X115.141 Y115.456 E-.1446
G1 X115.141 Y115.076 E-.14452
G1 X115.216 Y114.703 E-.14458
G1 X115.333 Y114.427 E-.11402
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.965 Y114.434 Z2.4 F42000
G1 X139.942 Y114.452 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X140.131 Y114.399 E.0065
G3 X140.397 Y114.352 I.603 J2.641 E.00896
G1 X140.666 Y114.332 E.00897
G3 X139.871 Y114.472 I.068 J2.708 E.53765
G1 X139.885 Y114.469 E.00048
M204 S10000
G1 X140.074 Y114.842 F42000
G1 F5400
M204 S6000
G1 X140.447 Y114.757 E.0127
G1 X140.677 Y114.739 E.00762
G3 X140 Y114.859 I.057 J2.301 E.4568
G1 X140.016 Y114.855 E.00052
M204 S250
G1 X140.161 Y115.223 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.496 Y115.146 E.01056
G1 X140.686 Y115.132 E.00586
G3 X140.103 Y115.238 I.048 J1.908 E.35029
; WIPE_START
M204 S6000
G1 X140.496 Y115.146 E-.15335
G1 X140.686 Y115.132 E-.07241
G1 X141.066 Y115.16 E-.14451
G1 X141.432 Y115.263 E-.14455
G1 X141.606 Y115.342 E-.07246
G1 X141.925 Y115.548 E-.14449
G1 X141.978 Y115.6 E-.02823
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.119 Y122.556 Z2.4 F42000
G1 X149.544 Y132.355 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X114.289 Y110.807 I-21.552 J-4.353 E2.80089
G3 X129.311 Y106.054 I13.721 J17.252 E.53445
G3 X149.556 Y132.296 I-1.318 J21.948 E1.24529
M204 S10000
G1 X149.943 Y132.436 F42000
G1 F5400
M204 S6000
G3 X114.035 Y110.489 I-21.951 J-4.434 E2.85275
G3 X129.331 Y105.648 I13.975 J17.571 E.54422
G3 X149.955 Y132.377 I-1.339 J22.354 E1.26851
M204 S250
G1 X150.328 Y132.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X112.92 Y110.913 I-22.336 J-4.511 E2.65389
G3 X129.35 Y105.256 I15.065 J17.07 E.54782
G3 X150.34 Y132.455 I-1.358 J22.746 E1.19578
; WIPE_START
M204 S6000
G1 X150.085 Y133.623 E-.45446
G1 X149.867 Y134.397 E-.30554
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


G1 X141.64 Y141.76 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42281
G1 F9476.427
M204 S6000
G1 X148.532 Y134.868 E.30175
G2 X148.78 Y134.083 I-7.738 J-2.869 E.02547
G1 X141.996 Y140.867 E.29698
G2 X141.975 Y140.35 I-3.172 J-.132 E.01602
G1 X148.989 Y133.336 E.30707
G1 X149.148 Y132.64 E.0221
G1 X141.884 Y139.904 E.318
G2 X141.743 Y139.508 I-3.654 J1.086 E.01301
G1 X149.285 Y131.966 E.3302
G1 X149.4 Y131.314 E.0205
G1 X141.557 Y139.156 E.34334
G2 X141.337 Y138.839 I-1.694 J.941 E.01197
G1 X149.482 Y130.694 E.35657
G2 X149.555 Y130.084 I-6.057 J-1.032 E.01903
G1 X141.084 Y138.555 E.37084
G2 X140.793 Y138.309 I-1.377 J1.331 E.01181
G1 X149.598 Y129.504 E.38548
G2 X149.634 Y128.931 I-5.722 J-.642 E.01777
G1 X140.469 Y138.096 E.40122
G2 X140.11 Y137.918 I-1.066 J1.706 E.01244
G1 X149.648 Y128.38 E.41756
G2 X149.653 Y127.837 I-5.432 J-.326 E.01681
G1 X139.705 Y137.786 E.43554
G2 X139.247 Y137.706 I-.626 J2.242 E.0144
G1 X149.64 Y127.313 E.45499
G2 X149.621 Y126.795 I-5.191 J-.067 E.01605
G1 X138.519 Y137.896 E.48601
; WIPE_START
G1 X139.934 Y136.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X141.198 Y144.009 Z2.4 F42000
G1 X141.401 Y145.222 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9476.427
M204 S6000
G2 X143.876 Y142.73 I-98.759 J-100.558 E.10872
G2 X145.908 Y140.178 I-15.819 J-14.679 E.10108
G1 X140.201 Y145.885 E.24983
G3 X138.751 Y146.798 I-14.958 J-22.151 E.05306
G1 X146.785 Y138.764 E.35173
G2 X147.405 Y137.607 I-11.284 J-6.786 E.04062
G1 X137.609 Y147.403 E.42883
G3 X136.607 Y147.867 I-5.149 J-9.793 E.03419
G1 X147.87 Y136.605 E.49305
G2 X148.235 Y135.702 I-8.861 J-4.114 E.03017
G1 X135.7 Y148.237 E.54879
G3 X134.859 Y148.541 I-3.475 J-8.3 E.0277
G1 X139.723 Y143.677 E.21295
G3 X139.09 Y143.773 I-.798 J-3.135 E.01985
G1 X134.082 Y148.781 E.21925
G3 X133.345 Y148.98 I-2.364 J-7.28 E.02363
G1 X138.576 Y143.75 E.22897
G3 X138.127 Y143.662 I.596 J-4.218 E.01417
G1 X132.637 Y149.151 E.24031
G1 X131.964 Y149.287 E.02127
G1 X137.734 Y143.517 E.25261
G3 X137.38 Y143.333 I.741 J-1.862 E.01236
G1 X131.319 Y149.395 E.26536
G3 X130.687 Y149.49 I-1.279 J-6.358 E.0198
G1 X137.061 Y143.114 E.27908
G3 X136.782 Y142.858 I1.139 J-1.52 E.01174
G1 X130.09 Y149.549 E.29296
G3 X129.499 Y149.603 I-.828 J-5.897 E.01836
G1 X136.534 Y142.568 E.30796
G3 X136.319 Y142.246 I1.506 J-1.235 E.01201
G1 X128.934 Y149.631 E.32331
G3 X128.377 Y149.65 I-.475 J-5.569 E.01726
G1 X136.142 Y141.885 E.33994
G3 X136.011 Y141.479 I1.966 J-.859 E.01323
G1 X127.84 Y149.65 E.35772
G3 X127.31 Y149.643 I-.19 J-5.315 E.01641
G1 X135.929 Y141.024 E.37732
G3 X135.927 Y140.489 I2.665 J-.279 E.01659
G1 X126.798 Y149.617 E.39962
G3 X126.291 Y149.588 I.045 J-5.095 E.01574
G1 X136.059 Y139.82 E.42762
G3 X138.046 Y137.832 I2.905 J.918 E.09044
G1 X149.583 Y126.295 E.50508
G2 X149.544 Y125.798 I-5.024 J.149 E.01546
G1 X125.803 Y149.539 E1.03936
G1 X125.314 Y149.49 E.01519
G1 X149.484 Y125.32 E1.05812
G1 X149.424 Y124.843 E.01489
G1 X124.847 Y149.42 E1.07595
G1 X124.38 Y149.349 E.01462
G1 X149.347 Y124.383 E1.093
G1 X149.266 Y123.926 E.01436
G1 X123.927 Y149.265 E1.1093
G1 X123.48 Y149.175 E.01411
G1 X149.175 Y123.48 E1.1249
G1 X149.076 Y123.042 E.01389
G1 X123.04 Y149.078 E1.13982
G1 X122.611 Y148.969 E.01368
G1 X148.974 Y122.607 E1.15411
G1 X148.856 Y122.188 E.01348
G1 X122.183 Y148.86 E1.16769
G3 X121.771 Y148.736 I1.047 J-4.21 E.01335
G1 X148.738 Y121.768 E1.18059
G2 X148.609 Y121.36 I-4.148 J1.085 E.01326
G1 X121.36 Y148.609 E1.19292
G3 X120.956 Y148.476 I1.129 J-4.12 E.01318
G1 X148.474 Y120.958 E1.20471
G2 X148.337 Y120.557 I-4.074 J1.166 E.01311
G1 X120.562 Y148.333 E1.21597
G1 X120.168 Y148.189 E.01298
G1 X148.186 Y120.171 E1.22658
G1 X148.034 Y119.786 E.01283
G1 X119.787 Y148.033 E1.23664
G1 X119.409 Y147.874 E.0127
G1 X147.875 Y119.407 E1.24623
G1 X147.708 Y119.037 E.01257
G1 X119.033 Y147.712 E1.25535
G1 X118.671 Y147.537 E.01246
G1 X147.541 Y118.667 E1.26391
G2 X147.362 Y118.309 I-3.676 J1.62 E.0124
G1 X118.308 Y147.363 E1.27193
G3 X117.953 Y147.181 I1.642 J-3.651 E.01237
G1 X147.18 Y117.954 E1.27952
G2 X146.996 Y117.601 I-3.628 J1.663 E.01234
G1 X117.605 Y146.992 E1.2867
G1 X117.257 Y146.802 E.01226
G1 X146.799 Y117.26 E1.29332
G1 X146.602 Y116.919 E.01217
G1 X116.92 Y146.602 E1.29946
G1 X116.586 Y146.398 E.0121
G1 X146.4 Y116.584 E1.30522
G1 X146.19 Y116.258 E.01203
G1 X116.253 Y146.194 E1.31059
M73 P51 R14
G1 X115.933 Y145.977 E.01197
G1 X145.979 Y115.931 E1.31535
G2 X145.76 Y115.613 I-3.297 J2.036 E.01196
G1 X143.714 Y117.659 E.08956
G2 X143.777 Y117.059 I-4.034 J-.728 E.0187
G1 X145.535 Y115.301 E.07696
G1 X145.31 Y114.988 E.01192
G1 X143.736 Y116.562 E.06891
G2 X143.636 Y116.125 I-3.887 J.663 E.01388
G1 X145.075 Y114.686 E.06299
G1 X144.836 Y114.388 E.01183
G1 X143.482 Y115.742 E.05928
G2 X143.291 Y115.396 I-1.822 J.781 E.01226
G1 X144.598 Y114.089 E.05722
G2 X144.347 Y113.803 I-2.985 J2.372 E.01179
G1 X143.065 Y115.084 E.0561
G2 X142.801 Y114.811 I-1.497 J1.182 E.01178
G1 X144.095 Y113.517 E.05663
G2 X143.841 Y113.234 I-2.969 J2.4 E.01178
G1 X142.505 Y114.57 E.05851
G2 X142.175 Y114.363 I-1.203 J1.548 E.01208
G1 X143.576 Y112.962 E.06133
G1 X143.311 Y112.69 E.01176
G1 X141.806 Y114.194 E.06587
G2 X141.39 Y114.073 I-.816 J2.02 E.01343
G1 X143.041 Y112.422 E.07229
G1 X142.763 Y112.163 E.01177
G1 X140.921 Y114.005 E.08063
G2 X140.369 Y114.02 I-.2 J2.769 E.01714
G1 X142.484 Y111.905 E.09261
G2 X142.199 Y111.652 I-2.671 J2.724 E.01179
G1 X139.651 Y114.201 E.11157
G2 X137.893 Y115.959 I1.057 J2.815 E.07937
G1 X117.222 Y136.63 E.90493
G3 X117.496 Y136.892 I-1.174 J1.502 E.01178
G1 X137.715 Y116.674 E.88513
G2 X137.699 Y117.227 I3.239 J.368 E.01714
G1 X117.739 Y137.187 E.87384
G3 X117.946 Y137.517 I-3.901 J2.689 E.01206
G1 X137.764 Y117.699 E.86759
G2 X137.888 Y118.112 I2.125 J-.414 E.01338
G1 X118.112 Y137.888 E.86578
G3 X118.236 Y138.302 I-2.004 J.827 E.01338
G1 X138.054 Y118.484 E.8676
G2 X138.262 Y118.813 I4.139 J-2.381 E.01206
G1 X118.301 Y138.774 E.87386
G3 X118.285 Y139.327 I-3.248 J.184 E.01715
G1 X138.504 Y119.108 E.88516
G2 X138.779 Y119.371 I1.447 J-1.237 E.01178
G1 X118.107 Y140.043 E.90498
G3 X116.351 Y141.799 I-2.882 J-1.126 E.07912
G1 X113.801 Y144.348 E.11162
G3 X113.516 Y144.096 I2.389 J-2.98 E.01179
G1 X115.632 Y141.98 E.09264
G3 X115.08 Y141.995 I-.352 J-2.751 E.01714
G1 X113.238 Y143.837 E.08065
G1 X112.959 Y143.579 E.01177
G1 X114.61 Y141.927 E.0723
G3 X114.195 Y141.806 I.399 J-2.138 E.01343
G1 X112.69 Y143.311 E.06588
G1 X112.425 Y143.039 E.01176
G1 X113.826 Y141.637 E.06134
G3 X113.496 Y141.43 I.868 J-1.748 E.01208
G1 X112.159 Y142.767 E.05851
G3 X111.906 Y142.483 I2.701 J-2.671 E.01178
G1 X113.199 Y141.189 E.05664
G3 X112.935 Y140.916 I1.229 J-1.452 E.01178
G1 X111.654 Y142.198 E.0561
G3 X111.402 Y141.912 I2.761 J-2.683 E.01179
G1 X112.709 Y140.605 E.05721
G3 X112.518 Y140.259 I1.634 J-1.13 E.01226
G1 X111.164 Y141.613 E.05927
G1 X110.926 Y141.314 E.01183
G1 X112.364 Y139.875 E.06299
G3 X112.264 Y139.439 I3.769 J-1.098 E.01388
G1 X110.69 Y141.012 E.0689
G1 X110.465 Y140.7 E.01192
G1 X112.223 Y138.942 E.07694
G3 X112.286 Y138.342 I4.137 J.13 E.01869
G1 X110.241 Y140.387 E.08952
G3 X110.022 Y140.069 I3.08 J-2.356 E.01196
G1 X140.067 Y110.024 E1.31536
G1 X140.387 Y110.241 E.01197
G1 X114.648 Y135.98 E1.12681
G3 X115.249 Y135.917 I.656 J3.333 E.01873
G1 X140.703 Y110.462 E1.11438
G1 X141.009 Y110.694 E.01187
G1 X115.748 Y135.955 E1.1059
G3 X116.181 Y136.059 I-.618 J3.535 E.0138
G1 X141.315 Y110.925 E1.10031
G3 X141.615 Y111.162 I-2.223 J3.13 E.01185
G1 X116.567 Y136.21 E1.09658
G3 X116.915 Y136.4 I-.774 J1.831 E.01228
G1 X142.028 Y111.287 E1.09942
; WIPE_START
G1 X140.614 Y112.701 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.997 Y113.186 Z2.4 F42000
G1 X110.776 Y114.602 Z2.4
G1 Z2
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X112.92 Y112.458 E.09386
G3 X115.802 Y110.113 I14.473 J14.846 E.11517
G1 X110.09 Y115.825 E.25005
G2 X109.213 Y117.239 I13.727 J9.491 E.05153
G1 X117.251 Y109.201 E.35189
G3 X118.393 Y108.596 I6.634 J11.148 E.04001
G1 X108.594 Y118.395 E.42897
G2 X108.129 Y119.397 I9.811 J5.161 E.03422
G1 X119.394 Y108.132 E.49317
G3 X120.302 Y107.762 I4.162 J8.905 E.03035
G1 X107.469 Y120.594 E.56178
M204 S10000
G1 X106.258 Y129.864 F42000
G1 F9476.427
M204 S6000
G1 X117.955 Y118.167 E.51206
G3 X117.289 Y118.296 I-.927 J-3.006 E.02105
G1 X106.379 Y129.206 E.47761
G3 X106.36 Y128.688 I5.183 J-.452 E.01605
G1 X116.754 Y118.294 E.45503
G3 X116.296 Y118.214 I.169 J-2.323 E.0144
G1 X106.347 Y128.164 E.43557
G3 X106.352 Y127.621 I5.441 J-.217 E.0168
G1 X115.891 Y118.082 E.4176
G3 X115.531 Y117.905 I.708 J-1.887 E.01244
M73 P51 R13
G1 X106.366 Y127.07 E.40125
G3 X106.401 Y126.498 I5.759 J.069 E.01777
G1 X115.207 Y117.692 E.38551
G3 X114.916 Y117.445 I1.086 J-1.578 E.01182
G1 X106.445 Y125.917 E.37086
G3 X106.518 Y125.307 I6.141 J.423 E.01903
G1 X114.663 Y117.161 E.35659
G3 X114.443 Y116.844 I1.478 J-1.261 E.01197
G1 X106.6 Y124.688 E.34337
G1 X106.715 Y124.035 E.0205
G1 X114.258 Y116.492 E.33022
G3 X114.116 Y116.097 I3.513 J-1.483 E.01301
G1 X106.852 Y123.361 E.31802
G1 X107.01 Y122.665 E.0221
G1 X114.025 Y115.651 E.30708
G3 X114.004 Y115.134 I3.15 J-.386 E.01602
G1 X107.22 Y121.918 E.29699
G3 X107.467 Y121.134 I7.981 J2.083 E.02546
G1 X114.36 Y114.241 E.30175
; WIPE_START
G1 X112.946 Y115.655 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.016 Y112.585 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X121.143 Y107.458 E.22444
G1 X121.92 Y107.218 E.02517
G1 X116.911 Y112.227 E.21927
G3 X117.425 Y112.25 I.108 J3.333 E.01595
G1 X122.656 Y107.019 E.22899
G3 X123.364 Y106.849 I2.061 J6.995 E.02255
G1 X117.874 Y112.339 E.24034
G3 X118.267 Y112.483 I-.527 J2.032 E.01297
G1 X124.037 Y106.713 E.25264
G3 X124.682 Y106.605 I1.401 J6.411 E.02025
G1 X118.62 Y112.667 E.26538
G3 X118.939 Y112.886 I-.937 J1.706 E.01198
G1 X125.314 Y106.51 E.27911
G1 X125.911 Y106.45 E.01857
G1 X119.219 Y113.143 E.29298
G3 X119.467 Y113.432 I-1.323 J1.383 E.01182
G1 X126.502 Y106.397 E.30798
G1 X127.067 Y106.369 E.01753
G1 X119.681 Y113.755 E.32334
G3 X119.858 Y114.115 I-3.676 J2.029 E.01243
G1 X127.624 Y106.35 E.33998
G1 X128.161 Y106.35 E.01663
G1 X119.989 Y114.521 E.35776
G3 X120.071 Y114.977 I-3.949 J.946 E.01433
G1 X128.691 Y106.357 E.37736
G1 X129.203 Y106.383 E.01586
G1 X120.073 Y115.512 E.39966
G3 X119.945 Y116.177 I-2.221 J-.082 E.02105
G1 X129.71 Y106.413 E.42748
G1 X130.198 Y106.461 E.01519
G1 X106.456 Y130.203 E1.03939
G1 X106.516 Y130.681 E.01489
G1 X130.687 Y106.51 E1.05815
G3 X131.154 Y106.58 I-.486 J4.829 E.01463
G1 X106.576 Y131.158 E1.07598
G2 X106.653 Y131.618 I4.639 J-.546 E.01444
G1 X131.621 Y106.651 E1.09303
G3 X132.074 Y106.735 I-.618 J4.578 E.01427
G1 X106.734 Y132.075 E1.10933
G2 X106.825 Y132.521 I4.515 J-.684 E.01411
G1 X132.52 Y106.825 E1.12493
G3 X132.961 Y106.922 I-.745 J4.458 E.01397
G1 X106.925 Y132.959 E1.13985
G2 X107.027 Y133.394 I4.414 J-.805 E.01384
G1 X133.389 Y107.031 E1.15413
G1 X133.818 Y107.14 E.01368
G1 X107.144 Y133.813 E1.16772
G1 X107.262 Y134.232 E.01348
G1 X134.23 Y107.265 E1.18061
G1 X134.641 Y107.391 E.0133
G1 X107.391 Y134.641 E1.19294
G1 X107.526 Y135.043 E.01313
G1 X135.045 Y107.524 E1.20473
G1 X135.439 Y107.668 E.01298
G1 X107.663 Y135.443 E1.21599
G1 X107.815 Y135.829 E.01283
G1 X135.833 Y107.811 E1.2266
G3 X136.214 Y107.967 I-1.373 J3.896 E.01276
G1 X107.966 Y136.215 E1.23666
G2 X108.125 Y136.593 I3.871 J-1.405 E.01271
G1 X136.592 Y108.126 E1.24624
G3 X136.967 Y108.288 I-1.429 J3.832 E.01266
G1 X108.292 Y136.964 E1.25537
G1 X108.459 Y137.334 E.01257
G1 X137.33 Y108.463 E1.26393
G1 X137.693 Y108.638 E.01246
G1 X108.639 Y137.691 E1.27194
G1 X108.821 Y138.047 E.01236
G1 X138.048 Y108.819 E1.27953
G1 X138.396 Y109.009 E.01226
G1 X109.005 Y138.4 E1.28671
G1 X109.201 Y138.741 E.01217
G1 X138.744 Y109.198 E1.29333
G3 X139.081 Y109.398 I-1.839 J3.478 E.01214
G1 X109.398 Y139.081 E1.29947
G2 X109.6 Y139.416 I3.459 J-1.856 E.01212
G1 X139.414 Y109.602 E1.30523
G1 X139.748 Y109.806 E.0121
G1 X109.688 Y139.866 E1.31597
M204 S10000
M73 P52 R13
G1 X113.973 Y144.714 F42000
G1 F9476.427
M204 S6000
G1 X139.086 Y119.601 E1.09942
G2 X139.434 Y119.79 I1.122 J-1.645 E.01228
G1 X114.385 Y144.839 E1.09658
G2 X114.686 Y145.075 I2.521 J-2.89 E.01185
G1 X139.82 Y119.942 E1.10032
G2 X140.253 Y120.045 I1.05 J-3.432 E.01381
G1 X114.992 Y145.307 E1.10592
G1 X115.297 Y145.538 E.01187
G1 X140.752 Y120.083 E1.1144
G2 X141.353 Y120.019 I-.057 J-3.405 E.01873
G1 X115.492 Y145.881 E1.13219
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9476.427
G1 X116.906 Y144.467 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/76
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.4 I.344 J1.167 P1  F42000
G1 X138.768 Y138.034 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.891 Y138.024 E.00409
G3 X138.621 Y138.045 I.068 J2.708 E.55558
G1 X138.708 Y138.038 E.0029
M204 S10000
G1 X138.799 Y138.439 F42000
G1 F5400
M204 S6000
G1 X138.901 Y138.432 E.00341
G3 X138.672 Y138.449 I.057 J2.301 E.47204
G1 X138.739 Y138.444 E.00222
M204 S250
G1 X138.828 Y138.83 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X138.911 Y138.824 E.00255
G3 X138.721 Y138.839 I.048 J1.908 E.36271
G1 X138.768 Y138.835 E.00146
; WIPE_START
M204 S6000
G1 X138.911 Y138.824 E-.0544
G1 X139.29 Y138.853 E-.14451
G1 X139.656 Y138.956 E-.14458
G1 X139.995 Y139.129 E-.14456
G1 X140.15 Y139.24 E-.0724
G1 X140.422 Y139.506 E-.14451
G1 X140.503 Y139.626 E-.05504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.907 Y138.879 Z2.6 F42000
G1 X117.452 Y137.361 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X117.505 Y137.432 E.00294
G3 X114.929 Y136.269 I-2.239 J1.525 E.46592
G1 X115.199 Y136.249 E.00898
G3 X117.342 Y137.217 I.067 J2.708 E.08069
G1 X117.416 Y137.313 E.00403
M204 S10000
G1 X117.108 Y137.589 F42000
G1 F5400
M204 S6000
G1 X117.168 Y137.662 E.00315
G3 X114.98 Y136.674 I-1.902 J1.295 E.39586
G1 X115.209 Y136.656 E.00762
G3 X116.874 Y137.31 I.057 J2.301 E.06095
G1 X117.069 Y137.543 E.01007
M204 S250
G1 X116.809 Y137.84 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X116.844 Y137.883 E.00172
G3 X115.028 Y137.063 I-1.578 J1.074 E.30418
G1 X115.218 Y137.049 E.00586
G3 X116.6 Y137.591 I.048 J1.908 E.04683
G1 X116.77 Y137.794 E.00813
; WIPE_START
M204 S6000
G1 X116.844 Y137.883 E-.04401
G1 X117.026 Y138.216 E-.14445
G1 X117.138 Y138.58 E-.14453
G1 X117.167 Y138.768 E-.07244
G1 X117.167 Y139.149 E-.14452
G1 X117.091 Y139.521 E-.14456
G1 X117.025 Y139.68 E-.0655
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.265 Y132.086 Z2.6 F42000
G1 X114.723 Y116.664 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X114.663 Y116.561 E.00394
G3 X116.704 Y112.577 I2.378 J-1.297 E.17478
G1 X116.974 Y112.557 E.00898
G3 X114.804 Y116.792 I.067 J2.708 E.37184
G1 X114.756 Y116.715 E.00303
M204 S10000
G1 X115.071 Y116.452 F42000
G1 F5400
M204 S6000
G1 X115.021 Y116.366 E.00327
G3 X116.755 Y112.981 I2.02 J-1.102 E.1485
G1 X116.984 Y112.964 E.00763
G3 X115.141 Y116.562 I.057 J2.301 E.31592
G1 X115.103 Y116.502 E.00235
M204 S250
G1 X115.412 Y116.251 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X115.365 Y116.179 E.00265
G3 X116.804 Y113.371 I1.676 J-.914 E.11411
G1 X116.994 Y113.356 E.00586
G3 X115.58 Y116.493 I.047 J1.908 E.23691
G1 X115.447 Y116.3 E.00719
; WIPE_START
M204 S6000
G1 X115.365 Y116.179 E-.05551
G1 X115.216 Y115.829 E-.1445
G1 X115.141 Y115.456 E-.14456
G1 X115.141 Y115.076 E-.14434
G1 X115.191 Y114.793 E-.10919
G1 X115.32 Y114.437 E-.14401
G1 X115.345 Y114.397 E-.01789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.977 Y114.411 Z2.6 F42000
G1 X139.98 Y114.442 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X140.131 Y114.399 E.00519
G3 X140.397 Y114.352 I.603 J2.641 E.00896
G1 X140.666 Y114.332 E.00897
G3 X139.871 Y114.472 I.067 J2.708 E.53767
G1 X139.922 Y114.458 E.00177
M204 S10000
G1 X140.118 Y114.832 F42000
G1 F5400
M204 S6000
G1 X140.447 Y114.757 E.01122
G1 X140.677 Y114.739 E.00762
G3 X140.001 Y114.859 I.057 J2.301 E.45681
G1 X140.059 Y114.845 E.00199
M204 S250
G1 X140.205 Y115.213 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X140.496 Y115.146 E.00919
G1 X140.686 Y115.132 E.00586
G3 X140.126 Y115.231 I.048 J1.908 E.35102
G1 X140.146 Y115.226 E.00064
; WIPE_START
M204 S6000
G1 X140.496 Y115.146 E-.13649
G1 X140.686 Y115.132 E-.07243
G1 X141.066 Y115.16 E-.14456
G1 X141.432 Y115.263 E-.14451
G1 X141.77 Y115.437 E-.14456
G1 X141.925 Y115.548 E-.07242
G1 X142.01 Y115.631 E-.04504
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.145 Y122.59 Z2.6 F42000
G1 X149.544 Y132.355 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G3 X118.956 Y107.955 I-21.552 J-4.355 E2.98271
G3 X129.454 Y106.061 I9.03 J20.011 E.35744
G3 X149.555 Y132.296 I-1.462 J21.939 E1.24059
M204 S10000
G1 X149.943 Y132.436 F42000
G1 F5400
M204 S6000
G3 X117.782 Y108.069 I-21.951 J-4.435 E3.00091
G3 X129.474 Y105.655 I10.238 J20.066 E.40082
G3 X149.955 Y132.377 I-1.482 J22.346 E1.26384
M204 S250
G1 X150.327 Y132.514 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X117.603 Y107.72 I-22.335 J-4.513 E2.8284
G3 X129.494 Y105.263 I10.417 J20.416 E.37759
G3 X150.339 Y132.455 I-1.502 J22.737 E1.1914
; WIPE_START
M204 S6000
G1 X150.085 Y133.623 E-.45446
G1 X149.867 Y134.397 E-.30554
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


G1 X145.881 Y140.508 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42281
G1 F9476.427
M204 S6000
G1 X120.022 Y114.649 E1.1321
G3 X120.085 Y115.249 I-4.037 J.728 E.0187
G1 X145.535 Y140.699 E1.11418
G1 X145.31 Y141.012 E.01192
G1 X120.044 Y115.745 E1.10613
G3 X119.943 Y116.182 I-3.888 J-.664 E.01388
G1 X145.075 Y141.314 E1.10022
G1 X144.836 Y141.612 E.01183
G1 X119.79 Y116.566 E1.0965
G3 X119.595 Y116.908 I-1.422 J-.586 E.01222
G1 X144.719 Y142.032 E1.0999
M204 S10000
G1 X139.87 Y146.316 F42000
G1 F9476.427
M204 S6000
G1 X109.811 Y116.257 E1.31595
G1 X109.6 Y116.584 E.01203
G1 X139.414 Y146.398 E1.30523
G1 X139.081 Y146.602 E.0121
G1 X109.398 Y116.919 E1.29947
G1 X109.201 Y117.259 E.01217
G1 X138.744 Y146.802 E1.29333
G1 X138.396 Y146.991 E.01226
G1 X109.005 Y117.6 E1.28671
G2 X108.821 Y117.953 I3.439 J2.014 E.01234
G1 X138.048 Y147.181 E1.27953
G3 X137.693 Y147.362 I-1.998 J-3.47 E.01236
G1 X108.639 Y118.309 E1.27194
G2 X108.459 Y118.666 I3.497 J1.979 E.0124
G1 X137.33 Y147.537 E1.26393
G1 X136.967 Y147.712 E.01246
G1 X108.292 Y119.037 E1.25537
M73 P53 R13
G1 X108.125 Y119.407 E.01257
G1 X136.592 Y147.874 E1.24624
G1 X136.214 Y148.033 E.0127
G1 X107.966 Y119.785 E1.23666
G1 X107.815 Y120.171 E.01283
G1 X135.833 Y148.189 E1.2266
G1 X135.439 Y148.332 E.01298
G1 X107.663 Y120.557 E1.21599
G2 X107.526 Y120.957 I3.915 J1.559 E.01311
G1 X135.045 Y148.476 E1.20473
G3 X134.641 Y148.609 I-1.532 J-3.98 E.01318
G1 X107.391 Y121.359 E1.19294
G2 X107.262 Y121.768 I4.027 J1.496 E.01326
G1 X134.23 Y148.735 E1.18061
G3 X133.818 Y148.86 I-1.455 J-4.069 E.01335
G1 X107.144 Y122.187 E1.16771
G1 X107.027 Y122.606 E.01348
G1 X133.389 Y148.969 E1.15413
G1 X132.961 Y149.078 E.01368
G1 X106.925 Y123.041 E1.13985
G1 X106.825 Y123.479 E.01389
G1 X132.52 Y149.175 E1.12493
G1 X132.074 Y149.265 E.01411
G1 X106.734 Y123.925 E1.10933
G1 X106.653 Y124.382 E.01436
G1 X131.621 Y149.349 E1.09303
G1 X131.154 Y149.42 E.01462
G1 X106.576 Y124.842 E1.07598
G1 X106.516 Y125.319 E.01489
G1 X130.687 Y149.49 E1.05815
G1 X130.198 Y149.539 E.01519
G1 X106.456 Y125.797 E1.03939
G2 X106.417 Y126.294 I4.974 J.647 E.01546
G1 X116.181 Y136.058 E.42746
G2 X115.51 Y135.925 I-.977 J3.159 E.02121
G1 X106.379 Y126.794 E.39974
G2 X106.36 Y127.312 I5.175 J.452 E.01605
G1 X114.979 Y135.931 E.37733
G2 X114.521 Y136.01 I.337 J3.336 E.01441
G1 X106.347 Y127.836 E.35783
G2 X106.352 Y128.379 I5.441 J.217 E.0168
G1 X114.117 Y136.143 E.33992
G2 X113.754 Y136.317 I.688 J1.904 E.01249
G1 X106.366 Y128.93 E.32342
G2 X106.401 Y129.503 I5.759 J-.069 E.01777
G1 X113.432 Y136.533 E.30777
G2 X113.146 Y136.785 I.875 J1.279 E.01181
G1 X106.445 Y130.083 E.29337
G2 X106.518 Y130.693 I6.139 J-.423 E.01903
G1 X112.888 Y137.063 E.27887
G2 X112.667 Y137.38 I1.477 J1.26 E.01197
G1 X106.6 Y131.312 E.26564
G1 X106.715 Y131.965 E.0205
G1 X112.482 Y137.732 E.25249
G2 X112.34 Y138.128 I3.508 J1.482 E.01301
G1 X106.852 Y132.639 E.24029
G1 X107.01 Y133.335 E.0221
G1 X112.249 Y138.574 E.22936
G2 X112.229 Y139.09 I3.148 J.386 E.01602
G1 X107.22 Y134.082 E.21927
G2 X107.467 Y134.866 I7.976 J-2.081 E.02546
G1 X112.584 Y139.983 E.22402
; WIPE_START
G1 X111.17 Y138.569 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.244 Y141.643 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X121.143 Y148.542 E.302
G1 X121.92 Y148.782 E.02517
G1 X115.135 Y141.996 E.29704
G2 X115.653 Y141.977 I.108 J-4.142 E.01607
G1 X122.656 Y148.981 E.30659
G2 X123.364 Y149.151 I2.063 J-7.003 E.02255
G1 X116.096 Y141.883 E.31818
G2 X116.493 Y141.743 I-.502 J-2.053 E.01305
G1 X124.037 Y149.287 E.33028
G2 X124.682 Y149.395 I1.401 J-6.41 E.02025
G1 X116.845 Y141.558 E.34309
G2 X117.161 Y141.336 I-.949 J-1.687 E.01196
G1 X125.314 Y149.49 E.35695
G1 X125.911 Y149.55 E.01857
G1 X117.439 Y141.078 E.37089
G2 X117.691 Y140.792 I-1 J-1.135 E.01181
G1 X126.502 Y149.603 E.38571
G1 X127.067 Y149.631 E.01753
G1 X117.906 Y140.47 E.40107
G2 X118.083 Y140.109 I-3.657 J-2.02 E.01243
G1 X127.624 Y149.65 E.4177
G1 X128.161 Y149.65 E.01663
G1 X118.214 Y139.703 E.43548
G2 X118.296 Y139.248 I-3.943 J-.945 E.01433
G1 X128.691 Y149.643 E.45508
G1 X129.203 Y149.617 E.01586
G1 X118.298 Y138.713 E.47739
G2 X118.17 Y138.048 I-2.221 J.082 E.02105
G1 X129.865 Y149.742 E.51199
M204 S10000
G1 X120.586 Y148.522 F42000
G1 F9476.427
M204 S6000
G1 X107.764 Y135.7 E.56132
G2 X108.129 Y136.603 I9.22 J-3.207 E.03016
G1 X119.394 Y147.868 E.49316
G3 X118.393 Y147.404 I4.149 J-10.263 E.03418
G1 X108.594 Y137.605 E.42896
G2 X109.213 Y138.761 I11.888 J-5.619 E.0406
G1 X117.251 Y146.799 E.35189
G1 X117.171 Y146.756 E.00281
G3 X115.802 Y145.887 I8.025 J-14.166 E.05023
G1 X110.09 Y140.175 E.25004
G1 X110.106 Y140.2 E.0009
G2 X112.76 Y143.382 I17.683 J-12.048 E.12848
G1 X114.603 Y145.225 E.08068
; WIPE_START
G1 X113.189 Y143.811 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.702 Y136.194 Z2.6 F42000
G1 X111.282 Y113.967 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F9476.427
M204 S6000
G1 X136.406 Y139.092 E1.0999
G2 X136.21 Y139.433 I1.306 J.974 E.01222
G1 X111.164 Y114.387 E1.09649
G1 X110.926 Y114.686 E.01183
G1 X136.057 Y139.817 E1.10021
G2 X135.956 Y140.254 I3.768 J1.098 E.01388
G1 X110.69 Y114.988 E1.10612
G1 X110.465 Y115.3 E.01192
G1 X135.915 Y140.75 E1.11416
G2 X135.978 Y141.35 I4.13 J-.129 E.0187
G1 X110.241 Y115.613 E1.12675
G2 X110.022 Y115.931 I3.082 J2.358 E.01196
G1 X140.067 Y145.976 E1.31536
G1 X140.387 Y145.759 E.01197
G1 X138.339 Y143.711 E.08964
G2 X138.94 Y143.775 I.632 J-3.095 E.01874
G1 X140.703 Y145.538 E.0772
G1 X141.009 Y145.306 E.01187
G1 X139.439 Y143.736 E.06874
G2 X139.874 Y143.635 I-.292 J-2.232 E.01387
G1 X141.315 Y145.075 E.06306
G2 X141.615 Y144.838 I-2.223 J-3.13 E.01185
G1 X140.26 Y143.483 E.05932
G2 X140.604 Y143.29 I-.793 J-1.817 E.01224
G1 X141.907 Y144.593 E.05704
G1 X142.199 Y144.348 E.0118
G1 X140.914 Y143.063 E.05626
G2 X141.19 Y142.804 I-1.155 J-1.508 E.01171
G1 X142.484 Y144.095 E.05659
G1 X142.763 Y143.837 E.01177
G1 X141.43 Y142.504 E.05837
G2 X141.639 Y142.175 I-1.239 J-1.021 E.01207
G1 X143.041 Y143.578 E.06141
G2 X143.311 Y143.31 I-2.548 J-2.827 E.01176
G1 X141.804 Y141.804 E.06594
G2 X141.928 Y141.391 I-2.001 J-.826 E.01338
G1 X143.576 Y143.038 E.07212
G1 X143.841 Y142.766 E.01176
G1 X141.993 Y140.918 E.0809
G2 X141.977 Y140.365 I-3.248 J-.184 E.01715
G1 X144.095 Y142.483 E.09269
G1 X144.347 Y142.197 E.01178
G1 X141.799 Y139.65 E.11152
G2 X140.039 Y137.89 I-2.824 J1.064 E.07943
G1 X119.37 Y117.221 E.90486
G3 X119.109 Y117.497 I-1.509 J-1.167 E.01178
G1 X139.328 Y137.716 E.88519
G2 X138.774 Y137.699 I-.373 J3.052 E.0172
G1 X118.815 Y117.74 E.87378
G3 X118.482 Y117.944 I-1.187 J-1.562 E.01211
G1 X138.3 Y137.763 E.86763
G2 X137.888 Y137.888 I.974 J3.949 E.01334
G1 X118.112 Y118.112 E.86577
G3 X117.7 Y118.237 I-1.396 J-3.854 E.01334
M73 P54 R13
G1 X137.519 Y138.055 E.86762
G2 X137.186 Y138.26 I.851 J1.763 E.01211
G1 X117.227 Y118.301 E.87376
G3 X116.673 Y118.284 I-.183 J-3.071 E.01719
G1 X136.892 Y138.503 E.88516
G2 X136.63 Y138.779 I1.25 J1.446 E.01178
G1 X115.962 Y118.111 E.90482
G3 X114.2 Y116.349 I1.062 J-2.824 E.07952
G1 X111.654 Y113.802 E.11148
G1 X111.906 Y113.517 E.01178
G1 X114.022 Y115.634 E.09266
G3 X114.007 Y115.081 I3.239 J-.368 E.01714
G1 X112.159 Y113.233 E.08088
G1 X112.425 Y112.961 E.01176
G1 X114.075 Y114.612 E.07224
G3 X114.194 Y114.194 I3.146 J.673 E.01346
G1 X112.69 Y112.689 E.06586
G3 X112.959 Y112.421 I2.822 J2.564 E.01176
G1 X114.364 Y113.826 E.0615
G3 X114.57 Y113.495 I1.761 J.864 E.0121
G1 X113.238 Y112.163 E.05831
G1 X113.516 Y111.904 E.01177
G1 X114.809 Y113.197 E.05659
G3 X115.086 Y112.937 I3.943 J3.925 E.01177
G1 X113.801 Y111.652 E.05626
G1 X114.093 Y111.407 E.0118
G1 X115.396 Y112.709 E.05704
G3 X115.741 Y112.517 I1.135 J1.623 E.01224
G1 X114.385 Y111.161 E.05933
G3 X114.686 Y110.925 I2.523 J2.894 E.01185
G1 X116.126 Y112.365 E.06307
G3 X116.562 Y112.263 I.727 J2.13 E.01387
G1 X114.992 Y110.693 E.06875
G1 X115.297 Y110.462 E.01187
G1 X117.061 Y112.225 E.07722
G3 X117.662 Y112.289 I-.032 J3.155 E.01874
G1 X115.614 Y110.241 E.08967
G1 X115.933 Y110.023 E.01197
G1 X145.979 Y140.069 E1.31535
G1 X146.19 Y139.742 E.01203
G1 X116.253 Y109.806 E1.31059
G1 X116.586 Y109.602 E.0121
G1 X146.4 Y139.416 E1.30522
G2 X146.602 Y139.081 I-3.254 J-2.189 E.01212
G1 X116.92 Y109.398 E1.29946
G3 X117.257 Y109.198 I2.175 J3.277 E.01214
G1 X146.799 Y138.74 E1.29332
G1 X146.996 Y138.399 E.01217
G1 X117.605 Y109.008 E1.2867
G1 X117.953 Y108.819 E.01226
G1 X147.18 Y138.046 E1.27952
G1 X147.362 Y137.691 E.01236
G1 X118.308 Y108.637 E1.27193
G1 X118.671 Y108.463 E.01246
G1 X147.541 Y137.333 E1.26391
G1 X147.708 Y136.963 E.01257
G1 X119.033 Y108.288 E1.25535
G3 X119.409 Y108.126 I1.811 J3.685 E.01266
G1 X147.875 Y136.593 E1.24623
G2 X148.034 Y136.214 I-3.707 J-1.781 E.01271
G1 X119.787 Y107.967 E1.23664
G3 X120.168 Y107.811 I1.757 J3.748 E.01276
G1 X148.186 Y135.829 E1.22659
G1 X148.337 Y135.443 E.01283
G1 X120.562 Y107.667 E1.21597
G1 X120.956 Y107.524 E.01298
G1 X148.474 Y135.042 E1.20471
G1 X148.609 Y134.64 E.01313
G1 X121.36 Y107.391 E1.19292
G1 X121.771 Y107.264 E.0133
G1 X148.738 Y134.232 E1.18059
G1 X148.856 Y133.812 E.01348
G1 X122.183 Y107.14 E1.16769
G1 X122.611 Y107.031 E.01368
G1 X148.974 Y133.393 E1.15411
G2 X149.076 Y132.958 I-4.327 J-1.243 E.01385
G1 X123.04 Y106.922 E1.13983
G3 X123.48 Y106.825 I1.187 J4.365 E.01397
G1 X149.175 Y132.52 E1.1249
G2 X149.266 Y132.074 I-4.425 J-1.131 E.01411
G1 X123.927 Y106.735 E1.1093
G3 X124.38 Y106.651 I1.072 J4.498 E.01427
G1 X149.347 Y131.617 E1.093
G2 X149.424 Y131.157 I-4.57 J-1.006 E.01444
G1 X124.847 Y106.58 E1.07595
G3 X125.314 Y106.51 I.934 J4.638 E.01463
G1 X149.484 Y130.68 E1.05812
G1 X149.544 Y130.202 E.01489
G1 X125.803 Y106.461 E1.03936
G1 X126.291 Y106.412 E.01519
G1 X137.829 Y117.951 E.50514
G2 X139.821 Y119.942 I2.892 J-.901 E.09066
G1 X149.583 Y129.705 E.4274
G1 X149.621 Y129.205 E.01551
G1 X140.491 Y120.075 E.39969
G2 X141.022 Y120.069 I.218 J-3.923 E.01645
G1 X149.64 Y128.687 E.37729
G1 X149.653 Y128.163 E.01623
G1 X141.48 Y119.99 E.3578
G2 X141.884 Y119.856 I-.466 J-2.084 E.01318
G1 X149.648 Y127.62 E.33989
G1 X149.634 Y127.069 E.01706
G1 X142.247 Y119.682 E.32339
G2 X142.569 Y119.467 I-2.612 J-4.249 E.01199
G1 X149.598 Y126.496 E.30775
G1 X149.555 Y125.916 E.01803
G1 X142.857 Y119.218 E.29323
G2 X143.113 Y118.936 I-1.278 J-1.419 E.01179
G1 X149.482 Y125.306 E.27884
G2 X149.4 Y124.686 I-6.249 J.512 E.01934
G1 X143.335 Y118.622 E.26551
G2 X143.517 Y118.266 I-1.686 J-1.086 E.01238
G1 X149.285 Y124.034 E.25252
G2 X149.148 Y123.36 I-6.827 J1.036 E.02131
G1 X143.66 Y117.871 E.24028
G2 X143.751 Y117.425 I-3.307 J-.91 E.0141
G1 X148.989 Y122.664 E.22933
G2 X148.78 Y121.917 I-7.544 J1.715 E.02403
G1 X143.767 Y116.904 E.21944
G2 X143.676 Y116.276 I-2.71 J.071 E.01968
G1 X148.532 Y121.132 E.21259
G2 X148.235 Y120.298 I-8.507 J2.558 E.02742
G1 X135.7 Y107.763 E.54879
G3 X136.607 Y108.133 I-3.262 J9.292 E.03036
G1 X147.87 Y119.395 E.49306
G2 X147.405 Y118.393 I-10.28 J4.162 E.03423
G1 X137.609 Y108.597 E.42884
G3 X138.751 Y109.202 I-5.485 J11.737 E.04003
G1 X146.785 Y117.236 E.35173
G2 X145.908 Y115.822 I-14.622 J8.089 E.05155
G1 X140.201 Y110.115 E.24983
G3 X143.094 Y112.471 I-11.658 J17.271 E.11563
G1 X145.22 Y114.597 E.09309
M204 S10000
G1 X141.757 Y114.357 F42000
G1 F9476.427
M204 S6000
G1 X134.859 Y107.459 E.302
G1 X134.082 Y107.219 E.02517
G1 X140.866 Y114.004 E.29702
G2 X140.348 Y114.022 I-.108 J4.169 E.01607
G1 X133.345 Y107.02 E.30657
G2 X132.637 Y106.849 I-2.063 J7.003 E.02255
G1 X139.905 Y114.117 E.31816
G2 X139.508 Y114.257 I.504 J2.058 E.01306
G1 X131.964 Y106.713 E.33026
G2 X131.319 Y106.605 I-1.402 J6.411 E.02025
G1 X139.156 Y114.442 E.34307
G2 X138.84 Y114.663 I.951 J1.69 E.01196
G1 X130.687 Y106.51 E.35693
G1 X130.095 Y106.456 E.01841
G1 X138.561 Y114.922 E.37064
G2 X138.309 Y115.207 I.999 J1.135 E.01181
G1 X129.503 Y106.401 E.38554
G2 X128.934 Y106.369 I-.654 J6.67 E.01764
G1 X138.095 Y115.53 E.40104
G2 X137.918 Y115.89 I3.688 J2.037 E.01243
G1 X128.377 Y106.35 E.41767
G1 X127.84 Y106.35 E.01663
G1 X137.786 Y116.296 E.43545
G2 X137.704 Y116.751 I3.969 J.951 E.01432
G1 X127.31 Y106.357 E.45505
G1 X126.798 Y106.383 E.01586
G1 X137.897 Y117.481 E.48589
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9476.427
G1 X136.483 Y116.067 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/76
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S153
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.6 I-1.194 J-.234 P1  F42000
G1 X134.122 Y128.135 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X134.21 Y128.317 E.0067
G1 X134.305 Y128.472 E.00604
G2 X134.074 Y128.779 I1.424 J1.313 E.01274
G1 X133.903 Y128.728 E.0059
G3 X133.946 Y128.16 I2.247 J-.118 E.01897
G1 X134.063 Y128.143 E.00391
; WIPE_START
G1 X134.21 Y128.317 E-.10414
G1 X134.305 Y128.472 E-.08333
G1 X134.074 Y128.779 E-.17551
G1 X133.903 Y128.728 E-.08141
G1 X133.903 Y128.494 E-.10711
G1 X133.946 Y128.16 E-.15452
G1 X134.063 Y128.143 E-.05397
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.876 Y128.422 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X138.052 Y128.469 E.00605
G3 X138.009 Y129.036 I-2.244 J.116 E.0189
G1 X137.833 Y129.06 E.0059
G2 X137.654 Y128.729 I-1.75 J.731 E.01251
G2 X137.845 Y128.473 I-1.437 J-1.27 E.01059
; WIPE_START
G1 X138.052 Y128.469 E-.09544
G1 X138.045 Y128.805 E-.15442
G1 X138.009 Y129.036 E-.10785
G1 X137.833 Y129.06 E-.08195
G1 X137.654 Y128.729 E-.17344
G1 X137.845 Y128.473 E-.1469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.61 Y136.067 Z2.8 F42000
G1 X138.888 Y138.826 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X138.911 Y138.824 E.0007
G3 X138.721 Y138.839 I.048 J1.908 E.36272
G1 X138.828 Y138.83 E.00331
; WIPE_START
M204 S6000
G1 X138.911 Y138.824 E-.03148
G1 X139.29 Y138.853 E-.1445
G1 X139.476 Y138.895 E-.07246
G1 X139.83 Y139.034 E-.14449
G1 X140.149 Y139.24 E-.14458
G1 X140.422 Y139.506 E-.14451
G1 X140.537 Y139.676 E-.07798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.928 Y139.078 Z2.8 F42000
G1 X116.785 Y137.811 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X116.844 Y137.883 E.00285
G3 X115.028 Y137.063 I-1.578 J1.075 E.30418
G1 X115.218 Y137.049 E.00586
G3 X116.6 Y137.591 I.048 J1.908 E.04683
G1 X116.746 Y137.765 E.00699
; WIPE_START
M204 S6000
G1 X116.844 Y137.883 E-.05807
G1 X116.944 Y138.045 E-.07242
G1 X117.091 Y138.395 E-.14451
G1 X117.167 Y138.768 E-.14455
G1 X117.167 Y139.149 E-.14457
G1 X117.091 Y139.521 E-.14451
G1 X117.039 Y139.646 E-.05137
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.505 Y132.032 Z2.8 F42000
G1 X115.396 Y116.227 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X115.365 Y116.179 E.00177
G3 X116.804 Y113.371 I1.676 J-.914 E.1141
G1 X116.994 Y113.356 E.00586
G3 X115.58 Y116.493 I.048 J1.908 E.23691
G1 X115.431 Y116.277 E.00807
; WIPE_START
M204 S6000
G1 X115.365 Y116.179 E-.04468
G1 X115.216 Y115.829 E-.14446
G1 X115.141 Y115.456 E-.14457
G1 X115.141 Y115.076 E-.14453
G1 X115.216 Y114.703 E-.14458
G1 X115.356 Y114.37 E-.13717
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.985 Y114.623 Z2.8 F42000
G1 X140.25 Y115.196 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X140.496 Y115.146 E.00774
G1 X140.686 Y115.132 E.00585
G3 X140.191 Y115.21 I.048 J1.908 E.35313
; WIPE_START
M204 S6000
G1 X140.496 Y115.146 E-.11844
G1 X140.686 Y115.132 E-.07236
G1 X141.066 Y115.16 E-.1445
G1 X141.432 Y115.263 E-.14462
G1 X141.77 Y115.437 E-.14451
G1 X142.049 Y115.659 E-.13556
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.416 Y122.509 Z2.8 F42000
G1 X150.336 Y132.515 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S5000
G3 X128.568 Y105.217 I-22.336 J-4.517 E3.17737
G1 X129.637 Y105.27 E.03288
G1 X129.703 Y105.274 E.00204
M73 P55 R13
G3 X150.347 Y132.456 I-1.703 J22.724 E1.18539
; WIPE_START
M204 S6000
G1 X150.085 Y133.623 E-.45453
G1 X149.868 Y134.397 E-.30547
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


G1 X147.302 Y129.449 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.254657
G1 F15000
M204 S6000
G1 X147.027 Y129.427 E.00476
; LINE_WIDTH: 0.210018
G1 X146.747 Y129.405 E.00383
; LINE_WIDTH: 0.179637
G1 X146.703 Y129.462 E.00079
M204 S10000
G1 X147.302 Y129.449 F42000
; LINE_WIDTH: 0.274146
G1 F15000
M204 S6000
G1 X147.425 Y129.338 E.00312
; WIPE_START
G1 X147.302 Y129.449 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.084 Y137.078 Z2.8 F42000
G1 X146.994 Y140.201 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X140.184 Y147.011 E.29594
; WIPE_START
M204 S6000
G1 X141.598 Y145.597 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P55 R12
G1 X138.883 Y147.779 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X147.792 Y138.87 E.38714
G1 X148.359 Y137.77
G1 X137.784 Y148.345 E.45954
G1 X136.81 Y148.785
G1 X148.797 Y136.799 E.52088
G1 X149.144 Y135.918
G1 X135.921 Y149.141 E.5746
G1 X135.092 Y149.438
G1 X149.431 Y135.099 E.6231
G1 X149.673 Y134.323
G1 X134.321 Y149.675 E.66714
G1 X133.59 Y149.872
G1 X149.882 Y133.581 E.70794
G1 X150.04 Y132.889
G1 X132.885 Y150.045 E.74548
G1 X132.216 Y150.18
G1 X139.669 Y142.728 E.32384
G1 X139.012 Y142.851
G1 X131.571 Y150.292 E.32335
G1 X130.943 Y150.387
G1 X138.525 Y142.805 E.32949
G1 X138.12 Y142.676
G1 X130.343 Y150.454 E.33797
G1 X129.75 Y150.513
G1 X137.775 Y142.488 E.34872
G1 X137.48 Y142.25
G1 X129.185 Y150.544 E.36043
G1 X128.624 Y150.572
G1 X137.235 Y141.962 E.37418
G1 X137.039 Y141.624
G1 X128.088 Y150.575 E.38898
G1 X127.555 Y150.575
G1 X136.902 Y141.229 E.40617
G1 X136.842 Y140.755
G1 X127.041 Y150.556 E.42588
G1 X126.533 Y150.53
G1 X136.928 Y140.136 E.4517
; WIPE_START
M204 S6000
G1 X135.514 Y141.55 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.95 Y141.446 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X150.18 Y132.216 E.40109
G1 X150.295 Y131.568
G1 X141.074 Y140.789 E.40069
G1 X141.031 Y140.299
G1 X150.383 Y130.947 E.4064
G1 X150.459 Y130.337
G1 X140.902 Y139.894 E.41531
G1 X140.714 Y139.55
G1 X150.507 Y129.756 E.42558
G1 X150.55 Y129.18
G1 X140.473 Y139.257 E.4379
G1 X140.186 Y139.011
G1 X150.567 Y128.63 E.45111
G1 X150.58 Y128.083
G1 X139.848 Y138.815 E.46635
G1 X139.453 Y138.677
G1 X150.571 Y127.559 E.48315
G1 X150.558 Y127.038
G1 X138.978 Y138.618 E.50321
G1 X138.358 Y138.705
G1 X150.529 Y126.535 E.52888
G1 X150.492 Y126.039
G1 X147.225 Y129.305 E.14196
G1 X146.987 Y129.544
G1 X126.038 Y150.492 E.9103
G1 X125.554 Y150.443
G1 X150.445 Y125.552 E1.08166
G1 X150.386 Y125.078
G1 X125.074 Y150.389 E1.09991
G1 X124.611 Y150.32
G1 X150.325 Y124.605 E1.11741
G1 X150.245 Y124.152
G1 X124.148 Y150.25 E1.13407
G1 X123.701 Y150.163
G1 X150.165 Y123.699 E1.15
G1 X150.074 Y123.257
G1 X123.257 Y150.073 E1.16529
G1 X122.821 Y149.977
G1 X149.974 Y122.823 E1.17997
G1 X149.874 Y122.391
G1 X122.396 Y149.869 E1.19406
G1 X121.97 Y149.761
G1 X149.757 Y121.974 E1.20744
G1 X149.64 Y121.558
G1 X121.559 Y149.638 E1.22022
G1 X121.152 Y149.513
G1 X149.514 Y121.15 E1.23248
G1 X149.38 Y120.751
G1 X120.747 Y149.384 E1.24425
G1 X120.356 Y149.242
G1 X149.246 Y120.352 E1.25541
G1 X149.099 Y119.966
G1 X119.965 Y149.1 E1.26601
G1 X119.581 Y148.95
G1 X148.948 Y119.583 E1.27615
G1 X148.797 Y119.201
G1 X119.206 Y148.792 E1.28588
G1 X118.831 Y148.634
G1 X137.77 Y129.695 E.82301
G1 X137.67 Y129.261
G1 X118.466 Y148.466 E.83452
G1 X118.106 Y148.292
G1 X137.498 Y128.9 E.84267
G1 X137.827 Y128.038
G1 X117.746 Y148.119 E.87261
G1 X117.399 Y147.933
G1 X131.923 Y133.409 E.63114
G1 X131.427 Y133.372
G1 X117.054 Y147.745 E.62459
G1 X116.709 Y147.557
G1 X130.931 Y133.334 E.61804
M73 P56 R12
G1 X130.435 Y133.297
G1 X116.378 Y147.355 E.61086
G1 X116.047 Y147.152
G1 X130.343 Y132.856 E.62126
; WIPE_START
M204 S6000
G1 X128.929 Y134.27 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.65 Y130.652 Z2.8 F42000
G1 X138.169 Y129.296 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X148.631 Y118.834 E.45465
G1 X148.465 Y118.466
G1 X138.276 Y128.655 E.44277
G1 X138.236 Y128.163
G1 X148.295 Y118.103 E.43714
G1 X148.115 Y117.75
G1 X138.115 Y127.75 E.43453
; WIPE_START
M204 S6000
G1 X139.529 Y126.336 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.932 Y131.524 Z2.8 F42000
G1 X132.231 Y133.101 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X147.934 Y117.398 E.68236
G1 X147.747 Y117.052
G1 X131.988 Y132.811 E.68481
G1 X131.492 Y132.774
G1 X147.552 Y116.714 E.69789
G1 X147.357 Y116.376
G1 X145.924 Y117.808 E.06224
G1 X145.88 Y117.852
G1 X130.996 Y132.737 E.64679
G1 X130.499 Y132.7
G1 X133.816 Y129.383 E.14411
G1 X133.706 Y128.959
G1 X115.717 Y146.949 E.78173
G1 X115.4 Y146.733
G1 X133.683 Y128.45 E.79449
G1 X133.834 Y127.765
G1 X115.083 Y146.516 E.81485
; WIPE_START
M204 S6000
G1 X116.497 Y145.102 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.143 Y139.966 Z2.8 F42000
G1 X134.215 Y128.984 Z2.8
G1 Z2.4
G1 E.8 F1800
M73 P57 R12
G1 F3000
M204 S2000
G1 X147.154 Y116.045 E.56224
G1 X146.944 Y115.721
G1 X134.424 Y128.241 E.54406
G1 X134.262 Y127.871
G1 X146.735 Y115.397 E.54203
G1 X146.517 Y115.082
G1 X134.18 Y127.419 E.53612
; WIPE_START
M204 S6000
G1 X135.594 Y126.005 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.858 Y120.479 Z2.8 F42000
G1 X146.294 Y114.772 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X114.768 Y146.298 E1.36996
G1 X114.465 Y146.068
G1 X141.532 Y119.001 E1.1762
G1 X140.845 Y119.154
G1 X114.161 Y145.838 E1.15954
G1 X113.86 Y145.606
G1 X115.256 Y144.21 E.06066
G1 X115.301 Y144.165
G1 X140.344 Y119.122 E1.08824
G1 X139.932 Y119.001
G1 X113.57 Y145.362 E1.14555
G1 X113.281 Y145.119
G1 X139.581 Y118.818 E1.1429
G1 X139.284 Y118.583
G1 X112.994 Y144.873 E1.14242
G1 X112.717 Y144.616
G1 X139.033 Y118.3 E1.14357
G1 X138.832 Y117.968
G1 X117.315 Y139.485 E.93503
G1 X117.38 Y138.886
G1 X132.446 Y123.821 E.65465
G1 X131.949 Y123.784
G1 X117.312 Y138.421 E.63607
G1 X117.168 Y138.032
G1 X131.453 Y123.747 E.62078
G1 X131.034 Y123.632
G1 X116.967 Y137.7 E.61131
; WIPE_START
M204 S6000
G1 X118.381 Y136.286 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.791 Y141.009 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X112.44 Y144.359 E.14559
G1 X112.167 Y144.099
G1 X115.194 Y141.073 E.13153
G1 X114.728 Y141.005
G1 X111.904 Y143.829 E.12272
G1 X111.641 Y143.56
G1 X114.339 Y140.861 E.11727
G1 X114.008 Y140.659
G1 X111.381 Y143.286 E.11416
G1 X111.131 Y143.003
G1 X113.726 Y140.408 E.11276
G1 X113.491 Y140.11
G1 X110.881 Y142.72 E.11341
G1 X110.634 Y142.433
G1 X113.307 Y139.76 E.11613
G1 X113.186 Y139.348
G1 X110.398 Y142.136 E.12114
G1 X110.161 Y141.839
G1 X113.154 Y138.847 E.13004
G1 X113.305 Y138.162
G1 X109.929 Y141.538 E.1467
; WIPE_START
M204 S6000
G1 X111.343 Y140.124 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.564 Y135.702 Z2.8 F42000
G1 X142.695 Y117.837 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X146.071 Y114.462 E.14669
G1 X145.839 Y114.161
G1 X142.846 Y117.153 E.13003
G1 X142.814 Y116.652
G1 X145.602 Y113.864 E.12114
G1 X145.365 Y113.567
G1 X142.693 Y116.24 E.11613
G1 X142.509 Y115.89
G1 X145.119 Y113.28 E.11341
G1 X144.869 Y112.997
G1 X142.274 Y115.592 E.11276
G1 X141.992 Y115.341
G1 X144.619 Y112.714 E.11416
G1 X144.359 Y112.44
G1 X141.661 Y115.139 E.11727
G1 X141.272 Y114.995
G1 X144.096 Y112.17 E.12273
G1 X143.833 Y111.901
G1 X140.806 Y114.927 E.13153
G1 X140.209 Y114.991
G1 X143.559 Y111.641 E.14559
; WIPE_START
M204 S6000
M73 P58 R12
G1 X142.145 Y113.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.688 Y117.579 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X132.965 Y123.301 E.24867
G1 X132.51 Y123.223
G1 X138.62 Y117.114 E.26549
G1 X138.685 Y116.515
G1 X132.014 Y123.186 E.2899
G1 X131.518 Y123.149
G1 X143.283 Y111.384 E.51124
G1 X143.006 Y111.127
G1 X116.716 Y137.417 E1.14242
G1 X116.418 Y137.182
G1 X142.719 Y110.881 E1.1429
G1 X142.429 Y110.638
G1 X116.068 Y136.999 E1.14555
G1 X115.656 Y136.878
G1 X140.699 Y111.835 E1.08824
G1 X140.743 Y111.79
G1 X142.139 Y110.394 E.06066
G1 X141.839 Y110.162
G1 X115.155 Y136.846 E1.15955
G1 X114.468 Y136.999
G1 X141.535 Y109.932 E1.1762
G1 X141.232 Y109.702
G1 X109.706 Y141.228 E1.36996
G1 X109.483 Y140.918
G1 X140.917 Y109.484 E1.36597
G1 X140.6 Y109.267
G1 X109.265 Y140.603 E1.36167
G1 X109.056 Y140.279
G1 X140.283 Y109.051 E1.35698
G1 X139.953 Y108.848
G1 X108.846 Y139.955 E1.35175
G1 X108.643 Y139.624
G1 X139.622 Y108.645 E1.34619
G1 X139.291 Y108.443
G1 X108.448 Y139.286 E1.34028
G1 X108.253 Y138.948
G1 X138.946 Y108.255 E1.33376
G1 X138.601 Y108.067
G1 X108.066 Y138.602 E1.32689
G1 X107.885 Y138.249
G1 X138.254 Y107.881 E1.31966
G1 X137.894 Y107.708
G1 X107.704 Y137.897 E1.31187
G1 X107.535 Y137.534
G1 X137.534 Y107.534 E1.30361
G1 X137.169 Y107.366
G1 X107.369 Y137.166 E1.29497
G1 X107.203 Y136.799
G1 X136.794 Y107.208 E1.28587
G1 X136.419 Y107.05
G1 X107.051 Y136.417 E1.27615
G1 X106.901 Y136.034
G1 X136.035 Y106.9 E1.266
G1 X135.644 Y106.758
G1 X106.754 Y135.648 E1.25541
G1 X106.62 Y135.249
G1 X135.253 Y106.616 E1.24425
G1 X134.848 Y106.487
G1 X106.486 Y134.85 E1.23248
G1 X106.36 Y134.442
G1 X134.441 Y106.362 E1.22022
G1 X134.029 Y106.239
G1 X106.243 Y134.026 E1.20744
G1 X106.126 Y133.609
G1 X133.604 Y106.131 E1.19406
G1 X133.179 Y106.023
G1 X106.026 Y133.177 E1.17996
G1 X105.926 Y132.743
G1 X132.742 Y105.927 E1.16529
M73 P58 R11
G1 X132.299 Y105.837
G1 X105.835 Y132.301 E1.15
G1 X105.755 Y131.848
G1 X131.852 Y105.75 E1.13407
G1 X131.389 Y105.68
G1 X105.675 Y131.394 E1.1174
G1 X105.614 Y130.922
G1 X130.926 Y105.61 E1.0999
G1 X130.446 Y105.557
G1 X105.555 Y130.448 E1.08165
G1 X105.508 Y129.961
G1 X129.961 Y105.508 E1.06261
G1 X129.467 Y105.47
G1 X119.072 Y115.864 E.4517
G1 X119.158 Y115.245
G1 X128.959 Y105.444 E.42587
G1 X128.445 Y105.425
G1 X119.098 Y114.771 E.40617
M73 P59 R11
G1 X118.961 Y114.376
G1 X127.912 Y105.425 E.38898
G1 X127.376 Y105.428
G1 X118.765 Y114.038 E.37417
G1 X118.52 Y113.75
G1 X126.814 Y105.456 E.36042
G1 X126.25 Y105.487
G1 X118.225 Y113.512 E.34872
G1 X117.88 Y113.324
G1 X125.657 Y105.546 E.33797
G1 X125.057 Y105.613
G1 X117.475 Y113.195 E.32948
G1 X116.988 Y113.149
G1 X124.429 Y105.708 E.32335
G1 X123.783 Y105.82
G1 X116.331 Y113.273 E.32384
; WIPE_START
M204 S6000
G1 X117.745 Y111.858 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.642 Y117.295 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X105.471 Y129.465 E.52887
G1 X105.441 Y128.962
G1 X117.021 Y117.382 E.50321
G1 X116.547 Y117.323
G1 X105.428 Y128.441 E.48315
G1 X105.42 Y127.917
G1 X116.151 Y117.185 E.46635
G1 X115.814 Y116.989
G1 X105.433 Y127.37 E.45111
G1 X105.45 Y126.82
G1 X115.527 Y116.743 E.43789
G1 X115.286 Y116.45
G1 X105.493 Y126.244 E.42557
G1 X105.541 Y125.663
G1 X115.098 Y116.105 E.4153
G1 X114.969 Y115.701
G1 X105.617 Y125.053 E.4064
G1 X105.706 Y124.431
G1 X114.926 Y115.211 E.40069
G1 X115.05 Y114.554
G1 X105.82 Y123.784 E.40109
G1 X105.96 Y123.11
M73 P60 R11
G1 X123.115 Y105.955 E.74547
G1 X122.409 Y106.128
G1 X106.118 Y122.419 E.70793
G1 X106.327 Y121.677
G1 X121.679 Y106.325 E.66713
G1 X120.908 Y106.563
G1 X106.569 Y120.901 E.62308
G1 X106.856 Y120.082
G1 X120.079 Y106.859 E.57459
G1 X119.189 Y107.215
G1 X107.203 Y119.201 E.52087
G1 X107.641 Y118.229
G1 X118.216 Y107.655 E.45952
G1 X117.117 Y108.221
G1 X108.208 Y117.129 E.38712
; WIPE_START
M204 S6000
G1 X109.622 Y115.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.006 Y115.799 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X115.815 Y108.989 E.29592
; WIPE_START
M204 S6000
G1 X114.401 Y110.403 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.869 Y116.591 Z2.8 F42000
G1 X130.506 Y132.706 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.161991
G1 F15000
M204 S6000
G1 X130.366 Y132.65 E.00146
G2 X130.275 Y132.787 I.147 J.196 E.00163
; WIPE_START
G1 X130.313 Y132.705 E-.21827
G1 X130.366 Y132.65 E-.18168
G1 X130.506 Y132.706 E-.36005
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.511 Y129.675 Z2.8 F42000
G1 X138.235 Y129.362 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.157423
G1 F15000
M204 S6000
G3 X138.069 Y129.606 I-12.929 J-8.616 E.00275
; LINE_WIDTH: 0.105692
G1 X137.989 Y129.715 E.00069
; WIPE_START
G1 X138.069 Y129.606 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.257 Y129.025 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0994946
G1 F15000
M204 S6000
G1 X134.046 Y129.396 E.00197
M204 S10000
G1 X134.277 Y129.045 F42000
; LINE_WIDTH: 0.207455
G1 F15000
M204 S6000
G1 X134.032 Y129.382 E.00557
; WIPE_START
G1 X134.277 Y129.045 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.066 Y127.305 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.123674
G1 F15000
M204 S6000
G1 X133.926 Y127.482 E.00148
; LINE_WIDTH: 0.168795
G1 X133.857 Y127.578 E.00122
; LINE_WIDTH: 0.198921
G1 X133.771 Y127.702 E.00191
; WIPE_START
G1 X133.857 Y127.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.429 Y123.462 Z2.8 F42000
G1 X117.865 Y117.338 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.147623
G1 F15000
M204 S6000
G1 X117.63 Y117.283 E.00206
M204 S10000
G1 X118.044 Y117.131 F42000
; LINE_WIDTH: 0.124568
G1 F15000
M204 S6000
G1 X118.013 Y117.154 E.00026
G3 X117.71 Y117.363 I-6.599 J-9.235 E.00245
M204 S10000
G1 X117.218 Y117.451 F42000
; LINE_WIDTH: 0.117885
G1 F15000
M204 S6000
G1 X117.007 Y117.367 E.00139
; WIPE_START
G1 X117.218 Y117.451 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.287 Y114.078 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.110201
G1 F15000
M204 S6000
G1 X115.158 Y114.243 E.00115
; LINE_WIDTH: 0.150328
G1 X115.096 Y114.329 E.00093
; LINE_WIDTH: 0.196827
G1 X115.032 Y114.421 E.0014
G1 X115.063 Y114.567 E.00188
; WIPE_START
G1 X115.032 Y114.421 E-.43503
G1 X115.096 Y114.329 E-.32497
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.266 Y113.208 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.184639
G1 F15000
M204 S6000
G1 X116.146 Y113.29 E.00168
; LINE_WIDTH: 0.16692
G1 X116.061 Y113.353 E.00107
; LINE_WIDTH: 0.13348
G1 X115.972 Y113.417 E.00081
; LINE_WIDTH: 0.102408
G1 X115.85 Y113.516 E.00076
; WIPE_START
G1 X115.972 Y113.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.917 Y113.078 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.116689
G1 F15000
M204 S6000
G1 X116.713 Y113.178 E.00136
; WIPE_START
G1 X116.917 Y113.078 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.185 Y114.951 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100957
G1 F15000
M204 S6000
G2 X119.103 Y114.8 I-2.883 J1.471 E.00081
; WIPE_START
G1 X119.185 Y114.951 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.139 Y115.932 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.149807
G1 F15000
M204 S6000
G1 X119.023 Y116.104 E.00181
; LINE_WIDTH: 0.133612
G1 X118.965 Y116.187 E.00075
; LINE_WIDTH: 0.103315
G1 X118.906 Y116.27 E.0005
; WIPE_START
G1 X118.965 Y116.187 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.947 Y109.698 Z2.8 F42000
G1 X114.895 Y109.614 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0946787
G1 F15000
M204 S6000
G1 X114.824 Y109.673 E.00039
; LINE_WIDTH: 0.120476
G1 X114.611 Y109.858 E.00178
; LINE_WIDTH: 0.159055
G1 X114.399 Y110.043 E.00266
; LINE_WIDTH: 0.197635
G1 X114.187 Y110.228 E.00355
; LINE_WIDTH: 0.236214
G1 X113.975 Y110.413 E.00443
; LINE_WIDTH: 0.279963
G1 X113.561 Y110.792 E.01083
; LINE_WIDTH: 0.32888
G1 F12589.199
G1 X113.148 Y111.17 E.01307
; LINE_WIDTH: 0.381219
G1 F10641.493
G2 X111.556 Y112.743 I30.752 J32.73 E.06169
; LINE_WIDTH: 0.363778
G1 F11219.917
G1 X111.173 Y113.15 E.01463
; LINE_WIDTH: 0.328906
G1 F12588.032
G1 X110.789 Y113.558 E.01304
; LINE_WIDTH: 0.290456
G1 F14543.355
G1 X110.54 Y113.838 E.00756
; LINE_WIDTH: 0.248437
G1 F15000
G1 X110.29 Y114.117 E.00627
; LINE_WIDTH: 0.206419
G1 X110.04 Y114.396 E.00499
; LINE_WIDTH: 0.161106
G1 X109.839 Y114.634 E.003
; LINE_WIDTH: 0.112485
G1 X109.637 Y114.871 E.00177
; WIPE_START
G1 X109.839 Y114.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.474 Y109.486 Z2.8 F42000
G1 X116.425 Y108.618 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.111135
G1 F15000
M204 S6000
G1 X116.242 Y108.762 E.00129
; LINE_WIDTH: 0.157083
G1 X116.059 Y108.906 E.00216
; LINE_WIDTH: 0.203031
G1 X115.876 Y109.05 E.00304
; WIPE_START
G1 X116.059 Y108.906 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.679 Y107.432 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109462
G1 F15000
M204 S6000
G1 X118.545 Y107.527 E.00089
; LINE_WIDTH: 0.152035
G1 X118.411 Y107.622 E.00146
; LINE_WIDTH: 0.194609
G1 X118.278 Y107.716 E.00203
; WIPE_START
G1 X118.411 Y107.622 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.979 Y106.628 Z2.8 F42000
G1 X132.037 Y105.832 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0968043
G1 F15000
M204 S6000
G1 X131.874 Y105.75 E.0008
; WIPE_START
G1 X132.037 Y105.832 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.116 Y111.529 Z2.8 F42000
G1 X140.14 Y114.922 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.123646
G1 F15000
M204 S6000
G2 X139.831 Y115.129 I4.15 J6.534 E.00244
M204 S10000
G1 X140.223 Y115.005 F42000
; LINE_WIDTH: 0.118365
G1 F15000
M204 S6000
G1 X139.989 Y114.945 E.00148
; WIPE_START
G1 X140.223 Y115.005 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X142.758 Y117.9 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.191725
G1 F15000
M204 S6000
G1 X142.631 Y118.078 E.00265
; LINE_WIDTH: 0.144543
G1 X142.501 Y118.244 E.00175
; LINE_WIDTH: 0.100833
G1 X142.311 Y118.457 E.00135
M204 S10000
G1 X142.158 Y118.61 F42000
; LINE_WIDTH: 0.104567
G1 F15000
M204 S6000
G1 X141.895 Y118.843 E.00177
; LINE_WIDTH: 0.143868
G1 X141.813 Y118.906 E.00085
; LINE_WIDTH: 0.171616
G1 X141.726 Y118.972 E.00114
; LINE_WIDTH: 0.198753
G1 X141.595 Y119.064 E.00203
; WIPE_START
G1 X141.726 Y118.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.82 Y116.14 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107971
G1 F15000
M204 S6000
G2 X138.614 Y116.443 I5.907 J4.246 E.00195
; WIPE_START
G1 X138.82 Y116.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.078 Y120.509 Z2.8 F42000
G1 X150.129 Y124.036 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0904503
G1 F15000
M204 S6000
G1 X150.227 Y123.938 E.00054
; WIPE_START
G1 X150.129 Y124.036 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X149.233 Y131.615 Z2.8 F42000
G1 X148.557 Y137.332 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.109036
G1 F15000
M204 S6000
G1 X148.47 Y137.457 E.00082
; LINE_WIDTH: 0.150772
G1 X148.383 Y137.583 E.00134
; LINE_WIDTH: 0.192508
G1 X148.297 Y137.708 E.00186
; WIPE_START
G1 X148.383 Y137.583 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.387 Y139.57 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102242
G1 F15000
M204 S6000
G1 X147.315 Y139.664 E.00058
; LINE_WIDTH: 0.130397
G1 X147.242 Y139.759 E.00085
; LINE_WIDTH: 0.165509
G1 X147.088 Y139.95 E.00245
; LINE_WIDTH: 0.207536
G1 X146.934 Y140.14 E.00329
; WIPE_START
G1 X147.088 Y139.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.363 Y141.128 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.11251
G1 F15000
M204 S6000
G1 X146.161 Y141.366 E.00177
; LINE_WIDTH: 0.16118
G1 X145.959 Y141.604 E.00301
; LINE_WIDTH: 0.206516
G1 X145.71 Y141.883 E.00499
; LINE_WIDTH: 0.24853
G1 X145.46 Y142.162 E.00628
; LINE_WIDTH: 0.290543
G1 F14538.224
G1 X145.211 Y142.442 E.00756
; LINE_WIDTH: 0.328985
G1 F12584.587
G1 X144.827 Y142.85 E.01305
; LINE_WIDTH: 0.377825
G1 F10749.34
G3 X142.852 Y144.83 I-35.013 J-32.95 E.07633
; LINE_WIDTH: 0.328968
G1 F12585.321
G1 X142.439 Y145.208 E.01307
; LINE_WIDTH: 0.280059
G1 F15000
G1 X142.025 Y145.587 E.01084
; LINE_WIDTH: 0.236298
G1 X141.813 Y145.772 E.00444
; LINE_WIDTH: 0.197719
G1 X141.601 Y145.957 E.00355
; LINE_WIDTH: 0.15914
G1 X141.389 Y146.142 E.00267
; LINE_WIDTH: 0.12056
G1 X141.176 Y146.327 E.00178
; LINE_WIDTH: 0.0947287
G1 X141.105 Y146.386 E.00039
; WIPE_START
G1 X141.176 Y146.327 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.494 Y139.181 Z2.8 F42000
G1 X138.29 Y138.637 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.124608
G1 F15000
M204 S6000
G2 X137.955 Y138.87 I3.575 J5.51 E.00271
M204 S10000
G1 X138.37 Y138.717 F42000
; LINE_WIDTH: 0.147544
G1 F15000
M204 S6000
G1 X138.135 Y138.662 E.00206
; WIPE_START
G1 X138.37 Y138.717 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.937 Y141.433 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.204485
G1 F15000
M204 S6000
G1 X140.965 Y141.584 E.00203
; LINE_WIDTH: 0.185727
G1 X140.904 Y141.671 E.00123
; LINE_WIDTH: 0.149461
G1 X140.84 Y141.761 E.00096
; LINE_WIDTH: 0.109669
G1 X140.713 Y141.921 E.00111
M204 S10000
G1 X140.15 Y142.484 F42000
; LINE_WIDTH: 0.10269
G1 F15000
M204 S6000
G1 X140.025 Y142.585 E.00078
; LINE_WIDTH: 0.133961
G1 X139.939 Y142.647 E.00079
; LINE_WIDTH: 0.177114
G3 X139.734 Y142.793 I-3.063 J-4.115 E.00275
; WIPE_START
G1 X139.939 Y142.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.706 Y142.89 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0979725
G1 F15000
M204 S6000
G3 X138.552 Y142.808 I1.484 J-3.004 E.00078
; WIPE_START
G1 X138.706 Y142.89 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.859 Y140.494 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0937056
G1 F15000
M204 S6000
G2 X136.769 Y140.682 I3.813 J1.939 E.00087
; WIPE_START
G1 X136.859 Y140.494 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.095 Y139.729 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.103354
G1 F15000
M204 S6000
G1 X137.035 Y139.812 E.0005
; LINE_WIDTH: 0.14462
G2 X136.861 Y140.068 I4.933 J3.563 E.00257
; WIPE_START
G1 X137.035 Y139.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.066 Y146.818 Z2.8 F42000
G1 X140.123 Y146.951 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.20303
G1 F15000
M204 S6000
G1 X139.94 Y147.094 E.00304
; LINE_WIDTH: 0.157082
G1 X139.758 Y147.238 E.00216
; LINE_WIDTH: 0.111135
G1 X139.575 Y147.382 E.00129
M204 S10000
G1 X138.822 Y147.718 F42000
; LINE_WIDTH: 0.198827
G1 F15000
M204 S6000
G1 X138.667 Y147.833 E.00244
; LINE_WIDTH: 0.154561
G1 X138.513 Y147.949 E.00175
; LINE_WIDTH: 0.110295
G1 X138.359 Y148.064 E.00106
; WIPE_START
G1 X138.513 Y147.949 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.748 Y148.723 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.190407
G1 F15000
M204 S6000
G1 X136.63 Y148.803 E.00171
; LINE_WIDTH: 0.149514
G1 X136.512 Y148.882 E.00124
; LINE_WIDTH: 0.108622
G1 X136.393 Y148.962 E.00076
; WIPE_START
G1 X136.512 Y148.882 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.893 Y149.339 Z2.8 F42000
G1 X121.942 Y149.756 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.09867
G1 F15000
M204 S6000
G1 X121.793 Y149.671 E.00078
; WIPE_START
G1 X121.942 Y149.756 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.643 Y143.449 Z2.8 F42000
G1 X116.011 Y141.055 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.118382
G1 F15000
M204 S6000
G1 X115.777 Y140.996 E.00148
M204 S10000
G1 X116.168 Y140.872 F42000
; LINE_WIDTH: 0.123562
G1 F15000
M204 S6000
G3 X115.86 Y141.078 I-4.453 J-6.319 E.00244
; WIPE_START
G1 X116.168 Y140.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.539 Y140.928 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.102101
G1 F15000
M204 S6000
G1 X114.472 Y140.941 E.00033
G1 X114.386 Y140.882 E.0005
; WIPE_START
G1 X114.472 Y140.941 E-.46135
G1 X114.539 Y140.928 E-.29865
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.443 Y140.034 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0958882
G1 F15000
M204 S6000
G1 X113.398 Y139.976 E.00032
G1 X113.405 Y139.929 E.00021
; WIPE_START
G1 X113.398 Y139.976 E-.30186
G1 X113.443 Y140.034 E-.45814
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.691 Y137.541 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.100768
G1 F15000
M204 S6000
G1 X113.499 Y137.756 E.00136
; LINE_WIDTH: 0.144563
G1 X113.369 Y137.922 E.00175
; LINE_WIDTH: 0.191733
G1 X113.242 Y138.1 E.00265
; WIPE_START
G1 X113.369 Y137.922 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X114.405 Y136.936 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.198322
G1 F15000
M204 S6000
G1 X114.269 Y137.031 E.0021
; LINE_WIDTH: 0.170932
G1 X114.187 Y137.094 E.00108
; LINE_WIDTH: 0.143387
G1 X114.102 Y137.16 E.00088
; LINE_WIDTH: 0.104278
G1 X113.841 Y137.391 E.00174
; WIPE_START
G1 X114.102 Y137.16 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.386 Y139.556 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.107862
G1 F15000
M204 S6000
G3 X117.18 Y139.86 I-5.97 J-3.84 E.00194
; WIPE_START
G1 X117.386 Y139.556 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.193 Y137.005 Z2.8 F42000
G1 X106.849 Y135.82 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.0931765
G1 F15000
M204 S6000
G1 X106.764 Y135.683 E.00066
; WIPE_START
G1 X106.849 Y135.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.396 Y128.207 Z2.8 F42000
G1 X108.192 Y117.119 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.198053
G1 F15000
M204 S6000
G1 X108.215 Y117.263 E.00183
; LINE_WIDTH: 0.199731
G1 X108.126 Y117.385 E.00193
; LINE_WIDTH: 0.155108
G1 X108.037 Y117.507 E.00138
; LINE_WIDTH: 0.110485
G1 X107.948 Y117.629 E.00083
; WIPE_START
G1 X108.037 Y117.507 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.066 Y115.859 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.207496
G1 F15000
M204 S6000
G1 X108.912 Y116.05 E.00329
; LINE_WIDTH: 0.165418
G1 X108.758 Y116.241 E.00245
; LINE_WIDTH: 0.130312
G1 X108.685 Y116.336 E.00085
; LINE_WIDTH: 0.102213
G1 X108.613 Y116.43 E.00057
; WIPE_START
G1 X108.685 Y116.336 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.963 Y118.637 Z2.8 F42000
G1 X131.077 Y123.417 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.59098
G1 F6568.629
M204 S6000
G1 X132.92 Y123.555 E.08253
; WIPE_START
G1 X131.077 Y123.417 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.599 Y127.382 Z2.8 F42000
G1 X138.045 Y127.653 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.377208
G1 F10769.168
M204 S6000
G1 X138.018 Y128.083 E.01174
G1 X137.986 Y128.099 E.00099
; LINE_WIDTH: 0.319315
G1 F13024.836
G1 X137.789 Y128.196 E.00494
M204 S10000
G1 X138.061 Y128.269 F42000
; LINE_WIDTH: 0.151983
G1 F15000
M204 S6000
G2 X137.999 Y127.594 I-13.557 J.895 E.00603
M204 S10000
G1 X137.996 Y127.594 F42000
; LINE_WIDTH: 0.0977422
G1 F15000
M204 S6000
G1 X138.108 Y128.281 E.00311
M204 S10000
G1 X134.163 Y129.009 F42000
; LINE_WIDTH: 0.292056
G1 F14449.953
M204 S6000
G1 X133.984 Y129.093 E.00402
; LINE_WIDTH: 0.323587
G1 F12826.626
G1 X133.96 Y129.105 E.0006
; LINE_WIDTH: 0.376804
G1 F10782.197
G1 X133.936 Y129.117 E.00072
G1 X133.936 Y129.598 E.01308
M204 S10000
G1 X133.957 Y129.602 F42000
; LINE_WIDTH: 0.15171
G1 F15000
M204 S6000
G3 X133.892 Y128.93 I12.911 J-1.573 E.00599
; WIPE_START
G1 X133.957 Y129.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.203 Y133.128 Z2.8 F42000
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.590993
G1 F6568.475
M204 S6000
G1 X130.36 Y132.99 E.08254
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6568.475
G1 X132.203 Y133.128 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/76
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z2.8 I-.607 J-1.055 P1  F42000
G1 X124.045 Y137.822 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01536
G1 X120.395 Y138.05 E.11131
G2 X119.872 Y136.526 I-5.382 J.995 E.04967
G1 X126.362 Y137.013 E.19996
G1 X126.289 Y137.99 E.03011
G1 X124.105 Y137.826 E.06729
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.19137
G1 X122.515 Y138.209 E-.56863
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


G1 X125.707 Y137.172 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
M73 P61 R11
G1 F3000
M204 S2000
G1 X126.112 Y137.577 E.0176
G1 X125.743 Y137.741
G1 X125.13 Y137.128 E.02662
G1 X124.554 Y137.085
G1 X125.166 Y137.698 E.02662
G1 X124.59 Y137.655
G1 X123.977 Y137.042 E.02663
G1 X123.401 Y136.999
G1 X124.013 Y137.612 E.02663
G1 X123.827 Y137.958
G1 X122.824 Y136.956 E.04356
G1 X122.248 Y136.912
G1 X123.403 Y138.067 E.05018
G1 X122.826 Y138.024
G1 X121.671 Y136.869 E.05018
G1 X121.095 Y136.826
G1 X122.25 Y137.981 E.05018
G1 X121.673 Y137.938
G1 X120.518 Y136.783 E.05018
G1 X120.382 Y137.179
G1 X121.097 Y137.894 E.03107
M204 S10000
G1 X120.668 Y137.881 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.125826
G1 F15000
M204 S6000
G1 X120.506 Y137.592 E.00224
; WIPE_START
G1 X120.668 Y137.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.999 Y144.574 Z3 F42000
G1 X116.951 Y144.662 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01502
G2 X117.284 Y144.183 I-1.656 J-6.411 E.02468
G1 X117.391 Y144.356 E.00675
G1 X117.01 Y144.701 E.01706
G1 X117.001 Y144.695 E.00035
M204 S250
G1 X117.794 Y144.52 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46505
G2 X136.62 Y145.388 I-4.594 J-19.538 E.13933
G2 X137.77 Y145.806 I2.564 J-5.274 E.03766
G1 X137.821 Y145.863 E.00237
G3 X115.626 Y144.2 I-9.821 J-17.871 E.72343
G1 X115.685 Y144.15 E.00237
G2 X118.33 Y143.172 I-.466 J-5.324 E.08768
G1 X118.353 Y143.232 E.00198
G3 X118.09 Y144.253 I-.974 J.293 E.03402
G1 X117.838 Y144.48 E.01042
M204 S10000
G1 X117.605 Y144.329 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261037
G1 F15000
M204 S6000
G1 X118.08 Y143.695 E.01407
; LINE_WIDTH: 0.230599
G1 X118.203 Y143.522 E.00325
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.418746
G1 F9578.908
M204 S6000
G1 X117.892 Y143.898 E.01222
G3 X117.808 Y143.963 I-.709 J-.834 E.00328
; LINE_WIDTH: 0.470119
G1 F8426.991
G1 X117.693 Y144.041 E.00482
G1 X117.367 Y143.945 E.01184
M204 S10000
G1 X117.241 Y144.757 F42000
; LINE_WIDTH: 0.629995
G1 F6132.095
M204 S6000
G1 X118.147 Y145.286 E.0502
G2 X136.07 Y146.19 I9.857 J-17.296 E.89062
G1 X136.975 Y145.762 E.04792
; WIPE_START
G1 X136.07 Y146.19 E-.38065
G1 X135.168 Y146.564 E-.37112
G1 X135.147 Y146.571 E-.00824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.046 Y143.774 Z3 F42000
G1 X110.499 Y136.862 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X110.503 Y136.807 E.00169
G1 X109.256 Y136.714 E.03841
G1 X109.33 Y135.736 E.03011
G1 X110.686 Y135.838 E.04179
G1 X111.074 Y135.867 E.01194
G2 X110.524 Y136.808 I5.158 J3.644 E.03351
M204 S10000
G1 X110.142 Y136.005 F42000
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X110.508 Y136.371 E.0159
G1 X110.178 Y136.575
G1 X109.566 Y135.962 E.02663
; WIPE_START
M204 S6000
G1 X110.178 Y136.575 E-.37174
G1 X110.508 Y136.371 E-.16623
G1 X110.142 Y136.005 E-.22202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.877 Y128.408 Z3 F42000
G1 X112.015 Y116.631 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S5000
G2 X112.435 Y117.698 I6.16 J-1.81 E.03528
G1 X110.691 Y117.567 E.05374
G1 X110.764 Y116.59 E.03011
G1 X112.004 Y116.683 E.03818
M204 S10000
G1 X111.234 Y116.833 F42000
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X111.847 Y117.446 E.02662
M204 S10000
G1 X112.084 Y117.428 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.246923
G1 F15000
M204 S6000
G1 X111.725 Y116.851 E.01131
M204 S10000
G1 X111.248 Y116.815 F42000
; LINE_WIDTH: 0.245001
G1 F15000
M204 S6000
G1 X111.03 Y116.898 E.00385
G1 X111.016 Y117.403 E.00831
; WIPE_START
G1 X111.03 Y116.898 E-.51955
G1 X111.248 Y116.815 E-.24045
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.105 Y111.922 Z3 F42000
G1 X119.543 Y109.885 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.622 Y109.848 E.00289
G1 X119.947 Y110.245 E.01705
G1 X119.815 Y110.4 E.00675
G2 X119.149 Y110.072 I-3.248 J5.74 E.02467
G1 X119.488 Y109.911 E.01247
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.796 I-1.26 J1.289 E.02415
G3 X120.7 Y111.556 I-.964 J.264 E.02418
G2 X118.23 Y110.195 I-3.723 J3.832 E.0877
G1 X118.179 Y110.137 E.00237
G3 X127.584 Y107.616 I9.856 J17.964 E.30209
G3 X140.374 Y111.8 I.428 J20.332 E.42144
G1 X140.315 Y111.85 E.00237
G2 X139.115 Y112.091 I.55 J5.838 E.03766
G2 X121.501 Y109.71 I-11.123 J15.948 E.56721
G1 X120.426 Y110.122 E.03538
M204 S10000
G1 X120.148 Y110.311 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247654
G1 F15000
M204 S6000
G3 X120.627 Y111.18 I-47.599 J26.758 E.01655
M204 S10000
G1 X120.636 Y111.077 F42000
; LINE_WIDTH: 0.418807
G1 F9577.359
M204 S6000
G1 X120.375 Y110.774 E.01226
G2 X120.3 Y110.696 I-.838 J.73 E.0033
; LINE_WIDTH: 0.470668
G1 F8416.178
G1 X120.199 Y110.602 E.00482
G1 X119.862 Y110.648 E.01185
M204 S10000
G1 X119.858 Y109.827 F42000
; LINE_WIDTH: 0.629994
G1 F6132.105
M204 S6000
G1 X120.833 Y109.438 E.05022
G3 X139.522 Y111.774 I7.166 J18.599 E.93845
; WIPE_START
G1 X138.691 Y111.216 E-.38053
G1 X137.876 Y110.724 E-.36174
G1 X137.835 Y110.702 E-.01773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.203 Y114.48 Z3 F42000
G1 X125.553 Y117.698 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X127.797 Y117.866 E.06914
G1 X127.723 Y118.844 E.03011
G1 X121.232 Y118.357 E.20001
G2 X121.978 Y116.929 I-4.566 J-3.292 E.04968
G1 X125.59 Y117.2 E.11131
G1 X125.557 Y117.638 E.01352
; WIPE_START
M204 S6000
G1 X127.547 Y117.841 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.798 Y118 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X127.411 Y118.612 E.02662
G1 X126.835 Y118.569
G1 X126.222 Y117.956 E.02663
G1 X125.645 Y117.913
G1 X126.258 Y118.526 E.02663
G1 X125.682 Y118.483
G1 X124.527 Y117.328 E.05018
G1 X123.95 Y117.285
G1 X125.105 Y118.44 E.05018
G1 X124.529 Y118.396
G1 X123.374 Y117.242 E.05018
G1 X122.798 Y117.198
G1 X123.952 Y118.353 E.05018
G1 X123.376 Y118.31
G1 X122.221 Y117.155 E.05018
G1 X121.993 Y117.461
G1 X122.799 Y118.267 E.03503
G1 X122.223 Y118.224
G1 X121.819 Y117.819 E.01756
; WIPE_START
M204 S6000
G1 X122.223 Y118.224 E-.21718
G1 X122.799 Y118.267 E-.21967
G1 X122.198 Y117.665 E-.32315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.829 Y124.379 Z3 F42000
G1 X130.272 Y132.592 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z3 F42000
G1 X130.931 Y123.798 Z3
G1 Z2.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z3 F42000
G1 X130.512 Y131.808 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.29 Y121.437 E.03011
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.544 Y131.387 E.20887
G1 X130.517 Y131.749 E.01114
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F6123.098
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.949
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z3 F42000
G1 X132.116 Y133.122 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.417552
G1 F9609.427
M204 S6000
G1 X130.446 Y132.997 E.05112
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.272 Y127.272 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X134.281 Y127.481 E.00694
G2 X134.717 Y128.503 I1.908 J-.209 E.0374
G2 X134.074 Y129.751 I1.239 J1.429 E.0477
G1 X133.898 Y129.78 E.0059
G3 X134.098 Y127.118 I2.093 J-1.181 E.09386
G1 X134.272 Y127.182 E.00614
G1 X134.272 Y127.212 E.00101
M204 S10000
G1 X134.686 Y127.186 F42000
G1 F5400
M204 S6000
G1 X134.682 Y127.294 E.00358
G2 X135.42 Y128.556 I1.426 J.013 E.05091
G2 X135.029 Y131.011 I.488 J1.336 E.10031
G1 X134.911 Y131.188 E.00706
G3 X135.309 Y125.877 I1.073 J-2.59 E.23302
G1 X135.399 Y126.07 E.00706
G2 X134.726 Y126.958 I.709 J1.237 E.03797
G1 X134.696 Y127.127 E.0057
M204 S250
G1 X135.072 Y127.237 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X135.096 Y127.052 E.00571
G3 X135.949 Y126.299 I.979 J.249 E.03714
G1 X136.05 Y126.292 E.0031
G3 X135.065 Y127.299 I.025 J1.009 E.14703
G1 X135.065 Y127.296 E.00008
; WIPE_START
M204 S6000
G1 X135.096 Y127.052 E-.09345
G1 X135.165 Y126.863 E-.0764
G1 X135.269 Y126.692 E-.0764
G1 X135.406 Y126.544 E-.07651
G1 X135.57 Y126.426 E-.07647
G1 X135.753 Y126.344 E-.0764
G1 X135.949 Y126.299 E-.07637
G1 X136.05 Y126.292 E-.03835
G1 X136.25 Y126.307 E-.07638
G1 X136.444 Y126.361 E-.07649
G1 X136.482 Y126.383 E-.01678
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.882 Y127.445 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.057 Y127.416 E.0059
G1 X138.131 Y127.561 E.00539
G3 X137.857 Y130.078 I-2.179 J1.036 E.08842
G1 X137.685 Y130.017 E.00606
G2 X137.234 Y128.687 I-1.932 J-.087 E.04768
G2 X137.874 Y127.504 I-1.254 J-1.443 E.04559
; WIPE_START
G1 X138.057 Y127.416 E-.07714
G1 X138.131 Y127.561 E-.06174
G1 X138.224 Y127.78 E-.09063
G1 X138.321 Y128.124 E-.13574
G1 X138.365 Y128.479 E-.13578
G1 X138.356 Y128.836 E-.13568
G1 X138.3 Y129.155 E-.1233
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.927 Y126.184 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X137.044 Y126.007 E.00706
G1 X137.254 Y126.108 E.00772
G3 X136.646 Y131.319 I-1.285 J2.491 E.2251
G1 X136.556 Y131.126 E.00706
G2 X136.536 Y128.64 I-.703 J-1.237 E.1003
G2 X136.973 Y126.222 I-.488 J-1.336 E.09833
; WIPE_START
G1 X137.044 Y126.007 E-.0862
G1 X137.254 Y126.108 E-.08849
G1 X137.611 Y126.326 E-.15889
G1 X137.931 Y126.595 E-.1589
G1 X138.208 Y126.909 E-.15896
G1 X138.363 Y127.149 E-.10857
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.803 Y130.293 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X136.767 Y130.377 E.00279
G3 X135.755 Y128.892 I-.887 J-.483 E.12684
G1 X135.855 Y128.884 E.0031
G3 X136.845 Y130.192 I.025 J1.009 E.05881
G1 X136.826 Y130.238 E.00153
; WIPE_START
M204 S6000
G1 X136.767 Y130.377 E-.05733
G1 X136.654 Y130.544 E-.07647
G1 X136.473 Y130.713 E-.0944
G1 X136.386 Y130.769 E-.03942
G1 X136.202 Y130.852 E-.07643
G1 X136.006 Y130.897 E-.07638
G1 X135.805 Y130.902 E-.07648
G1 X135.607 Y130.867 E-.0765
G1 X135.42 Y130.793 E-.07638
G1 X135.251 Y130.684 E-.07648
G1 X135.187 Y130.622 E-.03373
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.368 Y125.469 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.424 Y125.456 E.00176
G3 X136.057 Y125.409 I.553 J3.141 E.01955
G1 X136.214 Y125.417 E.00483
G3 X135.114 Y125.527 I-.237 J3.181 E.58162
G1 X135.309 Y125.482 E.00616
M204 S10000
G1 X135.448 Y125.653 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536316
G1 F7296.38
M204 S6000
G1 X135.803 Y125.866 E.01664
G1 X136.181 Y125.855 E.01523
G1 X136.558 Y125.923 E.01538
G1 X136.94 Y125.764 E.01664
; WIPE_START
G1 X136.558 Y125.923 E-.19791
G1 X136.181 Y125.855 E-.18297
G1 X135.803 Y125.866 E-.18123
G1 X135.448 Y125.653 E-.19789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.585 Y126.562 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.328689
G1 F12597.624
M204 S6000
G3 X137.929 Y127.231 I-13.275 J7.261 E.01752
M204 S10000
G1 X137.959 Y127.226 F42000
; LINE_WIDTH: 0.246123
G1 F15000
M204 S6000
G2 X137.53 Y126.52 I-14.037 J8.05 E.01367
M204 S10000
G1 X137.511 Y126.524 F42000
; LINE_WIDTH: 0.157376
G1 F15000
M204 S6000
G1 X138.022 Y127.215 E.00801
; WIPE_START
G1 X137.511 Y126.524 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.833 Y128.282 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.455231
G1 F8731.272
M204 S6000
G3 X137.919 Y129.045 I-15.459 J2.117 E.02582
; LINE_WIDTH: 0.417855
G1 F9601.678
G1 X137.95 Y129.538 E.01508
M204 S10000
G1 X138.002 Y129.423 F42000
; LINE_WIDTH: 0.59341
G1 F6539.628
M204 S6000
G1 X137.87 Y128.74 E.03121
G1 X138.109 Y128.11 E.03023
M204 S10000
G1 X138.089 Y128.032 F42000
; LINE_WIDTH: 0.515469
G1 F7618.265
M204 S6000
G3 X137.747 Y129.14 I-22.083 J-6.211 E.04467
; WIPE_START
G1 X138.089 Y128.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.811 Y130.277 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.122727
G1 F15000
M204 S6000
G1 X137.18 Y130.872 E.00564
M204 S10000
G1 X137.187 Y130.881 F42000
; LINE_WIDTH: 0.197416
G1 F15000
M204 S6000
G2 X137.759 Y130.259 I-11.895 J-11.491 E.01063
M204 S10000
G1 X137.712 Y130.242 F42000
; LINE_WIDTH: 0.296062
G1 F14221.315
M204 S6000
G3 X137.243 Y130.862 I-12.735 J-9.154 E.01602
; WIPE_START
G1 X137.712 Y130.242 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.507 Y131.543 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.536237
G1 F7297.545
M204 S6000
G1 X136.153 Y131.33 E.01664
G1 X135.772 Y131.34 E.0153
G1 X135.397 Y131.273 E.01531
G1 X135.015 Y131.431 E.01663
; WIPE_START
G1 X135.397 Y131.273 E-.19786
G1 X135.772 Y131.34 E-.18214
G1 X136.153 Y131.33 E-.18204
G1 X136.507 Y131.543 E-.19796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.371 Y130.634 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.328712
G1 F12596.579
M204 S6000
G3 X134.026 Y129.965 I13.053 J-7.147 E.01752
M204 S10000
G1 X133.996 Y129.97 F42000
; LINE_WIDTH: 0.246143
G1 F15000
M204 S6000
G2 X134.424 Y130.675 I14.703 J-8.445 E.01365
M204 S10000
G1 X134.444 Y130.671 F42000
; LINE_WIDTH: 0.157454
G1 F15000
M204 S6000
G1 X133.933 Y129.98 E.00802
; WIPE_START
G1 X134.444 Y130.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.122 Y128.917 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.455152
G1 F8732.959
M204 S6000
G3 X134.036 Y128.15 I15.379 J-2.11 E.02592
; LINE_WIDTH: 0.417586
G1 F9608.568
G1 X134.006 Y127.658 E.01507
M204 S10000
G1 X133.953 Y127.773 F42000
; LINE_WIDTH: 0.581706
G1 F6681.687
M204 S6000
G1 X134.073 Y128.407 E.02836
G3 X134.066 Y128.503 I-.111 J.039 E.00431
G1 X133.853 Y129.112 E.02836
M204 S10000
G1 X133.891 Y129.246 F42000
; LINE_WIDTH: 0.418922
G1 F9574.42
M204 S6000
G3 X134.175 Y127.965 I19.665 J3.691 E.04021
; WIPE_START
G1 X133.891 Y129.246 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.163 Y126.925 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.157578
G1 F15000
M204 S6000
G1 X134.77 Y126.319 E.00802
M204 S10000
G1 X134.752 Y126.312 F42000
; LINE_WIDTH: 0.246109
G1 F15000
M204 S6000
G2 X134.222 Y126.947 I12.496 J10.967 E.01368
M204 S10000
G1 X134.25 Y126.957 F42000
; LINE_WIDTH: 0.328635
G1 F12599.975
M204 S6000
G3 X134.692 Y126.345 I12.474 J8.534 E.01757
; WIPE_START
G1 X134.25 Y126.957 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.667 Y128.708 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.115001
G1 F15000
M204 S6000
G2 X136.316 Y128.506 I-3.662 J-12.896 E.004
M204 S10000
G1 X136.311 Y128.49 F42000
; LINE_WIDTH: 0.163855
G1 F15000
M204 S6000
G2 X136.103 Y128.575 I.3 J1.028 E.00222
; LINE_WIDTH: 0.193343
G1 X136.083 Y128.59 E.0003
; LINE_WIDTH: 0.213267
G1 X136.063 Y128.604 E.00034
G1 X136.098 Y128.639 E.00068
; LINE_WIDTH: 0.163752
G2 X136.291 Y128.754 I.644 J-.856 E.00221
M204 S10000
G1 X136.299 Y128.739 F42000
; LINE_WIDTH: 0.114895
G1 F15000
M204 S6000
G2 X135.685 Y128.442 I-6.11 J11.822 E.004
M204 S10000
G1 X136.011 Y128.505 F42000
; LINE_WIDTH: 0.223337
G1 F15000
M204 S6000
G1 X135.932 Y128.563 E.00144
; LINE_WIDTH: 0.192311
G1 X135.846 Y128.624 E.00128
; LINE_WIDTH: 0.16356
G1 X135.644 Y128.706 E.00214
M204 S10000
G1 X135.639 Y128.69 F42000
; LINE_WIDTH: 0.115016
G1 F15000
M204 S6000
G3 X136.28 Y128.489 I4.57 J13.46 E.00395
M204 S10000
G1 X136.161 Y128.612 F42000
; LINE_WIDTH: 0.233994
G1 F15000
M204 S6000
G1 X135.892 Y128.591 E.0042
; LINE_WIDTH: 0.223353
G1 X135.874 Y128.574 E.00036
; LINE_WIDTH: 0.189462
G1 X135.851 Y128.553 E.00038
; LINE_WIDTH: 0.163679
G1 X135.664 Y128.441 E.00214
M204 S10000
G1 X135.656 Y128.456 F42000
; LINE_WIDTH: 0.1151
G1 F15000
M204 S6000
G2 X136.264 Y128.752 I6.274 J-12.131 E.00398
; WIPE_START
G1 X135.656 Y128.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.266 Y129.041 Z3 F42000
G1 X147.178 Y129.341 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.162 Y129.535 E.00646
G3 X146.745 Y129.595 I-.485 J-1.924 E.014
G1 X146.668 Y129.578 E.00261
G1 X146.605 Y129.53 E.00262
G1 X146.568 Y129.465 E.00249
G1 X146.558 Y129.401 E.00215
G3 X146.802 Y129.224 I.19 J.004 E.01157
G1 X147.12 Y129.323 E.01107
M204 S10000
G1 X147.816 Y129.852 F42000
G1 F5400
M204 S6000
G1 X146.797 Y130 E.03415
G3 X146.756 Y128.807 I-.049 J-.595 E.06412
G3 X146.9 Y128.828 I-.019 J.647 E.00484
G1 X147.959 Y129.159 E.03678
G3 X147.908 Y129.838 I-6.902 J-.178 E.0226
G1 X147.875 Y129.843 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.736 Y130.395 I-.592 J-2.502 E.01684
G3 X146.995 Y128.447 I.012 J-.99 E.10282
G1 X147.41 Y128.577 E.01336
G2 X145.388 Y119.38 I-19.602 J-.511 E.2922
G2 X145.806 Y118.23 I-5.274 J-2.564 E.03766
G1 X145.863 Y118.179 E.00237
G1 X146.207 Y118.821 E.02238
G3 X144.2 Y140.374 I-18.231 J9.172 E.70109
G1 X144.15 Y140.315 E.00237
G2 X143.909 Y139.115 I-5.839 J.55 E.03766
G2 X147.271 Y130.385 I-16.184 J-11.245 E.29022
M204 S10000
G1 X147.803 Y130.052 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.629758
G1 F6134.572
M204 S6000
G3 X144.226 Y139.522 I-20.051 J-2.163 E.48936
; WIPE_START
G1 X144.787 Y138.687 E-.38253
G1 X145.281 Y137.867 E-.3637
G1 X145.298 Y137.835 E-.01378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.43 Y130.506 Z3 F42000
G1 X147.888 Y128.931 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.629739
G1 F6134.778
M204 S6000
G2 X145.762 Y119.025 I-20.153 J-.857 E.48976
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.778
G1 X146.192 Y119.935 E-.38268
G1 X146.559 Y120.819 E-.36355
G1 X146.571 Y120.853 E-.01378
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/76
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.355 J.96 E.01218
G1 X123.976 Y137.937 E.11294
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.479 Y144.037 Z3.2 F42000
G1 X116.952 Y144.662 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01504
G2 X117.285 Y144.183 I-1.652 J-6.396 E.0247
G1 X117.392 Y144.356 E.00675
G1 X117.01 Y144.701 E.01708
G1 X117.002 Y144.696 E.00034
M204 S250
G1 X117.794 Y144.52 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46504
G2 X136.62 Y145.388 I-4.594 J-19.538 E.13933
G2 X137.772 Y145.806 I2.563 J-5.271 E.03771
M73 P61 R10
G1 X137.823 Y145.862 E.00234
G3 X115.624 Y144.198 I-9.823 J-17.868 E.72359
G1 X115.683 Y144.151 E.00234
G2 X118.33 Y143.172 I-.463 J-5.321 E.08775
G1 X118.353 Y143.233 E.00199
G3 X118.09 Y144.252 I-.974 J.293 E.03399
M73 P62 R10
G1 X117.838 Y144.48 E.01045
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.45366
G1 X119.568 Y145.48 E-.30634
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


G1 X117.606 Y144.329 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261092
G1 F15000
M204 S6000
G1 X118.08 Y143.695 E.01406
; LINE_WIDTH: 0.230633
G1 X118.203 Y143.522 E.00325
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.418891
G1 F9575.209
M204 S6000
G1 X117.892 Y143.898 E.01224
G3 X117.808 Y143.963 I-.712 J-.838 E.00325
; LINE_WIDTH: 0.476209
G1 F8308.551
G1 X117.694 Y144.041 E.00488
G1 X117.368 Y143.945 E.01199
M204 S10000
G1 X117.241 Y144.757 F42000
; LINE_WIDTH: 0.629996
G1 F6132.09
M204 S6000
G1 X118.147 Y145.286 E.05019
G2 X136.07 Y146.19 I9.857 J-17.296 E.89064
G1 X136.975 Y145.762 E.04791
; WIPE_START
G1 X136.07 Y146.19 E-.38056
G1 X135.168 Y146.564 E-.37117
G1 X135.147 Y146.571 E-.00827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.033 Y143.807 Z3.2 F42000
G1 X110.469 Y136.981 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.0021
G1 X110.501 Y136.906 E.00072
G1 X110.493 Y136.926 E.00058
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.2813
G1 X110.501 Y136.906 E-.26663
G1 X110.493 Y136.926 E-.21208
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.314 Z3.2 F42000
G1 X112.003 Y116.507 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00222
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.566 E.00045
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.31948
G1 X111.998 Y116.583 E-.27066
G1 X111.999 Y116.566 E-.16986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.713 Y111.506 Z3.2 F42000
G1 X119.544 Y109.885 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.622 Y109.847 E.00287
G1 X119.947 Y110.246 E.01706
G1 X119.816 Y110.401 E.00675
G2 X119.149 Y110.071 I-3.261 J5.764 E.02469
G1 X119.489 Y109.91 E.01249
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.796 I-1.259 J1.288 E.02415
G3 X120.699 Y111.556 I-.961 J.264 E.02418
G2 X118.228 Y110.194 I-3.722 J3.831 E.08774
G1 X118.177 Y110.138 E.00234
G3 X127.729 Y107.616 I9.883 J18.081 E.30656
G3 X140.376 Y111.802 I.296 J20.305 E.41705
G1 X140.316 Y111.849 E.00234
G2 X139.116 Y112.091 I.537 J5.762 E.03769
G2 X121.501 Y109.71 I-11.122 J15.931 E.56728
G1 X120.426 Y110.122 E.03538
M204 S10000
G1 X120.149 Y110.312 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247429
G1 F15000
M204 S6000
G3 X120.627 Y111.181 I-36.291 J20.519 E.01653
M204 S10000
G1 X120.636 Y111.077 F42000
; LINE_WIDTH: 0.418909
G1 F9574.757
M204 S6000
G1 X120.374 Y110.773 E.01229
G2 X120.301 Y110.697 I-.832 J.725 E.00325
; LINE_WIDTH: 0.476672
G1 F8299.674
G1 X120.199 Y110.602 E.0049
G1 X119.863 Y110.648 E.012
M204 S10000
G1 X119.858 Y109.827 F42000
; LINE_WIDTH: 0.629998
G1 F6132.071
M204 S6000
G1 X120.833 Y109.438 E.0502
G3 X139.522 Y111.774 I7.166 J18.599 E.93846
; WIPE_START
G1 X138.691 Y111.216 E-.38053
G1 X137.855 Y110.712 E-.37118
G1 X137.835 Y110.701 E-.00828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.177 Y114.432 Z3.2 F42000
G1 X125.562 Y117.579 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.013 J-2.119 E.01218
G1 X125.202 Y117.171 E.09934
G1 X125.59 Y117.2 E.01197
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z3.2 F42000
G1 X130.272 Y132.592 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z3.2 F42000
G1 X130.931 Y123.798 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z3.2 F42000
G1 X130.512 Y131.808 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.29 Y121.437 E.03011
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F6123.094
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.417562
G1 F9609.186
M204 S6000
G1 X132.833 Y123.549 E.05112
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z3.2 F42000
G1 X132.116 Y133.122 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.41756
G1 F9609.224
M204 S6000
G1 X130.446 Y132.997 E.05112
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.272 Y127.296 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X134.291 Y127.57 E.00912
G2 X134.723 Y128.504 I1.902 J-.314 E.03456
G2 X134.074 Y129.751 I1.267 J1.453 E.04775
G1 X133.898 Y129.78 E.0059
G3 X134.097 Y127.119 I2.093 J-1.181 E.09382
G1 X134.267 Y127.174 E.0059
G1 X134.269 Y127.236 E.00206
M204 S10000
G1 X134.681 Y127.182 F42000
G1 F5400
M204 S6000
G1 X134.681 Y127.232 E.00165
G2 X135.409 Y128.549 I1.419 J.074 E.05259
G2 X134.505 Y129.616 I.601 J1.425 E.04815
G2 X135.029 Y131.011 I1.392 J.273 E.05202
G1 X134.911 Y131.189 E.00706
G3 X135.309 Y125.877 I1.073 J-2.59 E.23302
G1 X135.399 Y126.07 E.00706
G2 X134.722 Y126.957 I.701 J1.236 E.03803
G1 X134.692 Y127.123 E.00561
M204 S250
G1 X135.067 Y127.241 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X135.096 Y127.052 E.00586
G3 X135.949 Y126.299 I.979 J.249 E.03714
G1 X136.05 Y126.292 E.0031
G3 X135.065 Y127.301 I.025 J1.009 E.14698
; WIPE_START
M204 S6000
G1 X135.096 Y127.052 E-.09508
G1 X135.165 Y126.863 E-.07645
G1 X135.269 Y126.692 E-.07638
G1 X135.406 Y126.544 E-.07642
G1 X135.57 Y126.427 E-.07648
G1 X135.753 Y126.344 E-.07648
G1 X135.949 Y126.299 E-.07635
G1 X136.05 Y126.292 E-.03834
G1 X136.25 Y126.307 E-.07648
G1 X136.444 Y126.361 E-.07646
G1 X136.479 Y126.379 E-.01507
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.882 Y127.445 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.057 Y127.416 E.0059
G1 X138.131 Y127.56 E.00538
G3 X137.858 Y130.076 I-2.178 J1.036 E.08838
G1 X137.689 Y130.022 E.0059
G2 X137.234 Y128.697 I-1.912 J-.084 E.04757
G2 X137.875 Y127.504 I-1.22 J-1.425 E.04596
; WIPE_START
G1 X138.057 Y127.416 E-.07687
G1 X138.131 Y127.56 E-.06168
G1 X138.224 Y127.78 E-.09072
G1 X138.321 Y128.124 E-.13564
G1 X138.365 Y128.479 E-.13584
G1 X138.356 Y128.836 E-.13565
G1 X138.3 Y129.156 E-.12358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.927 Y126.185 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X137.044 Y126.007 E.00706
G1 X137.254 Y126.108 E.00772
G3 X136.646 Y131.318 I-1.285 J2.491 E.22511
G1 X136.556 Y131.126 E.00706
G2 X136.536 Y128.64 I-.702 J-1.237 E.10031
G2 X136.973 Y126.223 I-.488 J-1.336 E.09832
; WIPE_START
G1 X137.044 Y126.007 E-.08622
G1 X137.254 Y126.108 E-.08848
G1 X137.611 Y126.326 E-.15887
G1 X137.931 Y126.595 E-.15897
G1 X138.208 Y126.909 E-.15882
G1 X138.363 Y127.149 E-.10863
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.813 Y130.276 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X136.741 Y130.42 E.00496
G3 X135.752 Y128.892 I-.862 J-.526 E.12528
G1 X135.855 Y128.884 E.00318
G3 X136.835 Y130.22 I.024 J1.009 E.05967
; WIPE_START
M204 S6000
G1 X136.741 Y130.42 E-.084
G1 X136.621 Y130.581 E-.07637
G1 X136.47 Y130.715 E-.07646
G1 X136.296 Y130.815 E-.07641
G1 X136.105 Y130.879 E-.07648
G1 X135.906 Y130.904 E-.07643
G1 X135.705 Y130.889 E-.07645
G1 X135.511 Y130.835 E-.07643
G1 X135.332 Y130.743 E-.07655
G1 X135.2 Y130.637 E-.06443
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.35 Y125.473 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.424 Y125.456 E.00233
G3 X136.057 Y125.409 I.551 J3.141 E.01955
G1 X136.21 Y125.417 E.0047
G3 X135.113 Y125.526 I-.235 J3.181 E.58173
G1 X135.291 Y125.486 E.0056
M204 S10000
G1 X135.448 Y125.652 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536284
G1 F7296.849
M204 S6000
G1 X135.803 Y125.866 E.01664
G1 X136.178 Y125.855 E.01509
G1 X136.558 Y125.923 E.01553
G1 X136.94 Y125.764 E.01664
; WIPE_START
G1 X136.558 Y125.923 E-.1979
G1 X136.178 Y125.855 E-.18468
G1 X135.803 Y125.866 E-.17945
G1 X135.448 Y125.652 E-.19797
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.585 Y126.562 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.328629
G1 F12600.232
M204 S6000
G3 X137.929 Y127.231 I-13.217 J7.227 E.01751
M204 S10000
G1 X137.959 Y127.226 F42000
; LINE_WIDTH: 0.246161
G1 F15000
M204 S6000
G2 X137.531 Y126.521 I-14.678 J8.437 E.01366
M204 S10000
G1 X137.511 Y126.524 F42000
; LINE_WIDTH: 0.157465
G1 F15000
M204 S6000
G1 X138.022 Y127.215 E.00802
M204 S10000
G1 X138.112 Y128.122 F42000
; LINE_WIDTH: 0.606679
G1 F6385.711
M204 S6000
G1 X137.87 Y128.738 E.03038
G1 X138.012 Y129.398 E.03102
M204 S10000
G1 X137.981 Y129.472 F42000
; LINE_WIDTH: 0.515789
G1 F7613.104
M204 S6000
G2 X137.808 Y128.324 I-23.261 J2.927 E.04475
; WIPE_START
G1 X137.981 Y129.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.144 Y128.505 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.132274
G1 F15000
M204 S6000
G2 X135.577 Y128.704 I2.946 J9.278 E.00438
M204 S10000
G1 X135.6 Y128.723 F42000
; LINE_WIDTH: 0.193232
G1 F15000
M204 S6000
G1 X135.844 Y128.605 E.00333
; LINE_WIDTH: 0.233663
G1 X135.866 Y128.589 E.00042
G1 X136.161 Y128.612 E.00459
M204 S10000
G1 X136.269 Y128.754 F42000
; LINE_WIDTH: 0.115078
G1 F15000
M204 S6000
G3 X135.656 Y128.456 I5.438 J-11.995 E.00401
M204 S10000
G1 X135.686 Y128.442 F42000
; LINE_WIDTH: 0.115024
G1 F15000
M204 S6000
G3 X136.299 Y128.739 I-5.493 J12.11 E.004
M204 S10000
G1 X136.291 Y128.754 F42000
; LINE_WIDTH: 0.163937
G1 F15000
M204 S6000
G3 X136.098 Y128.639 I.456 J-.978 E.00222
; LINE_WIDTH: 0.213369
G1 X136.063 Y128.604 E.00068
G1 X136.083 Y128.59 E.00034
; LINE_WIDTH: 0.193438
G1 X136.103 Y128.575 E.0003
; LINE_WIDTH: 0.163864
G3 X136.311 Y128.49 I.512 J.949 E.00222
M204 S10000
G1 X136.316 Y128.506 F42000
; LINE_WIDTH: 0.114994
G1 F15000
M204 S6000
G3 X135.652 Y128.712 I-4.234 J-12.452 E.00408
; WIPE_START
G1 X136.316 Y128.506 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.692 Y126.345 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.328714
G1 F12596.513
M204 S6000
G2 X134.251 Y126.955 I12.204 J9.277 E.01752
M204 S10000
G1 X134.223 Y126.946 F42000
; LINE_WIDTH: 0.246047
G1 F15000
M204 S6000
G3 X134.752 Y126.312 I13.123 J10.42 E.01366
M204 S10000
G1 X134.77 Y126.319 F42000
; LINE_WIDTH: 0.157504
G1 F15000
M204 S6000
G1 X134.162 Y126.926 E.00803
; WIPE_START
G1 X134.77 Y126.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.209 Y128.054 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.515737
G1 F7613.94
M204 S6000
G2 X133.866 Y129.164 I21.639 J7.29 E.04475
M204 S10000
G1 X133.847 Y129.086 F42000
; LINE_WIDTH: 0.605088
G1 F6403.787
M204 S6000
G1 X134.085 Y128.456 E.03085
G1 X133.943 Y127.797 E.03086
M204 S10000
G1 X133.974 Y127.723 F42000
; LINE_WIDTH: 0.515582
G1 F7616.445
M204 S6000
G2 X134.148 Y128.872 I22.83 J-2.863 E.04473
; WIPE_START
G1 X133.974 Y127.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.934 Y129.98 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.157416
G1 F15000
M204 S6000
G1 X134.444 Y130.671 E.00801
M204 S10000
G1 X134.425 Y130.675 F42000
; LINE_WIDTH: 0.246029
G1 F15000
M204 S6000
G3 X133.996 Y129.97 I13.677 J-8.8 E.01367
M204 S10000
G1 X134.026 Y129.965 F42000
; LINE_WIDTH: 0.329217
G1 F12574.389
M204 S6000
G2 X134.371 Y130.634 I13.776 J-6.676 E.01755
; WIPE_START
G1 X134.026 Y129.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.015 Y131.431 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.536246
G1 F7297.416
M204 S6000
G1 X135.397 Y131.273 E.01662
G1 X135.772 Y131.34 E.01531
G1 X136.153 Y131.33 E.0153
G1 X136.508 Y131.543 E.01665
; WIPE_START
G1 X136.153 Y131.33 E-.19808
G1 X135.772 Y131.34 E-.18206
G1 X135.397 Y131.273 E-.1821
G1 X135.015 Y131.431 E-.19776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.263 Y130.851 Z3.2 F42000
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.32868
G1 F12598.007
M204 S6000
G2 X137.704 Y130.241 I-11.779 J-8.971 E.01753
M204 S10000
G1 X137.732 Y130.25 F42000
; LINE_WIDTH: 0.246124
G1 F15000
M204 S6000
G3 X137.204 Y130.883 I-12.998 J-10.312 E.01366
M204 S10000
G1 X137.185 Y130.877 F42000
; LINE_WIDTH: 0.157422
G1 F15000
M204 S6000
G1 X137.793 Y130.269 E.00802
; WIPE_START
G1 X137.185 Y130.877 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X144.729 Y129.717 Z3.2 F42000
G1 X147.178 Y129.341 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.162 Y129.535 E.00646
G3 X146.746 Y129.594 I-.488 J-1.938 E.01399
G1 X146.668 Y129.577 E.00263
G1 X146.605 Y129.53 E.00263
G1 X146.573 Y129.479 E.00198
G1 X146.558 Y129.4 E.00266
G3 X146.801 Y129.223 I.189 J.005 E.01154
G1 X147.12 Y129.323 E.01109
M204 S10000
G1 X147.816 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.798 Y130 E.03414
G3 X146.756 Y128.807 I-.049 J-.595 E.0641
G3 X146.9 Y128.828 I-.018 J.645 E.00483
G1 X147.959 Y129.159 E.0368
G3 X147.908 Y129.838 I-6.911 J-.179 E.0226
G1 X147.876 Y129.843 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.737 Y130.395 I-.593 J-2.51 E.01683
G3 X146.995 Y128.447 I.011 J-.99 E.10288
G1 X147.41 Y128.577 E.01338
G2 X145.388 Y119.38 I-19.602 J-.511 E.29219
G2 X145.806 Y118.228 I-5.272 J-2.563 E.03771
G1 X145.862 Y118.177 E.00234
G1 X146.207 Y118.821 E.02245
G3 X144.198 Y140.376 I-18.231 J9.172 E.70116
G1 X144.151 Y140.317 E.00234
G2 X143.909 Y139.116 I-5.762 J.537 E.0377
G2 X147.271 Y130.385 I-16.184 J-11.246 E.29026
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.629756
G1 F6134.595
M204 S6000
G3 X144.226 Y139.522 I-20.051 J-2.163 E.48937
; WIPE_START
G1 X144.787 Y138.687 E-.38252
G1 X145.281 Y137.867 E-.3637
G1 X145.298 Y137.835 E-.01378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.43 Y130.506 Z3.2 F42000
G1 X147.888 Y128.931 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.62974
G1 F6134.765
M204 S6000
G2 X145.762 Y119.025 I-20.157 J-.856 E.48974
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.765
G1 X146.192 Y119.935 E-.38268
G1 X146.564 Y120.832 E-.36905
G1 X146.571 Y120.853 E-.00828
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/76
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.2 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.344 J.959 E.01218
G1 X120.509 Y137.677 E.00611
G1 X123.976 Y137.937 E.10682
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.479 Y144.037 Z3.4 F42000
G1 X116.952 Y144.662 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01506
G2 X117.285 Y144.183 I-1.656 J-6.409 E.02471
G1 X117.392 Y144.356 E.00675
G1 X117.01 Y144.701 E.01709
G1 X117.002 Y144.696 E.00032
M204 S250
G1 X117.794 Y144.521 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46504
G1 X132.683 Y146.831 E.01023
G2 X136.62 Y145.388 I-4.778 J-19.128 E.1291
G2 X137.77 Y145.805 I2.344 J-4.666 E.03767
G1 X137.821 Y145.863 E.00237
G3 X115.624 Y144.198 I-9.824 J-17.833 E.72366
G1 X115.683 Y144.151 E.00234
G2 X118.33 Y143.172 I-.463 J-5.32 E.08775
G1 X118.353 Y143.233 E.00199
G3 X118.09 Y144.252 I-.974 J.293 E.03399
G1 X117.838 Y144.48 E.01045
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.45363
G1 X119.568 Y145.48 E-.30637
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


G1 X117.606 Y144.328 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261176
G1 F15000
M204 S6000
G1 X118.08 Y143.695 E.01407
; LINE_WIDTH: 0.230582
G1 X118.203 Y143.522 E.00325
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.419026
G1 F9571.777
M204 S6000
G1 X117.892 Y143.898 E.01225
G3 X117.808 Y143.963 I-.711 J-.837 E.00324
; LINE_WIDTH: 0.480376
G1 F8229.413
G1 X117.694 Y144.041 E.00492
G1 X117.368 Y143.945 E.01211
M204 S10000
G1 X117.241 Y144.757 F42000
; LINE_WIDTH: 0.629997
G1 F6132.081
M204 S6000
G1 X118.147 Y145.286 E.05018
G2 X136.07 Y146.19 I9.857 J-17.296 E.89064
G1 X136.975 Y145.762 E.04791
; WIPE_START
G1 X136.07 Y146.19 E-.38055
G1 X135.168 Y146.564 E-.37115
G1 X135.147 Y146.571 E-.0083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.033 Y143.807 Z3.4 F42000
G1 X110.469 Y136.981 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.0021
G1 X110.501 Y136.906 E.00072
G1 X110.493 Y136.926 E.00058
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.28121
G1 X110.501 Y136.906 E-.26522
G1 X110.493 Y136.926 E-.21357
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.314 Z3.4 F42000
G1 X112.003 Y116.506 Z3.4
G1 Z3
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00222
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.566 E.00046
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.31919
G1 X111.998 Y116.583 E-.26921
G1 X111.999 Y116.566 E-.1716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.713 Y111.506 Z3.4 F42000
G1 X119.544 Y109.884 Z3.4
M73 P63 R10
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.622 Y109.847 E.00287
G1 X119.948 Y110.246 E.01707
G1 X119.816 Y110.401 E.00675
G2 X119.149 Y110.071 I-3.261 J5.764 E.0247
G1 X119.49 Y109.91 E.01251
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.795 I-1.26 J1.288 E.02414
G3 X120.699 Y111.556 I-.961 J.264 E.02419
G2 X118.23 Y110.195 I-3.722 J3.83 E.08769
G1 X118.179 Y110.137 E.00237
G3 X127.874 Y107.616 I9.827 J17.891 E.31099
G3 X140.376 Y111.802 I.159 J20.291 E.4126
G1 X140.317 Y111.849 E.00234
G2 X139.115 Y112.091 I.421 J5.204 E.03774
G2 X121.501 Y109.71 I-11.123 J15.948 E.56721
G1 X120.426 Y110.121 E.03538
M204 S10000
G1 X120.149 Y110.312 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247407
G1 F15000
M204 S6000
G3 X120.627 Y111.181 I-40.287 J22.692 E.01653
M204 S10000
G1 X120.636 Y111.077 F42000
; LINE_WIDTH: 0.418643
G1 F9581.525
M204 S6000
G1 X120.374 Y110.773 E.01229
G2 X120.301 Y110.697 I-.812 J.706 E.00323
; LINE_WIDTH: 0.480633
G1 F8224.574
G1 X120.2 Y110.602 E.00494
G1 X119.863 Y110.649 E.01212
M204 S10000
G1 X119.858 Y109.827 F42000
; LINE_WIDTH: 0.629998
G1 F6132.073
M204 S6000
G1 X120.833 Y109.438 E.05019
G3 X139.522 Y111.774 I7.166 J18.598 E.93847
; WIPE_START
G1 X138.691 Y111.216 E-.38053
G1 X137.855 Y110.712 E-.37118
G1 X137.835 Y110.701 E-.00829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.177 Y114.432 Z3.4 F42000
G1 X125.562 Y117.579 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.011 J-2.119 E.01218
G1 X124.803 Y117.141 E.08706
G1 X125.59 Y117.2 E.02425
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z3.4 F42000
G1 X130.272 Y132.592 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z3.4 F42000
G1 X130.931 Y123.798 Z3.4
G1 Z3
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z3.4 F42000
G1 X130.512 Y131.808 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.281 Y121.437 E.02984
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630868
G1 F6122.994
M204 S6000
G1 X130.578 Y124.377 E.36469
; WIPE_START
G1 X130.429 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.417562
G1 F9609.189
M204 S6000
G1 X132.833 Y123.549 E.05112
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z3.4 F42000
G1 X132.116 Y133.122 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.41756
G1 F9609.224
M204 S6000
G1 X130.446 Y132.997 E.05112
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.271 Y127.251 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X134.281 Y127.481 E.00763
G2 X134.72 Y128.507 I1.921 J-.215 E.03756
G2 X134.073 Y129.751 I1.271 J1.45 E.04759
G1 X133.898 Y129.78 E.0059
G3 X134.098 Y127.118 I2.093 J-1.181 E.09387
G1 X134.271 Y127.178 E.00606
G1 X134.271 Y127.191 E.00042
M204 S10000
G1 X134.676 Y127.229 F42000
G1 F5400
M204 S6000
G1 X134.679 Y127.301 E.00239
G2 X135.409 Y128.548 I1.421 J.005 E.05028
G2 X134.505 Y129.616 I.601 J1.425 E.04815
G2 X135.029 Y131.011 I1.392 J.273 E.05203
G1 X134.911 Y131.188 E.00706
G3 X135.309 Y125.877 I1.074 J-2.59 E.23302
G1 X135.399 Y126.07 E.00706
G2 X134.686 Y127.163 I.701 J1.236 E.04495
G1 X134.685 Y127.17 E.00026
M204 S250
G1 X135.07 Y127.245 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X135.07 Y127.201 E.00134
G3 X135.949 Y126.299 I1.005 J.1 E.04179
G1 X136.05 Y126.292 E.0031
G3 X135.07 Y127.402 I.025 J1.009 E.14385
G1 X135.07 Y127.305 E.00299
; WIPE_START
M204 S6000
G1 X135.07 Y127.201 E-.03934
G1 X135.109 Y127.004 E-.07644
G1 X135.188 Y126.818 E-.07648
G1 X135.302 Y126.65 E-.07744
G1 X135.404 Y126.546 E-.05535
G1 X135.57 Y126.427 E-.07747
G1 X135.753 Y126.344 E-.07653
G1 X135.949 Y126.299 E-.07632
G1 X136.05 Y126.292 E-.03833
G1 X136.25 Y126.307 E-.07641
G1 X136.444 Y126.361 E-.07652
G1 X136.475 Y126.377 E-.01337
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.875 Y127.452 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.057 Y127.415 E.00614
G1 X138.131 Y127.561 E.00542
G3 X137.859 Y130.075 I-2.177 J1.036 E.08832
G1 X137.691 Y130.023 E.00582
G2 X137.238 Y128.692 I-1.888 J-.1 E.04778
G2 X137.868 Y127.511 I-1.273 J-1.437 E.04536
; WIPE_START
G1 X138.057 Y127.415 E-.0804
G1 X138.131 Y127.561 E-.06213
G1 X138.262 Y127.893 E-.13586
G1 X138.321 Y128.124 E-.09054
G1 X138.365 Y128.479 E-.13578
G1 X138.356 Y128.836 E-.13568
G1 X138.302 Y129.146 E-.11962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.927 Y126.185 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X137.044 Y126.007 E.00706
G1 X137.254 Y126.108 E.00773
G3 X136.646 Y131.319 I-1.285 J2.491 E.2251
G1 X136.556 Y131.126 E.00706
G2 X136.536 Y128.64 I-.709 J-1.237 E.10016
G2 X136.973 Y126.223 I-.495 J-1.337 E.09816
; WIPE_START
G1 X137.044 Y126.007 E-.0863
G1 X137.254 Y126.108 E-.08858
G1 X137.611 Y126.326 E-.15875
G1 X137.931 Y126.595 E-.15886
G1 X138.208 Y126.909 E-.15897
G1 X138.363 Y127.149 E-.10855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.885 Y129.796 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X135.755 Y128.892 I-1.005 J.097 E.14531
G1 X135.855 Y128.884 E.0031
G3 X136.878 Y129.737 I.025 J1.009 E.04468
; WIPE_START
M204 S6000
G1 X136.89 Y129.942 E-.07799
G1 X136.859 Y130.144 E-.07753
G1 X136.791 Y130.333 E-.07641
G1 X136.686 Y130.504 E-.07638
G1 X136.549 Y130.652 E-.07651
G1 X136.386 Y130.769 E-.07641
G1 X136.202 Y130.852 E-.07651
G1 X136.006 Y130.897 E-.07633
G1 X135.805 Y130.902 E-.07652
G1 X135.625 Y130.87 E-.06942
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.331 Y125.478 Z3.4 F42000
G1 Z3
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.424 Y125.455 E.00293
G3 X136.057 Y125.409 I.549 J3.142 E.01955
G1 X136.206 Y125.416 E.00459
G3 X135.113 Y125.526 I-.233 J3.181 E.58185
G1 X135.272 Y125.491 E.005
M204 S10000
G1 X135.448 Y125.653 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536252
G1 F7297.326
M204 S6000
G1 X135.803 Y125.866 E.01662
G1 X136.174 Y125.855 E.01494
G1 X136.558 Y125.923 E.01567
G1 X136.94 Y125.764 E.01663
; WIPE_START
G1 X136.558 Y125.923 E-.19786
G1 X136.174 Y125.855 E-.18648
G1 X135.803 Y125.866 E-.17783
G1 X135.448 Y125.653 E-.19783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.585 Y126.562 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.32864
G1 F12599.752
M204 S6000
G3 X137.93 Y127.233 I-13.026 J7.134 E.01758
M204 S10000
G1 X137.96 Y127.227 F42000
; LINE_WIDTH: 0.24612
G1 F15000
M204 S6000
G2 X137.531 Y126.521 I-14.811 J8.517 E.01368
M204 S10000
G1 X137.511 Y126.524 F42000
; LINE_WIDTH: 0.15754
G1 F15000
M204 S6000
G1 X138.02 Y127.215 E.00801
; WIPE_START
G1 X137.511 Y126.524 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.833 Y128.279 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.455077
G1 F8734.553
M204 S6000
G3 X137.919 Y129.046 I-15.194 J2.092 E.02591
; LINE_WIDTH: 0.417486
G1 F9611.134
G1 X137.95 Y129.538 E.01506
M204 S10000
G1 X138.002 Y129.423 F42000
; LINE_WIDTH: 0.581391
G1 F6685.607
M204 S6000
G1 X137.87 Y128.74 E.03054
G2 X138.103 Y128.085 I-7.047 J-2.873 E.0305
M204 S10000
G1 X138.069 Y127.958 F42000
; LINE_WIDTH: 0.417502
G1 F9610.71
M204 S6000
G1 X137.964 Y128.444 E.01519
; LINE_WIDTH: 0.455138
G1 F8733.251
G3 X137.765 Y129.189 I-14.928 J-3.591 E.02591
; WIPE_START
G1 X137.964 Y128.444 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.793 Y130.268 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157509
G1 F15000
M204 S6000
G1 X137.185 Y130.877 E.00803
M204 S10000
G1 X137.204 Y130.883 F42000
; LINE_WIDTH: 0.246146
G1 F15000
M204 S6000
G2 X137.733 Y130.249 I-12.827 J-11.248 E.01368
M204 S10000
G1 X137.704 Y130.24 F42000
; LINE_WIDTH: 0.328518
G1 F12605.166
M204 S6000
G3 X137.263 Y130.851 I-12.099 J-8.269 E.01752
; WIPE_START
G1 X137.704 Y130.24 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.507 Y131.543 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.536276
G1 F7296.964
M204 S6000
G1 X136.153 Y131.33 E.01664
G1 X135.772 Y131.34 E.0153
G1 X135.397 Y131.273 E.01531
G1 X135.015 Y131.431 E.01664
; WIPE_START
G1 X135.397 Y131.273 E-.19789
G1 X135.772 Y131.34 E-.18212
G1 X136.153 Y131.33 E-.18204
G1 X136.507 Y131.543 E-.19796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.371 Y130.634 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.328706
G1 F12596.846
M204 S6000
G3 X134.026 Y129.965 I13.09 J-7.165 E.01752
M204 S10000
G1 X133.997 Y129.97 F42000
; LINE_WIDTH: 0.246255
G1 F15000
M204 S6000
G2 X134.425 Y130.675 I14.392 J-8.256 E.01367
M204 S10000
G1 X134.444 Y130.671 F42000
; LINE_WIDTH: 0.157569
G1 F15000
M204 S6000
G1 X133.934 Y129.98 E.00803
; WIPE_START
G1 X134.444 Y130.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.122 Y128.914 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.455085
G1 F8734.379
M204 S6000
G3 X134.036 Y128.15 I15.261 J-2.095 E.02582
; LINE_WIDTH: 0.417674
G1 F9606.321
G1 X134.006 Y127.658 E.01506
M204 S10000
G1 X133.953 Y127.772 F42000
; LINE_WIDTH: 0.593114
G1 F6543.154
M204 S6000
G1 X134.085 Y128.456 E.0312
G1 X133.846 Y129.086 E.0302
M204 S10000
G1 X133.866 Y129.164 F42000
; LINE_WIDTH: 0.515875
G1 F7611.73
M204 S6000
G3 X134.209 Y128.056 I22.473 J6.333 E.0447
; WIPE_START
G1 X133.866 Y129.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.145 Y126.919 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.122599
G1 F15000
M204 S6000
G1 X134.776 Y126.324 E.00563
M204 S10000
G1 X134.768 Y126.315 F42000
; LINE_WIDTH: 0.197269
G1 F15000
M204 S6000
G2 X134.196 Y126.937 I12.379 J11.944 E.01063
M204 S10000
G1 X134.244 Y126.953 F42000
; LINE_WIDTH: 0.296
G1 F14224.756
M204 S6000
G3 X134.712 Y126.334 I12.673 J9.106 E.01602
; WIPE_START
G1 X134.244 Y126.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.67 Y128.708 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.115001
G1 F15000
M204 S6000
G2 X136.317 Y128.506 I-3.773 J-13.215 E.00398
M204 S10000
G1 X136.311 Y128.49 F42000
; LINE_WIDTH: 0.16392
G1 F15000
M204 S6000
G2 X136.103 Y128.575 I.306 J1.037 E.00222
; LINE_WIDTH: 0.193516
G1 X136.083 Y128.59 E.0003
; LINE_WIDTH: 0.21342
G1 X136.063 Y128.604 E.00034
G1 X136.098 Y128.639 E.00068
; LINE_WIDTH: 0.164001
G2 X136.291 Y128.754 I.643 J-.853 E.00223
M204 S10000
G1 X136.299 Y128.739 F42000
; LINE_WIDTH: 0.115014
G1 F15000
M204 S6000
G2 X135.686 Y128.442 I-6.053 J11.705 E.00401
M204 S10000
G1 X135.656 Y128.456 F42000
; LINE_WIDTH: 0.115012
G1 F15000
M204 S6000
G2 X136.27 Y128.754 I6.037 J-11.672 E.00401
M204 S10000
G1 X136.161 Y128.612 F42000
; LINE_WIDTH: 0.233665
G1 F15000
M204 S6000
G1 X135.866 Y128.589 E.00459
G1 X135.844 Y128.605 E.00042
; LINE_WIDTH: 0.193192
G1 X135.609 Y128.718 E.0032
M204 S10000
G1 X135.583 Y128.7 F42000
; LINE_WIDTH: 0.134581
G1 F15000
M204 S6000
G3 X136.156 Y128.504 I4.288 J11.571 E.00453
; WIPE_START
G1 X135.583 Y128.7 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.204 Y129.121 Z3.4 F42000
G1 X147.177 Y129.341 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.162 Y129.535 E.00646
G3 X146.745 Y129.594 I-.479 J-1.873 E.01399
G1 X146.672 Y129.579 E.00247
G1 X146.617 Y129.543 E.0022
G1 X146.572 Y129.479 E.00259
G1 X146.558 Y129.419 E.00203
G3 X146.801 Y129.223 I.19 J-.012 E.01209
G1 X147.12 Y129.323 E.0111
M204 S10000
G1 X147.816 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.798 Y130 E.03412
G3 X146.756 Y128.807 I-.051 J-.595 E.06422
G3 X146.899 Y128.828 I-.018 J.644 E.00481
G1 X147.959 Y129.159 E.03682
G3 X147.908 Y129.838 I-6.911 J-.179 E.0226
G1 X147.876 Y129.842 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.737 Y130.395 I-.595 J-2.521 E.01681
G3 X146.994 Y128.447 I.011 J-.989 E.10282
G1 X147.41 Y128.577 E.0134
G2 X145.388 Y119.38 I-19.679 J-.494 E.29217
G2 X145.806 Y118.23 I-5.274 J-2.564 E.03766
G1 X145.863 Y118.179 E.00237
G1 X145.901 Y118.25 E.00249
G3 X144.198 Y140.376 I-17.869 J9.753 E.72116
G1 X144.151 Y140.317 E.00234
G2 X143.909 Y139.115 I-5.834 J.547 E.03772
G2 X147.271 Y130.385 I-16.161 J-11.236 E.29023
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.629757
G1 F6134.586
M204 S6000
G3 X144.226 Y139.522 I-20.05 J-2.162 E.48938
; WIPE_START
G1 X144.787 Y138.687 E-.38244
G1 X145.281 Y137.867 E-.36377
G1 X145.298 Y137.835 E-.0138
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.43 Y130.506 Z3.4 F42000
G1 X147.888 Y128.931 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.629741
G1 F6134.751
M204 S6000
G2 X145.762 Y119.025 I-20.152 J-.857 E.48974
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.751
G1 X146.192 Y119.935 E-.38262
G1 X146.564 Y120.832 E-.36911
G1 X146.571 Y120.853 E-.00827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/76
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.4 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.345 J.959 E.01218
G1 X121.008 Y137.715 E.02146
G1 X123.976 Y137.937 E.09147
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.459 Y144.02 Z3.6 F42000
G1 X116.928 Y144.646 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01406
G2 X117.285 Y144.183 I-1.655 J-6.404 E.02471
G1 X117.392 Y144.356 E.00675
G1 X117.01 Y144.701 E.01709
G1 X116.977 Y144.679 E.00132
M204 S250
G1 X117.794 Y144.521 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46504
G1 X132.81 Y146.799 E.01426
G2 X136.62 Y145.388 I-4.892 J-19.066 E.12507
G2 X137.771 Y145.806 I2.344 J-4.668 E.03772
G1 X137.823 Y145.862 E.00235
G3 X115.624 Y144.198 I-9.825 J-17.832 E.72371
G1 X115.683 Y144.151 E.00234
G2 X118.33 Y143.172 I-.462 J-5.319 E.08775
G1 X118.353 Y143.233 E.00199
G3 X118.091 Y144.252 I-.974 J.293 E.03398
G1 X117.838 Y144.48 E.01046
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.45363
G1 X119.568 Y145.48 E-.30637
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


G1 X117.606 Y144.328 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261089
G1 F15000
M204 S6000
G1 X118.08 Y143.695 E.01406
; LINE_WIDTH: 0.2307
G1 X118.203 Y143.522 E.00325
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.419062
G1 F9570.862
M204 S6000
G1 X117.892 Y143.898 E.01226
G3 X117.808 Y143.962 I-.708 J-.834 E.00322
; LINE_WIDTH: 0.484543
G1 F8151.765
G1 X117.694 Y144.041 E.00498
G1 X117.369 Y143.945 E.01222
M204 S10000
G1 X117.241 Y144.757 F42000
; LINE_WIDTH: 0.629996
G1 F6132.084
M204 S6000
G1 X118.147 Y145.286 E.05018
G2 X136.07 Y146.19 I9.857 J-17.296 E.89064
G1 X136.975 Y145.762 E.04791
; WIPE_START
G1 X136.07 Y146.19 E-.38056
G1 X135.168 Y146.564 E-.37118
G1 X135.147 Y146.571 E-.00827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.033 Y143.807 Z3.6 F42000
G1 X110.469 Y136.981 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.00211
G1 X110.501 Y136.906 E.00072
G1 X110.493 Y136.926 E.00059
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.28116
G1 X110.501 Y136.906 E-.26388
G1 X110.493 Y136.926 E-.21496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z3.6 F42000
G1 X112.003 Y116.506 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00223
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.566 E.00047
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.3189
G1 X111.998 Y116.583 E-.2678
G1 X111.999 Y116.566 E-.1733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.713 Y111.506 Z3.6 F42000
G1 X119.545 Y109.884 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.622 Y109.847 E.00285
G1 X119.948 Y110.246 E.01709
G1 X119.817 Y110.401 E.00674
G2 X119.149 Y110.071 I-3.26 J5.758 E.02472
G1 X119.491 Y109.91 E.01254
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.795 I-1.263 J1.29 E.02412
G3 X120.699 Y111.556 I-.961 J.265 E.0242
G2 X118.229 Y110.194 I-3.721 J3.828 E.08773
G1 X118.177 Y110.138 E.00235
G3 X128.019 Y107.616 I9.825 J17.882 E.31549
G3 X140.374 Y111.8 I.017 J20.285 E.40807
G1 X140.315 Y111.85 E.00237
G2 X139.115 Y112.091 I.423 J5.205 E.03767
G2 X121.501 Y109.71 I-11.124 J15.953 E.5672
G1 X120.426 Y110.121 E.03537
M204 S10000
G1 X120.149 Y110.313 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247576
G1 F15000
M204 S6000
G3 X120.626 Y111.182 I-31.132 J17.683 E.01653
M204 S10000
M73 P64 R10
G1 X120.636 Y111.077 F42000
; LINE_WIDTH: 0.419204
G1 F9567.244
M204 S6000
G1 X120.374 Y110.773 E.01231
G2 X120.301 Y110.697 I-.827 J.722 E.00323
; LINE_WIDTH: 0.484323
G1 F8155.818
G1 X120.2 Y110.603 E.00496
G1 X119.864 Y110.649 E.01222
M204 S10000
G1 X119.859 Y109.827 F42000
; LINE_WIDTH: 0.63
G1 F6132.052
M204 S6000
G1 X120.833 Y109.438 E.05017
G3 X139.522 Y111.774 I7.166 J18.599 E.93847
; WIPE_START
G1 X138.691 Y111.216 E-.38053
G1 X137.855 Y110.712 E-.37118
G1 X137.835 Y110.701 E-.00828
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.177 Y114.432 Z3.6 F42000
G1 X125.562 Y117.579 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-4.988 J-2.111 E.01218
G1 X124.405 Y117.111 E.07477
G1 X125.59 Y117.2 E.03654
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z3.6 F42000
G1 X130.272 Y132.592 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z3.6 F42000
G1 X130.931 Y123.798 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z3.6 F42000
G1 X130.512 Y131.808 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.194 Y121.43 E.02716
G1 X131.29 Y121.437 E.00296
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F6123.094
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.949
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z3.6 F42000
G1 X132.116 Y133.122 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.41756
G1 F9609.224
M204 S6000
G1 X130.446 Y132.997 E.05112
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.271 Y127.263 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X134.291 Y127.57 E.01021
G2 X134.723 Y128.504 I1.902 J-.314 E.03455
G2 X134.073 Y129.751 I1.267 J1.453 E.04775
G1 X133.898 Y129.78 E.0059
G3 X134.097 Y127.119 I2.093 J-1.181 E.09382
G1 X134.267 Y127.174 E.0059
G1 X134.268 Y127.203 E.00097
M204 S10000
G1 X134.68 Y127.236 F42000
G1 F5400
M204 S6000
G1 X134.676 Y127.371 E.0045
G2 X135.146 Y128.353 I1.406 J-.07 E.03709
G1 X135.399 Y128.554 E.01071
G2 X134.478 Y129.894 I.589 J1.391 E.05695
G2 X135.029 Y131.011 I1.427 J-.01 E.04275
G1 X134.911 Y131.188 E.00706
G3 X135.309 Y125.877 I1.073 J-2.59 E.23302
G1 X135.399 Y126.07 E.00706
G2 X134.689 Y127.092 I.682 J1.231 E.04276
G1 X134.684 Y127.176 E.00277
M204 S250
G1 X135.066 Y127.251 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X135.949 Y126.299 I1.008 J.05 E.04333
G1 X136.05 Y126.292 E.0031
G3 X135.065 Y127.311 I.025 J1.009 E.14665
; WIPE_START
M204 S6000
G1 X135.096 Y127.052 E-.09901
G1 X135.165 Y126.863 E-.07654
G1 X135.269 Y126.691 E-.07637
G1 X135.406 Y126.544 E-.07633
G1 X135.57 Y126.427 E-.07656
G1 X135.753 Y126.344 E-.07649
G1 X135.949 Y126.299 E-.07635
G1 X136.05 Y126.292 E-.03832
G1 X136.25 Y126.307 E-.07644
G1 X136.444 Y126.361 E-.07653
G1 X136.47 Y126.374 E-.01107
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.882 Y127.445 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X138.057 Y127.416 E.0059
G1 X138.131 Y127.561 E.00539
G3 X137.859 Y130.075 I-2.178 J1.036 E.08831
G1 X137.691 Y130.023 E.00582
G2 X137.236 Y128.689 I-1.89 J-.1 E.04794
G2 X137.874 Y127.504 I-1.271 J-1.45 E.0456
; WIPE_START
G1 X138.057 Y127.416 E-.07717
G1 X138.131 Y127.561 E-.06173
G1 X138.262 Y127.893 E-.13571
G1 X138.341 Y128.242 E-.1359
G1 X138.368 Y128.598 E-.13572
G1 X138.356 Y128.836 E-.09053
G1 X138.3 Y129.155 E-.12325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.927 Y126.185 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X137.044 Y126.007 E.00706
G1 X137.254 Y126.108 E.00773
G3 X136.646 Y131.319 I-1.285 J2.491 E.2251
G1 X136.556 Y131.126 E.00706
G2 X136.546 Y128.647 I-.708 J-1.236 E.09971
G2 X137.45 Y127.579 I-.601 J-1.425 E.04816
G2 X136.973 Y126.222 I-1.392 J-.273 E.05003
; WIPE_START
G1 X137.044 Y126.007 E-.08607
G1 X137.254 Y126.108 E-.08854
G1 X137.611 Y126.326 E-.15881
G1 X137.931 Y126.595 E-.15896
G1 X138.208 Y126.908 E-.15882
G1 X138.363 Y127.149 E-.1088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.807 Y130.288 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X136.741 Y130.42 E.00454
G3 X135.752 Y128.892 I-.862 J-.526 E.12527
G1 X135.855 Y128.884 E.00318
G3 X136.83 Y130.233 I.024 J1.009 E.06009
; WIPE_START
M204 S6000
G1 X136.741 Y130.42 E-.07888
G1 X136.621 Y130.581 E-.07625
G1 X136.47 Y130.715 E-.07653
G1 X136.296 Y130.815 E-.07643
G1 X136.105 Y130.879 E-.07639
G1 X135.906 Y130.904 E-.0765
G1 X135.705 Y130.889 E-.07643
G1 X135.511 Y130.835 E-.07652
G1 X135.332 Y130.743 E-.0764
G1 X135.189 Y130.628 E-.06967
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.311 Y125.482 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.423 Y125.455 E.00355
G3 X136.057 Y125.409 I.547 J3.142 E.01955
G1 X136.202 Y125.416 E.00447
G3 X135.113 Y125.525 I-.231 J3.181 E.58196
G1 X135.253 Y125.495 E.00438
M204 S10000
G1 X135.448 Y125.653 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.536293
G1 F7296.72
M204 S6000
G1 X135.802 Y125.866 E.01663
G1 X136.171 Y125.855 E.01482
G1 X136.558 Y125.923 E.01579
G1 X136.94 Y125.764 E.01665
; WIPE_START
G1 X136.558 Y125.923 E-.19802
G1 X136.171 Y125.855 E-.18786
G1 X135.802 Y125.866 E-.1763
G1 X135.448 Y125.653 E-.19782
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.585 Y126.562 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.328645
G1 F12599.531
M204 S6000
G3 X137.929 Y127.231 I-12.788 J7.01 E.01752
M204 S10000
G1 X137.959 Y127.226 F42000
; LINE_WIDTH: 0.246121
G1 F15000
M204 S6000
G2 X137.531 Y126.521 I-14.644 J8.412 E.01366
M204 S10000
G1 X137.511 Y126.524 F42000
; LINE_WIDTH: 0.157614
G1 F15000
M204 S6000
G1 X138.021 Y127.216 E.00803
; WIPE_START
G1 X137.511 Y126.524 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.833 Y128.282 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.455087
G1 F8734.323
M204 S6000
G3 X137.919 Y129.046 I-15.128 J2.083 E.02582
; LINE_WIDTH: 0.417627
G1 F9607.51
G1 X137.95 Y129.538 E.01506
M204 S10000
G1 X138.002 Y129.423 F42000
; LINE_WIDTH: 0.593129
G1 F6542.97
M204 S6000
G1 X137.87 Y128.74 E.0312
G1 X138.109 Y128.109 E.03022
M204 S10000
G1 X138.089 Y128.032 F42000
; LINE_WIDTH: 0.515629
G1 F7615.686
M204 S6000
G3 X137.747 Y129.14 I-22.132 J-6.227 E.04468
; WIPE_START
G1 X138.089 Y128.032 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.793 Y130.268 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.157318
G1 F15000
M204 S6000
G1 X137.185 Y130.877 E.00802
M204 S10000
G1 X137.204 Y130.883 F42000
; LINE_WIDTH: 0.246086
G1 F15000
M204 S6000
G2 X137.733 Y130.249 I-12.989 J-11.38 E.01367
M204 S10000
G1 X137.704 Y130.24 F42000
; LINE_WIDTH: 0.328571
G1 F12602.805
M204 S6000
G3 X137.263 Y130.851 I-12.482 J-8.545 E.01752
; WIPE_START
G1 X137.704 Y130.24 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.507 Y131.543 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.536315
G1 F7296.393
M204 S6000
G1 X136.153 Y131.33 E.01664
G1 X135.772 Y131.34 E.0153
G1 X135.397 Y131.273 E.01531
G1 X135.015 Y131.431 E.01664
; WIPE_START
G1 X135.397 Y131.273 E-.19792
G1 X135.772 Y131.34 E-.18212
G1 X136.153 Y131.33 E-.18201
G1 X136.507 Y131.543 E-.19795
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.371 Y130.634 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.328604
G1 F12601.355
M204 S6000
G3 X134.026 Y129.965 I12.879 J-7.06 E.01752
M204 S10000
G1 X133.996 Y129.97 F42000
; LINE_WIDTH: 0.246098
G1 F15000
M204 S6000
G2 X134.425 Y130.675 I14.448 J-8.294 E.01366
M204 S10000
G1 X134.444 Y130.671 F42000
; LINE_WIDTH: 0.157447
G1 F15000
M204 S6000
G1 X133.934 Y129.98 E.00802
; WIPE_START
G1 X134.444 Y130.671 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.148 Y128.872 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.515777
G1 F7613.304
M204 S6000
G3 X133.974 Y127.724 I23.16 J-4.088 E.04475
M204 S10000
G1 X133.943 Y127.798 F42000
; LINE_WIDTH: 0.605135
G1 F6403.249
M204 S6000
G1 X134.085 Y128.456 E.03086
G1 X133.846 Y129.086 E.03085
M204 S10000
G1 X133.866 Y129.164 F42000
; LINE_WIDTH: 0.515439
G1 F7618.743
M204 S6000
G3 X134.209 Y128.054 I22.644 J6.381 E.04473
; WIPE_START
G1 X133.866 Y129.164 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.164 Y126.927 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.157282
G1 F15000
M204 S6000
G1 X134.77 Y126.319 E.008
M204 S10000
G1 X134.752 Y126.312 F42000
; LINE_WIDTH: 0.246037
G1 F15000
M204 S6000
G2 X134.223 Y126.946 I11.956 J10.516 E.01366
M204 S10000
G1 X134.252 Y126.955 F42000
; LINE_WIDTH: 0.328539
G1 F12604.224
M204 S6000
G3 X134.692 Y126.345 I12.485 J8.55 E.01751
; WIPE_START
G1 X134.252 Y126.955 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.597 Y128.433 Z3.6 F42000
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.132239
G1 F15000
M204 S6000
G2 X136.13 Y128.715 I4.719 J-8.265 E.00439
M204 S10000
G1 X136.209 Y128.615 F42000
; LINE_WIDTH: 0.235696
G1 F15000
M204 S6000
G1 X135.843 Y128.585 E.00576
; LINE_WIDTH: 0.219543
G1 X135.757 Y128.51 E.00164
; LINE_WIDTH: 0.182424
G1 X135.671 Y128.436 E.0013
M204 S10000
G1 X135.683 Y128.44 F42000
; LINE_WIDTH: 0.11503
G1 F15000
M204 S6000
G3 X136.299 Y128.739 I-5.809 J12.733 E.00402
M204 S10000
G1 X136.251 Y128.748 F42000
; LINE_WIDTH: 0.156823
G1 F15000
M204 S6000
G1 X136.179 Y128.689 E.00086
; LINE_WIDTH: 0.184577
G1 X136.107 Y128.63 E.00107
; LINE_WIDTH: 0.223223
G1 X136.089 Y128.606 E.00044
G1 X136.103 Y128.596 E.00025
; LINE_WIDTH: 0.19387
G3 X136.347 Y128.477 I.565 J.849 E.00335
M204 S10000
G1 X136.372 Y128.495 F42000
; LINE_WIDTH: 0.134564
G1 F15000
M204 S6000
G3 X135.795 Y128.692 I-3.979 J-10.716 E.00455
M204 S10000
G1 X135.576 Y128.704 F42000
; LINE_WIDTH: 0.132378
G1 F15000
M204 S6000
G3 X136.145 Y128.505 I3.455 J8.922 E.00439
; WIPE_START
G1 X135.576 Y128.704 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.197 Y129.123 Z3.6 F42000
G1 X147.178 Y129.341 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.162 Y129.535 E.00646
G3 X146.746 Y129.594 I-.486 J-1.926 E.01398
G1 X146.672 Y129.579 E.00249
G1 X146.617 Y129.543 E.00219
G1 X146.579 Y129.492 E.0021
G1 X146.558 Y129.418 E.00255
G3 X146.801 Y129.223 I.19 J-.011 E.01207
G1 X147.12 Y129.323 E.01111
M204 S10000
G1 X147.816 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.799 Y130 E.03411
G3 X146.756 Y128.807 I-.051 J-.595 E.06423
G3 X146.899 Y128.828 I-.018 J.643 E.0048
G1 X147.959 Y129.158 E.03682
G3 X147.908 Y129.838 I-6.91 J-.178 E.02261
G1 X147.876 Y129.842 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.738 Y130.395 I-.596 J-2.53 E.01679
G3 X146.994 Y128.446 I.01 J-.989 E.10283
G1 X147.41 Y128.576 E.0134
G2 X145.388 Y119.38 I-19.602 J-.511 E.29219
G2 X145.806 Y118.229 I-4.668 J-2.344 E.03772
G1 X145.862 Y118.177 E.00235
G1 X145.97 Y118.378 E.007
G3 X144.198 Y140.376 I-17.935 J9.626 E.7167
G1 X144.151 Y140.317 E.00234
G2 X143.909 Y139.115 I-5.835 J.547 E.03772
G2 X147.271 Y130.385 I-16.161 J-11.236 E.29023
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.629758
G1 F6134.572
M204 S6000
G3 X144.226 Y139.522 I-20.05 J-2.162 E.48938
; WIPE_START
G1 X144.787 Y138.687 E-.38252
G1 X145.281 Y137.867 E-.3637
G1 X145.298 Y137.835 E-.01378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.43 Y130.506 Z3.6 F42000
G1 X147.888 Y128.931 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.629741
G1 F6134.753
M204 S6000
G2 X145.762 Y119.025 I-20.153 J-.856 E.48973
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.753
G1 X146.192 Y119.935 E-.38269
G1 X146.564 Y120.832 E-.36904
G1 X146.571 Y120.853 E-.00827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/76
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.6 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.327 J.956 E.01218
G1 X121.506 Y137.752 E.03681
G1 X123.976 Y137.937 E.07613
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.459 Y144.02 Z3.8 F42000
G1 X116.928 Y144.646 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01408
G2 X117.286 Y144.182 I-1.66 J-6.417 E.02473
G1 X117.393 Y144.355 E.00674
G1 X117.011 Y144.702 E.0171
G1 X116.978 Y144.68 E.0013
M204 S250
G1 X117.794 Y144.521 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46504
G2 X136.62 Y145.388 I-4.594 J-19.538 E.13933
G2 X137.772 Y145.806 I2.564 J-5.273 E.03772
G1 X137.824 Y145.862 E.00234
G3 X115.624 Y144.198 I-9.826 J-17.832 E.72374
G1 X115.683 Y144.151 E.00234
G2 X118.33 Y143.172 I-.462 J-5.318 E.08775
G1 X118.353 Y143.233 E.00199
G3 X118.091 Y144.251 I-.973 J.293 E.03396
G1 X117.838 Y144.48 E.01047
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.4536
G1 X119.568 Y145.48 E-.3064
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


G1 X117.606 Y144.328 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261426
G1 F15000
M204 S6000
G1 X118.08 Y143.695 E.01407
; LINE_WIDTH: 0.230779
G1 X118.203 Y143.522 E.00326
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.419227
G1 F9566.672
M204 S6000
G1 X117.891 Y143.899 E.01229
G3 X117.808 Y143.962 I-.707 J-.834 E.00321
; LINE_WIDTH: 0.486423
G1 F8117.199
G1 X117.695 Y144.04 E.00498
G1 X117.368 Y143.943 E.01231
M204 S10000
G1 X117.241 Y144.757 F42000
; LINE_WIDTH: 0.629996
G1 F6132.092
M204 S6000
G1 X118.147 Y145.286 E.05017
G2 X136.07 Y146.19 I9.857 J-17.296 E.89064
G1 X136.975 Y145.762 E.04791
; WIPE_START
G1 X136.07 Y146.19 E-.38055
G1 X135.168 Y146.564 E-.37117
G1 X135.147 Y146.571 E-.00827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.033 Y143.807 Z3.8 F42000
G1 X110.469 Y136.982 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.00212
G1 X110.501 Y136.906 E.00072
G1 X110.493 Y136.927 E.0006
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.28112
G1 X110.501 Y136.906 E-.26264
G1 X110.493 Y136.927 E-.21624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z3.8 F42000
G1 X112.003 Y116.506 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.566 E.00047
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.31869
G1 X111.998 Y116.583 E-.2664
G1 X111.999 Y116.566 E-.17491
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.713 Y111.506 Z3.8 F42000
G1 X119.545 Y109.884 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.623 Y109.847 E.00283
G1 X119.949 Y110.247 E.0171
G1 X119.817 Y110.402 E.00675
G2 X119.149 Y110.071 I-3.251 J5.736 E.02473
G1 X119.491 Y109.909 E.01256
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.795 I-1.263 J1.29 E.02411
G3 X120.699 Y111.556 I-.96 J.265 E.02421
G2 X118.23 Y110.194 I-3.72 J3.827 E.08769
G1 X118.179 Y110.137 E.00237
G3 X128.164 Y107.616 I9.78 J17.706 E.31996
G3 X140.376 Y111.802 I-.168 J20.401 E.40361
G1 X140.317 Y111.849 E.00234
G2 X139.115 Y112.091 I.421 J5.205 E.03774
G2 X121.501 Y109.71 I-11.122 J15.942 E.56723
G1 X120.426 Y110.121 E.03537
M204 S10000
G1 X120.15 Y110.313 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247531
G1 F15000
M204 S6000
G3 X120.626 Y111.182 I-32.506 J18.414 E.01652
M204 S10000
G1 X120.636 Y111.077 F42000
; LINE_WIDTH: 0.419164
G1 F9568.265
M204 S6000
G1 X120.374 Y110.773 E.01233
G2 X120.301 Y110.697 I-.826 J.721 E.00321
; LINE_WIDTH: 0.48639
G1 F8117.807
G1 X120.2 Y110.603 E.00499
G1 X119.863 Y110.651 E.01232
M204 S10000
G1 X119.859 Y109.827 F42000
; LINE_WIDTH: 0.629998
G1 F6132.073
M204 S6000
G1 X120.833 Y109.438 E.05016
G3 X139.522 Y111.774 I7.166 J18.599 E.93846
; WIPE_START
G1 X138.691 Y111.216 E-.38053
G1 X137.855 Y110.712 E-.37118
G1 X137.835 Y110.701 E-.00829
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.177 Y114.432 Z3.8 F42000
G1 X125.562 Y117.579 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-4.997 J-2.115 E.01218
G1 X124.006 Y117.081 E.06249
G1 X125.59 Y117.2 E.04882
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z3.8 F42000
G1 X130.272 Y132.592 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z3.8 F42000
G1 X130.931 Y123.798 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z3.8 F42000
G1 X130.512 Y131.808 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
M73 P65 R10
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.106 Y121.424 E.02447
G1 X131.29 Y121.437 E.00565
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F6123.087
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.963
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z3.8 F42000
G1 X132.116 Y133.122 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F9608.963
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.803 Y130.296 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X136.742 Y130.42 E.00428
G3 X135.755 Y128.892 I-.861 J-.527 E.1253
G1 X135.855 Y128.884 E.00309
G3 X136.829 Y130.24 I.025 J1.009 E.06035
G1 X136.828 Y130.241 E.00005
; WIPE_START
M204 S6000
G1 X136.742 Y130.42 E-.07569
G1 X136.621 Y130.581 E-.07642
G1 X136.47 Y130.714 E-.07643
G1 X136.296 Y130.815 E-.07643
G1 X136.105 Y130.879 E-.07643
G1 X135.906 Y130.904 E-.0765
G1 X135.705 Y130.889 E-.07642
G1 X135.511 Y130.835 E-.07647
G1 X135.25 Y130.684 E-.11448
G1 X135.185 Y130.62 E-.03474
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.07 Y127.229 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.07 Y127.201 E.00086
G3 X135.949 Y126.299 I1.005 J.1 E.04179
G1 X136.05 Y126.292 E.00309
G3 X135.07 Y127.402 I.025 J1.009 E.14385
G1 X135.07 Y127.289 E.00347
; WIPE_START
M204 S6000
G1 X135.07 Y127.201 E-.03349
G1 X135.109 Y127.004 E-.0764
G1 X135.188 Y126.818 E-.07643
G1 X135.301 Y126.652 E-.07644
G1 X135.482 Y126.483 E-.09433
G1 X135.57 Y126.427 E-.03946
G1 X135.753 Y126.344 E-.07643
G1 X135.949 Y126.299 E-.07654
G1 X136.05 Y126.292 E-.03823
G1 X136.25 Y126.307 E-.07641
G1 X136.444 Y126.361 E-.07641
G1 X136.489 Y126.384 E-.01944
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.291 Y125.487 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X135.423 Y125.455 E.00418
G3 X136.057 Y125.409 I.545 J3.142 E.01956
G1 X136.198 Y125.416 E.00435
G3 X135.113 Y125.525 I-.23 J3.181 E.58207
G1 X135.232 Y125.499 E.00375
; WIPE_START
M204 S6000
G1 X135.423 Y125.455 E-.07451
G1 X135.739 Y125.417 E-.12096
G1 X136.057 Y125.409 E-.12078
G1 X136.198 Y125.416 E-.05378
G1 X136.687 Y125.488 E-.18781
G1 X136.993 Y125.574 E-.12072
G1 X137.193 Y125.652 E-.08144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.89 Y127.958 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X136.617 Y125.685 E.09877
G1 X136.604 Y126.206
G1 X136.015 Y125.616 E.02563
G1 X135.517 Y125.652
G1 X135.956 Y126.091 E.01906
G1 X135.54 Y126.208
G1 X135.085 Y125.753 E.01979
G1 X134.702 Y125.903
G1 X135.226 Y126.428 E.0228
G1 X134.998 Y126.733
G1 X134.359 Y126.093 E.02781
G1 X134.053 Y126.321
G1 X134.869 Y127.137 E.03548
G1 X134.941 Y127.742
G1 X133.78 Y126.582 E.05041
G1 X133.543 Y126.877
G1 X135.43 Y128.764 E.08201
G1 X135.096 Y128.964
G1 X133.34 Y127.207 E.07632
G1 X133.176 Y127.576
G1 X134.848 Y129.249 E.07268
G1 X134.693 Y129.627
G1 X133.058 Y127.992 E.07107
G1 X132.998 Y128.466
G1 X134.693 Y130.16 E.07364
; WIPE_START
M204 S6000
G1 X133.279 Y128.746 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.169 Y126.771 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X138.959 Y128.561 E.07778
G1 X138.924 Y129.059
G1 X137.287 Y127.421 E.07115
G1 X137.168 Y127.836
G1 X138.823 Y129.491 E.07193
G1 X138.673 Y129.874
G1 X136.948 Y128.149 E.07496
G1 X136.643 Y128.378
G1 X138.482 Y130.216 E.07989
G1 X138.255 Y130.523
G1 X136.251 Y128.519 E.08709
; WIPE_START
M204 S6000
G1 X137.665 Y129.933 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.099 Y129.9 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X137.994 Y130.795 E.03889
G1 X137.699 Y131.033
G1 X137.011 Y130.345 E.0299
G1 X136.811 Y130.678
G1 X137.368 Y131.236 E.02423
G1 X136.998 Y131.399
G1 X136.525 Y130.926 E.02057
G1 X136.148 Y131.082
G1 X136.583 Y131.517 E.01891
G1 X136.109 Y131.577
G1 X135.614 Y131.081 E.02154
G1 X135.548 Y131.548
G1 X133.027 Y129.027 E.10955
G1 X133.235 Y129.769
G1 X134.805 Y131.339 E.06824
; WIPE_START
M204 S6000
G1 X133.391 Y129.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.232 Y126.708 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.195204
G1 F15000
M204 S6000
G1 X137.046 Y126.482 E.00364
G1 X136.833 Y126.277 E.00367
; LINE_WIDTH: 0.175641
G1 X136.828 Y126.217 E.00064
; LINE_WIDTH: 0.133133
G1 X136.823 Y126.158 E.00044
; WIPE_START
G1 X136.828 Y126.217 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.77 Y127.542 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.139158
G1 F15000
M204 S6000
G1 X138.695 Y127.434 E.00104
; LINE_WIDTH: 0.166058
G1 X138.62 Y127.325 E.00133
; LINE_WIDTH: 0.202335
G1 X138.533 Y127.206 E.00191
; LINE_WIDTH: 0.244208
G1 X138.445 Y127.09 E.00239
; LINE_WIDTH: 0.278529
G1 X138.354 Y126.978 E.00278
; LINE_WIDTH: 0.328611
G1 F12601.03
G2 X137.653 Y126.268 I-4.486 J3.729 E.02326
; LINE_WIDTH: 0.29297
G1 F14397.129
G1 X137.542 Y126.176 E.00293
; LINE_WIDTH: 0.262356
G1 F15000
G1 X137.428 Y126.086 E.0026
; LINE_WIDTH: 0.224222
G1 X137.31 Y125.998 E.00217
; LINE_WIDTH: 0.178442
G1 X137.189 Y125.913 E.00164
; LINE_WIDTH: 0.139189
G1 X137.127 Y125.871 E.00059
; LINE_WIDTH: 0.10392
G1 X137.031 Y125.807 E.00057
M204 S10000
G1 X136.48 Y125.661 F42000
; LINE_WIDTH: 0.107804
G1 F15000
M204 S6000
G2 X136.39 Y125.667 I-.037 J.125 E.00049
G1 X136.415 Y125.75 E.00046
M204 S10000
G1 X136.148 Y126.017 F42000
; LINE_WIDTH: 0.126167
G1 F15000
M204 S6000
G1 X135.941 Y126.106 E.00153
M204 S10000
G1 X136.206 Y126.096 F42000
; LINE_WIDTH: 0.100223
G1 F15000
M204 S6000
G2 X136.031 Y126.015 I-1.564 J3.148 E.0009
M204 S10000
G1 X135.495 Y125.652 F42000
; LINE_WIDTH: 0.0930479
G1 F15000
M204 S6000
G1 X135.333 Y125.734 E.00074
; WIPE_START
G1 X135.495 Y125.652 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.974 Y126.784 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0956956
G1 F15000
M204 S6000
G2 X134.896 Y126.897 I2.048 J1.483 E.00059
; WIPE_START
G1 X134.974 Y126.784 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.544 Y128.745 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.178267
G1 F15000
M204 S6000
G1 X135.589 Y128.688 E.00079
; LINE_WIDTH: 0.225742
G1 X135.633 Y128.632 E.00107
; LINE_WIDTH: 0.277906
G1 X135.678 Y128.575 E.00138
G1 X135.645 Y128.549 E.0008
; LINE_WIDTH: 0.258438
G1 X135.569 Y128.496 E.00162
; LINE_WIDTH: 0.223799
G1 X135.487 Y128.439 E.00148
; LINE_WIDTH: 0.189545
G1 X135.386 Y128.362 E.00152
; LINE_WIDTH: 0.154975
G1 X135.2 Y128.195 E.00228
G1 X135.031 Y128.01 E.00229
; LINE_WIDTH: 0.194613
G1 X134.878 Y127.805 E.00316
; WIPE_START
G1 X135.031 Y128.01 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.136 Y128.634 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0943621
G1 F15000
M204 S6000
G1 X135.405 Y128.472 E.00314
; WIPE_START
G1 X136.136 Y128.634 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.87 Y130.576 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0994934
G1 F15000
M204 S6000
G1 X134.797 Y130.482 E.00055
; LINE_WIDTH: 0.144279
G3 X134.623 Y130.23 I4.912 J-3.561 E.00253
; WIPE_START
G1 X134.797 Y130.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.378 Y131.038 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.132881
G1 F15000
M204 S6000
G1 X135.314 Y130.994 E.00057
; LINE_WIDTH: 0.103686
G1 X135.202 Y130.908 E.0007
; WIPE_START
G1 X135.314 Y130.994 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.764 Y131.432 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.0920205
G1 F15000
M204 S6000
G1 X136.608 Y131.515 E.00071
; WIPE_START
G1 X136.764 Y131.432 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.066 Y129.621 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.173126
G1 F15000
M204 S6000
G1 X137.139 Y129.766 E.00172
G1 X137.086 Y129.913 E.00165
; WIPE_START
G1 X137.139 Y129.766 E-.3718
G1 X137.066 Y129.621 E-.3882
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.646 Y129.928 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.101313
G1 F15000
M204 S6000
G1 X138.588 Y130.007 E.00047
G1 X138.597 Y130.062 E.00026
; WIPE_START
G1 X138.588 Y130.007 E-.27449
G1 X138.646 Y129.928 E-.48551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.26 Y129.404 Z3.8 F42000
G1 X147.178 Y129.341 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.162 Y129.535 E.00646
G3 X146.746 Y129.594 I-.497 J-1.997 E.01396
G1 X146.672 Y129.579 E.00251
G1 X146.617 Y129.543 E.00219
G1 X146.579 Y129.492 E.00212
G1 X146.558 Y129.418 E.00255
G3 X146.8 Y129.223 I.19 J-.011 E.01203
G1 X147.12 Y129.323 E.01112
M204 S10000
G1 X147.816 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.8 Y130 E.03409
G3 X146.756 Y128.807 I-.052 J-.595 E.06425
G3 X146.899 Y128.827 I-.018 J.643 E.00479
G1 X147.959 Y129.158 E.03684
G3 X147.908 Y129.838 I-6.911 J-.178 E.02261
G1 X147.876 Y129.842 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.739 Y130.395 I-.597 J-2.536 E.01677
G3 X146.993 Y128.446 I.01 J-.989 E.10283
G1 X147.41 Y128.576 E.01342
G2 X145.388 Y119.38 I-19.679 J-.494 E.29217
G2 X145.806 Y118.23 I-5.274 J-2.564 E.03766
G1 X145.863 Y118.179 E.00237
G1 X146.038 Y118.506 E.0114
M73 P65 R9
G3 X144.199 Y140.375 I-18.005 J9.498 E.71221
G1 X144.151 Y140.316 E.00235
G2 X143.909 Y139.115 I-5.835 J.548 E.03769
G2 X147.271 Y130.385 I-16.184 J-11.245 E.29023
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.62976
G1 F6134.556
M204 S6000
G3 X144.226 Y139.522 I-20.05 J-2.162 E.48939
; WIPE_START
G1 X144.787 Y138.687 E-.38253
G1 X145.281 Y137.867 E-.3637
G1 X145.298 Y137.835 E-.01378
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.43 Y130.506 Z3.8 F42000
G1 X147.888 Y128.931 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.629739
G1 F6134.77
M204 S6000
G2 X145.762 Y119.025 I-20.153 J-.856 E.48972
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.77
G1 X146.192 Y119.935 E-.38268
G1 X146.564 Y120.832 E-.36905
G1 X146.571 Y120.853 E-.00827
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/76
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z3.8 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.34 J.959 E.01219
G1 X122.004 Y137.789 E.05216
G1 X123.976 Y137.937 E.06078
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.46 Y144.02 Z4 F42000
G1 X116.929 Y144.647 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X116.576 Y144.409 E.01411
G2 X117.286 Y144.182 I-1.649 J-6.382 E.02474
G1 X117.393 Y144.355 E.00674
G1 X117.011 Y144.702 E.01712
G1 X116.979 Y144.68 E.00129
M204 S250
G1 X117.794 Y144.521 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46503
G2 X136.62 Y145.388 I-4.594 J-19.538 E.13933
G2 X137.771 Y145.806 I2.563 J-5.271 E.03768
G1 X137.822 Y145.863 E.00236
G3 X115.624 Y144.198 I-9.824 J-17.832 E.72369
G1 X115.683 Y144.151 E.00234
G2 X118.33 Y143.172 I-.461 J-5.317 E.08775
G1 X118.353 Y143.233 E.00199
G3 X118.091 Y144.251 I-.973 J.293 E.03394
G1 X117.838 Y144.48 E.01049
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.45357
G1 X119.568 Y145.48 E-.30643
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


G1 X117.606 Y144.327 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.261581
G1 F15000
M204 S6000
G1 X118.079 Y143.696 E.01406
; LINE_WIDTH: 0.231002
G1 X118.203 Y143.522 E.00327
M204 S10000
G1 X118.195 Y143.638 F42000
; LINE_WIDTH: 0.419242
G1 F9566.286
M204 S6000
G1 X117.891 Y143.899 E.01228
G3 X117.809 Y143.962 I-.704 J-.83 E.00319
; LINE_WIDTH: 0.488487
G1 F8079.598
G1 X117.695 Y144.04 E.00501
G1 X117.368 Y143.941 E.01242
M204 S10000
G1 X117.242 Y144.757 F42000
; LINE_WIDTH: 0.629997
G1 F6132.075
M204 S6000
G1 X118.147 Y145.286 E.05015
G2 X136.975 Y145.762 I9.859 J-17.345 E.93838
; WIPE_START
G1 X136.07 Y146.19 E-.38054
G1 X135.191 Y146.555 E-.36173
G1 X135.147 Y146.571 E-.01773
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.033 Y143.806 Z4 F42000
G1 X110.469 Y136.982 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.00212
G1 X110.501 Y136.906 E.00072
G1 X110.493 Y136.927 E.0006
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.28109
G1 X110.501 Y136.906 E-.26171
G1 X110.493 Y136.927 E-.2172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z4 F42000
G1 X112.003 Y116.506 Z4
G1 Z3.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.566 E.00048
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.3185
G1 X111.998 Y116.583 E-.26548
G1 X111.999 Y116.566 E-.17602
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.713 Y111.506 Z4 F42000
G1 X119.546 Y109.883 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X119.623 Y109.847 E.00282
G1 X119.949 Y110.247 E.01712
G1 X119.818 Y110.402 E.00674
G2 X119.149 Y110.071 I-3.257 J5.749 E.02475
G1 X119.492 Y109.909 E.01258
M204 S250
G1 X120.37 Y110.143 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.794 I-1.264 J1.291 E.02411
G3 X120.699 Y111.556 I-.96 J.265 E.02422
G2 X118.229 Y110.194 I-3.72 J3.826 E.08771
G1 X118.178 Y110.137 E.00236
G3 X128.309 Y107.617 I9.821 J17.853 E.3244
G3 X140.374 Y111.8 I-.28 J20.297 E.39917
G1 X140.315 Y111.85 E.00237
G2 X139.115 Y112.091 I.611 J6.142 E.03765
G2 X121.501 Y109.71 I-11.121 J15.932 E.56725
G1 X120.426 Y110.121 E.03537
M204 S10000
G1 X120.149 Y110.314 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.247662
G1 F15000
M204 S6000
G3 X120.627 Y111.181 I-34.98 J19.829 E.01651
M204 S10000
G1 X120.636 Y111.076 F42000
; LINE_WIDTH: 0.419278
G1 F9565.36
M204 S6000
G1 X120.374 Y110.772 E.01232
G2 X120.302 Y110.697 I-.823 J.718 E.00319
; LINE_WIDTH: 0.488152
G1 F8085.681
G1 X120.201 Y110.603 E.00499
G1 X119.862 Y110.652 E.0124
M204 S10000
G1 X119.859 Y109.826 F42000
; LINE_WIDTH: 0.629996
G1 F6132.088
M204 S6000
G1 X120.833 Y109.438 E.05015
G3 X139.524 Y111.775 I7.166 J18.599 E.93853
; WIPE_START
G1 X138.691 Y111.216 E-.38103
G1 X137.855 Y110.712 E-.37118
G1 X137.836 Y110.702 E-.00778
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.178 Y114.432 Z4 F42000
G1 X125.562 Y117.579 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.002 J-2.117 E.01218
G1 X123.607 Y117.051 E.05021
G1 X125.59 Y117.2 E.0611
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z4 F42000
G1 X130.272 Y132.592 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z4 F42000
G1 X130.931 Y123.798 Z4
G1 Z3.6
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z4 F42000
G1 X130.512 Y131.808 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.019 Y121.417 E.02178
G1 X131.29 Y121.437 E.00834
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F6123.087
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z4 F42000
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.949
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z4 F42000
G1 X132.116 Y133.122 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.963
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.23 Y126.154 Z4 F42000
G1 X135.363 Y125.856 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X135.628 Y125.81 E.00829
G3 X135.908 Y125.789 I.349 J2.788 E.0086
G1 X136.048 Y125.789 E.00431
G3 X135.304 Y125.87 I-.07 J2.809 E.5194
; WIPE_START
M204 S6000
G1 X135.628 Y125.81 E-.12523
M73 P66 R9
G1 X135.908 Y125.789 E-.10636
G1 X136.048 Y125.789 E-.05327
G1 X136.327 Y125.81 E-.10653
G1 X136.603 Y125.858 E-.10636
G1 X136.873 Y125.934 E-.10643
G1 X137.133 Y126.036 E-.1065
G1 X137.249 Y126.096 E-.04932
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.852 Y131.174 Z4 F42000
G1 Z3.6
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X137.704 Y131.271 E.00543
G3 X136.057 Y125.409 I-1.738 J-2.674 E.36711
G1 X136.195 Y125.416 E.00423
G3 X137.961 Y131.086 I-.228 J3.181 E.23466
G1 X137.899 Y131.136 E.00248
; WIPE_START
M204 S6000
G1 X137.704 Y131.271 E-.08987
G1 X137.433 Y131.436 E-.12074
G1 X137.143 Y131.567 E-.1208
G1 X136.842 Y131.669 E-.12091
G1 X136.532 Y131.739 E-.12083
G1 X136.216 Y131.779 E-.12087
G1 X136.042 Y131.783 E-.06597
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.498 Y130.148 Z4 F42000
G1 X147.178 Y129.341 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.163 Y129.535 E.00647
G3 X146.747 Y129.594 I-.493 J-1.97 E.01397
G1 X146.672 Y129.579 E.00252
G1 X146.617 Y129.542 E.00221
G1 X146.581 Y129.497 E.00191
G1 X146.558 Y129.417 E.00274
G3 X146.8 Y129.223 I.19 J-.01 E.012
G1 X147.121 Y129.323 E.01114
M204 S10000
G1 X147.816 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.8 Y130 E.03408
G3 X146.756 Y128.807 I-.052 J-.595 E.06425
G3 X146.898 Y128.827 I-.018 J.641 E.00477
G1 X147.959 Y129.158 E.03685
G3 X147.908 Y129.838 I-6.914 J-.178 E.02263
G1 X147.876 Y129.842 E.00107
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.739 Y130.395 I-.598 J-2.544 E.01675
G3 X146.993 Y128.446 I.009 J-.989 E.10283
G1 X147.41 Y128.576 E.01344
G2 X145.388 Y119.38 I-19.679 J-.494 E.29216
G2 X145.806 Y118.229 I-5.272 J-2.563 E.03768
G1 X145.863 Y118.178 E.00236
G1 X146.107 Y118.633 E.01588
G3 X144.198 Y140.376 I-18.078 J9.368 E.70781
G1 X144.151 Y140.317 E.00234
G2 X143.909 Y139.115 I-5.834 J.547 E.03772
G2 X147.271 Y130.385 I-16.161 J-11.236 E.29024
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.629758
G1 F6134.58
M204 S6000
G3 X144.226 Y139.522 I-20.05 J-2.162 E.48939
; WIPE_START
G1 X144.787 Y138.687 E-.38252
G1 X145.281 Y137.867 E-.3637
G1 X145.298 Y137.835 E-.01379
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.429 Y130.506 Z4 F42000
G1 X147.888 Y128.93 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.629741
G1 F6134.753
M204 S6000
G2 X145.762 Y119.025 I-20.153 J-.856 E.4897
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6134.753
G1 X146.192 Y119.935 E-.38269
G1 X146.559 Y120.819 E-.36355
G1 X146.571 Y120.853 E-.01376
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/76
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S198.9
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4 I-.735 J-.97 P1  F42000
G1 X124.036 Y137.942 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.11131
G2 X120.311 Y137.662 I-5.358 J.963 E.01219
G1 X122.502 Y137.827 E.06751
G1 X123.976 Y137.937 E.04543
; WIPE_START
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.904 Y144.37 Z4.2 F42000
G1 X117.794 Y144.521 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3000
M204 S5000
G2 X132.36 Y146.914 I10.229 J-16.732 E.46504
G2 X136.62 Y145.388 I-4.594 J-19.538 E.13933
G2 X137.77 Y145.805 I2.557 J-5.257 E.03765
G1 X137.821 Y145.863 E.00238
G3 X115.626 Y144.2 I-9.824 J-17.833 E.72359
G1 X115.685 Y144.151 E.00236
G2 X118.33 Y143.172 I-.463 J-5.315 E.0877
G1 X118.353 Y143.233 E.00199
G3 X118.091 Y144.251 I-.973 J.293 E.03394
G1 X117.838 Y144.48 E.01049
; WIPE_START
M204 S6000
G1 X118.848 Y145.117 E-.45355
G1 X119.568 Y145.48 E-.30645
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


G1 X136.393 Y145.725 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X136.817 Y146.149 E.01842
G1 X136.455 Y146.32
G1 X136.031 Y145.896 E.01842
G1 X135.657 Y146.056
G1 X136.089 Y146.488 E.01878
G1 X135.712 Y146.644
G1 X135.281 Y146.212 E.01876
G1 X134.896 Y146.361
G1 X135.335 Y146.8 E.01909
G1 X134.945 Y146.944
G1 X134.504 Y146.503 E.01917
G1 X134.108 Y146.64
G1 X134.553 Y147.084 E.01932
G1 X134.153 Y147.218
G1 X133.7 Y146.765 E.01966
G1 X133.292 Y146.89
G1 X133.744 Y147.342 E.01965
G1 X133.333 Y147.464
G1 X132.867 Y146.998 E.02023
G1 X132.442 Y147.107
G1 X132.906 Y147.571 E.02015
G1 X132.48 Y147.678
G1 X132.002 Y147.199 E.02078
G1 X131.559 Y147.29
G1 X132.037 Y147.769 E.02078
G1 X131.593 Y147.857
G1 X131.101 Y147.365 E.02136
G1 X130.64 Y147.437
G1 X131.135 Y147.932 E.02151
G1 X130.67 Y148.001
G1 X130.162 Y147.493 E.02209
G1 X129.68 Y147.544
G1 X130.194 Y148.058 E.02233
G1 X129.708 Y148.106
G1 X129.179 Y147.576 E.02299
G1 X128.675 Y147.605
G1 X129.211 Y148.141 E.02329
G1 X128.702 Y148.166
G1 X128.147 Y147.611 E.0241
G1 X127.614 Y147.611
G1 X128.179 Y148.177 E.02458
G1 X127.646 Y148.176
G1 X127.06 Y147.591 E.02544
G1 X126.49 Y147.554
G1 X127.092 Y148.156 E.02616
G1 X126.531 Y148.128
G1 X125.908 Y147.505 E.02707
G1 X125.295 Y147.425
G1 X125.941 Y148.071 E.02809
G1 X125.339 Y148.003
G1 X124.663 Y147.327 E.02938
G1 X124.01 Y147.207
G1 X124.712 Y147.909 E.0305
G1 X124.057 Y147.787
G1 X123.316 Y147.046 E.03221
G1 X122.587 Y146.85
G1 X123.38 Y147.643 E.03445
G1 X122.666 Y147.463
G1 X121.814 Y146.611 E.03702
G1 X120.985 Y146.315
G1 X121.905 Y147.235 E.03999
G1 X121.095 Y146.958
G1 X120.078 Y145.941 E.04422
G1 X119.06 Y145.456
G1 X120.22 Y146.616 E.0504
G1 X119.252 Y146.181
G1 X117.875 Y144.805 E.05982
G1 X117.82 Y144.217
G1 X117.497 Y143.893 E.01406
G1 X117.119 Y144.049
G1 X117.541 Y144.47 E.01831
G1 X116.714 Y144.177
G1 X118.148 Y145.611 E.06229
; WIPE_START
M204 S6000
G1 X116.733 Y144.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.599 Y144.189 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.189085
G1 F15000
M204 S6000
G1 X116.561 Y144.238 E.00073
; LINE_WIDTH: 0.234888
G1 X116.522 Y144.286 E.00096
; LINE_WIDTH: 0.280691
G1 X116.484 Y144.334 E.00119
; LINE_WIDTH: 0.332904
G1 F12414.486
G1 X116.445 Y144.382 E.00146
G1 X116.478 Y144.413 E.00107
; LINE_WIDTH: 0.312098
G1 F13374.081
G1 X116.652 Y144.557 E.00495
; LINE_WIDTH: 0.268475
G1 F15000
G1 X116.827 Y144.7 E.00415
; LINE_WIDTH: 0.224853
G1 X117.001 Y144.844 E.00335
; LINE_WIDTH: 0.18123
G1 X117.175 Y144.987 E.00255
; LINE_WIDTH: 0.141594
G1 X117.3 Y145.085 E.00127
; LINE_WIDTH: 0.105978
G1 X117.425 Y145.183 E.00081
M204 S10000
G1 X117.765 Y144.916 F42000
; LINE_WIDTH: 0.0937264
G1 F15000
M204 S6000
G1 X117.475 Y144.656 E.00161
; WIPE_START
G1 X117.765 Y144.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.998 Y145.517 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.19917
G1 F15000
M204 S6000
G1 X118.867 Y145.423 E.00206
; LINE_WIDTH: 0.161711
G1 X118.734 Y145.327 E.00159
; LINE_WIDTH: 0.129063
G1 X118.645 Y145.259 E.00079
; LINE_WIDTH: 0.101801
G1 X118.555 Y145.191 E.00054
M204 S10000
G1 X118.664 Y145.888 F42000
; LINE_WIDTH: 0.110212
G1 F15000
M204 S6000
G1 X118.512 Y145.775 E.00104
; LINE_WIDTH: 0.154295
G1 X118.361 Y145.662 E.00172
; LINE_WIDTH: 0.198379
G1 X118.209 Y145.549 E.00239
; WIPE_START
G1 X118.361 Y145.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.633 Y146.789 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.108544
G1 F15000
M204 S6000
G1 X120.516 Y146.711 E.00075
; LINE_WIDTH: 0.149304
G1 X120.399 Y146.632 E.00122
; LINE_WIDTH: 0.190065
G1 X120.282 Y146.554 E.00169
; WIPE_START
G1 X120.399 Y146.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.008 Y147.232 Z4.2 F42000
G1 X130.617 Y147.438 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.108155
G1 F15000
M204 S6000
G1 X130.455 Y147.519 E.00097
; WIPE_START
G1 X130.617 Y147.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.534 Y147.293 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.101763
G1 F15000
M204 S6000
G1 X131.378 Y147.376 E.00085
; WIPE_START
G1 X131.534 Y147.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.163 Y146.006 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.208764
G1 F15000
M204 S6000
G1 X136.841 Y145.79 E.00524
; LINE_WIDTH: 0.18316
G1 X136.713 Y145.702 E.00178
; LINE_WIDTH: 0.133419
G1 X136.585 Y145.614 E.00115
; WIPE_START
G1 X136.713 Y145.702 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.47 Y143.295 Z4.2 F42000
G1 X110.469 Y136.982 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F3000
M204 S5000
G1 X110.475 Y136.905 E.00212
G1 X110.501 Y136.906 E.00072
G1 X110.492 Y136.927 E.0006
; WIPE_START
M204 S6000
G1 X110.475 Y136.905 E-.2812
G1 X110.501 Y136.906 E-.26094
G1 X110.492 Y136.927 E-.21786
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z4.2 F42000
G1 X112.003 Y116.506 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.565 E.00048
; WIPE_START
M204 S6000
G1 X112.024 Y116.585 E-.31835
G1 X111.998 Y116.583 E-.26453
G1 X111.999 Y116.565 E-.17713
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.055 Y111.919 Z4.2 F42000
G1 X120.37 Y110.143 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X120.796 Y110.794 I-1.264 J1.29 E.02409
G3 X120.699 Y111.556 I-.96 J.265 E.02423
G2 X118.23 Y110.194 I-3.719 J3.825 E.0877
G1 X118.178 Y110.137 E.00236
G3 X128.454 Y107.617 I9.819 J17.823 E.32887
G3 X140.374 Y111.8 I-.439 J20.324 E.39472
G1 X140.315 Y111.85 E.00237
G2 X139.115 Y112.091 I.57 J5.938 E.03765
G2 X121.501 Y109.71 I-11.121 J15.931 E.56725
G1 X120.426 Y110.121 E.03536
; WIPE_START
M204 S6000
G1 X120.681 Y110.535 E-.18462
G1 X120.796 Y110.794 E-.10766
G1 X120.83 Y110.984 E-.07328
G1 X120.826 Y111.177 E-.07334
G1 X120.785 Y111.367 E-.07403
G1 X120.699 Y111.556 E-.07873
G1 X120.363 Y111.268 E-.16834
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.992 Y111.491 Z4.2 F42000
G1 X139.285 Y111.823 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
G1 F3000
M204 S2000
G1 X137.852 Y110.389 E.06229
G1 X136.748 Y109.819
G1 X138.146 Y111.216 E.06075
; WIPE_START
M204 S6000
G1 X136.748 Y109.819 E-.75128
G1 X136.768 Y109.829 E-.00872
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X136.929 Y110.533 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3000
M204 S2000
G1 X135.78 Y109.384 E.04991
G1 X134.905 Y109.042
G1 X135.918 Y110.055 E.04403
G1 X135.012 Y109.683
G1 X134.095 Y108.765 E.03988
G1 X133.333 Y108.537
G1 X134.181 Y109.385 E.03685
G1 X133.406 Y109.143
G1 X132.62 Y108.357 E.03414
G1 X131.942 Y108.213
G1 X132.683 Y108.953 E.03218
G1 X131.996 Y108.799
G1 X131.288 Y108.091 E.03078
G1 X130.66 Y107.997
G1 X131.336 Y108.673 E.02937
G1 X130.7 Y108.57
G1 X130.059 Y107.929 E.02784
G1 X129.469 Y107.872
G1 X130.097 Y108.5 E.0273
G1 X129.508 Y108.445
G1 X128.907 Y107.844 E.02612
G1 X128.354 Y107.824
G1 X128.938 Y108.408 E.02536
G1 X128.389 Y108.392
G1 X127.821 Y107.823 E.0247
G1 X127.298 Y107.834
G1 X127.847 Y108.384 E.02388
G1 X127.33 Y108.399
G1 X126.789 Y107.859 E.0235
G1 X126.292 Y107.894
G1 X126.818 Y108.421 E.02286
G1 X126.323 Y108.459
G1 X125.806 Y107.942 E.02248
G1 X125.33 Y107.999
G1 X125.836 Y108.505 E.022
G1 X125.363 Y108.565
G1 X124.865 Y108.068 E.02163
G1 X124.407 Y108.143
G1 X124.897 Y108.633 E.02128
G1 X124.444 Y108.713
G1 X123.962 Y108.231 E.02091
G1 X123.52 Y108.322
G1 X123.996 Y108.798 E.02069
G1 X123.561 Y108.897
G1 X123.094 Y108.429 E.02031
G1 X122.667 Y108.536
G1 X123.13 Y108.999 E.02011
G1 X122.712 Y109.114
G1 X122.256 Y108.658 E.01982
G1 X121.847 Y108.782
G1 X122.296 Y109.231 E.01949
G1 X121.894 Y109.363
G1 X121.447 Y108.916 E.01943
G1 X121.054 Y109.056
G1 X121.493 Y109.495 E.01905
G1 X121.105 Y109.64
G1 X120.665 Y109.2 E.01913
G1 X120.288 Y109.356
G1 X120.719 Y109.787 E.01875
G1 X120.333 Y109.935
G1 X119.911 Y109.512 E.01837
G1 X119.545 Y109.68
G1 X120.492 Y110.627 E.04116
G1 X120.194 Y110.862
G1 X119.183 Y109.851 E.04392
; WIPE_START
M204 S6000
G1 X120.194 Y110.862 E-.54312
G1 X120.492 Y110.627 E-.1443
G1 X120.357 Y110.492 E-.07258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.975 Y110.956 Z4.2 F42000
G1 X138.782 Y111.615 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100876
G1 F15000
M204 S6000
G1 X138.672 Y111.524 E.00067
; LINE_WIDTH: 0.126495
G1 X138.56 Y111.432 E.00099
; LINE_WIDTH: 0.161002
G1 X138.383 Y111.294 E.00216
; LINE_WIDTH: 0.204015
G1 X138.207 Y111.156 E.00294
; WIPE_START
G1 X138.383 Y111.294 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.401 Y111.811 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.189164
G1 F15000
M204 S6000
G1 X139.439 Y111.762 E.00073
; LINE_WIDTH: 0.234956
G1 X139.477 Y111.714 E.00096
; LINE_WIDTH: 0.280747
G1 X139.516 Y111.666 E.00119
; LINE_WIDTH: 0.332939
G1 F12413.003
G1 X139.554 Y111.618 E.00146
G1 X139.522 Y111.586 E.00107
; LINE_WIDTH: 0.312131
G1 F13372.404
G1 X139.347 Y111.443 E.00495
; LINE_WIDTH: 0.26852
G1 F15000
G1 X139.173 Y111.299 E.00415
; LINE_WIDTH: 0.224909
G1 X138.999 Y111.156 E.00335
; LINE_WIDTH: 0.181297
G1 X138.824 Y111.012 E.00255
; LINE_WIDTH: 0.141645
G1 X138.7 Y110.915 E.00128
; LINE_WIDTH: 0.105995
G1 X138.575 Y110.817 E.00082
; WIPE_START
G1 X138.7 Y110.915 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.448 Y110.813 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.110253
G1 F15000
M204 S6000
G1 X137.295 Y110.699 E.00105
; LINE_WIDTH: 0.15442
G1 X137.143 Y110.585 E.00173
; LINE_WIDTH: 0.198587
G1 X136.99 Y110.471 E.00242
M204 S10000
G1 X136.686 Y109.88 F42000
; LINE_WIDTH: 0.194228
G1 F15000
M204 S6000
G1 X136.554 Y109.787 E.00199
; LINE_WIDTH: 0.151804
G1 X136.422 Y109.694 E.00143
; LINE_WIDTH: 0.109379
G1 X136.29 Y109.601 E.00088
M204 S10000
G1 X136.363 Y110.26 F42000
; LINE_WIDTH: 0.105258
G1 F15000
M204 S6000
G1 X136.273 Y110.197 E.00056
; LINE_WIDTH: 0.139441
G1 X136.184 Y110.133 E.00086
; LINE_WIDTH: 0.174189
G1 X136.092 Y110.068 E.00121
; LINE_WIDTH: 0.201484
G1 X135.98 Y109.993 E.00175
; WIPE_START
G1 X136.092 Y110.068 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.554 Y109.512 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.188077
G1 F15000
M204 S6000
G2 X134.245 Y109.321 I-8.994 J14.248 E.0043
; WIPE_START
G1 X134.554 Y109.512 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.269 Y108.602 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.0910582
G1 F15000
M204 S6000
G1 X133.005 Y108.452 E.00119
; WIPE_START
G1 X133.269 Y108.602 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.701 Y109.596 Z4.2 F42000
G1 X119.455 Y110.416 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.106231
G1 F15000
M204 S6000
G1 X119.368 Y110.355 E.00055
; LINE_WIDTH: 0.14053
G1 X119.28 Y110.295 E.00084
; LINE_WIDTH: 0.189255
G2 X118.839 Y109.993 I-10.251 J14.562 E.00638
; WIPE_START
G1 X119.28 Y110.295 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.611 Y110.82 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.116921
G1 F15000
M204 S6000
G1 X120.365 Y111.014 E.00189
; WIPE_START
G1 X120.611 Y110.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.122 Y116.978 Z4.2 F42000
G1 X125.562 Y117.579 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.012 J-2.121 E.01218
G1 X123.209 Y117.021 E.03792
G1 X125.59 Y117.2 E.07338
G1 X125.566 Y117.519 E.00983
; WIPE_START
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z4.2 F42000
G1 X130.272 Y132.592 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F5400
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z4.2 F42000
G1 X130.931 Y123.798 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F5400
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F5400
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z4.2 F42000
G1 X130.512 Y131.808 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.932 Y121.411 E.01909
G1 X131.29 Y121.437 E.01102
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
M73 P67 R9
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630869
G1 F6122.986
M204 S6000
G1 X130.578 Y124.377 E.36469
; WIPE_START
G1 X130.429 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.164 Y123.424 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.41756
G1 F9609.231
M204 S6000
G1 X132.833 Y123.549 E.05112
; WIPE_START
G1 X131.164 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z4.2 F42000
G1 X132.116 Y133.122 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F9608.963
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.752 Y126.895 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X133.921 Y126.683 E.00834
G3 X135.908 Y125.789 I2.056 J1.915 E.06873
G1 X136.048 Y125.789 E.0043
G3 X133.656 Y127.015 I-.07 J2.809 E.45633
G1 X133.715 Y126.941 E.00288
; WIPE_START
M204 S6000
G1 X133.921 Y126.683 E-.1259
G1 X134.118 Y126.491 E-.10432
G1 X134.337 Y126.316 E-.10656
G1 X134.573 Y126.164 E-.10646
G1 X134.822 Y126.036 E-.10648
G1 X135.083 Y125.934 E-.10641
G1 X135.346 Y125.86 E-.10387
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.869 Y131.164 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
G1 F3000
M204 S5000
G1 X137.836 Y131.182 E.00117
G3 X135.898 Y125.409 I-1.864 J-2.586 E.36663
G3 X136.191 Y125.416 I.079 J2.935 E.00899
G3 X138.084 Y130.984 I-.219 J3.18 E.23008
G1 X137.915 Y131.126 E.00677
; WIPE_START
M204 S6000
G1 X137.836 Y131.182 E-.03702
G1 X137.573 Y131.36 E-.12075
G1 X137.143 Y131.567 E-.18112
G1 X136.841 Y131.669 E-.12095
G1 X136.531 Y131.739 E-.12081
G1 X136.216 Y131.779 E-.12088
G1 X136.062 Y131.783 E-.05848
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.517 Y130.145 Z4.2 F42000
G1 X147.178 Y129.341 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5400
M204 S6000
G1 X147.163 Y129.535 E.00647
G3 X146.747 Y129.594 I-.492 J-1.962 E.01396
G1 X146.672 Y129.579 E.00252
G1 X146.617 Y129.542 E.00221
G1 X146.579 Y129.492 E.00209
G1 X146.558 Y129.417 E.00259
G3 X146.8 Y129.223 I.191 J-.01 E.01197
G1 X147.12 Y129.323 E.01115
M204 S10000
G1 X147.817 Y129.851 F42000
G1 F5400
M204 S6000
G1 X146.801 Y130 E.03407
G3 X146.756 Y128.807 I-.053 J-.595 E.06427
G3 X146.898 Y128.827 I-.018 J.642 E.00476
G1 X147.959 Y129.158 E.03686
G3 X147.908 Y129.837 I-6.918 J-.179 E.02262
G1 X147.876 Y129.842 E.00106
M204 S250
G1 X147.279 Y130.326 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X146.74 Y130.395 I-.6 J-2.553 E.01673
G3 X146.992 Y128.446 I.008 J-.989 E.10284
G1 X147.41 Y128.576 E.01345
G2 X145.388 Y119.38 I-19.679 J-.494 E.29216
G2 X145.806 Y118.23 I-5.271 J-2.563 E.03766
G1 X145.863 Y118.178 E.00236
G1 X146.175 Y118.761 E.02032
G3 X144.2 Y140.374 I-18.156 J9.237 E.70329
G1 X144.151 Y140.315 E.00236
G2 X143.909 Y139.115 I-5.936 J.569 E.03766
G2 X147.271 Y130.385 I-16.192 J-11.248 E.29023
M204 S10000
G1 X147.803 Y130.051 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.62958
G1 F6136.439
M204 S6000
G3 X145.644 Y137.218 I-20.581 J-2.292 E.35984
M204 S10000
G1 X145.184 Y137.452 F42000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X145.601 Y137.869 E.01812
G1 X145.406 Y138.207
G1 X144.995 Y137.796 E.01786
G1 X144.794 Y138.128
G1 X145.205 Y138.54 E.01787
G1 X145.004 Y138.871
G1 X144.593 Y138.461 E.01783
G1 X144.382 Y138.783
G1 X144.789 Y139.19 E.01768
G1 X144.575 Y139.509
G1 X144.168 Y139.102 E.01767
; WIPE_START
M204 S6000
G1 X144.575 Y139.509 E-.21855
G1 X144.789 Y139.19 E-.14601
G1 X144.382 Y138.783 E-.21865
G1 X144.593 Y138.461 E-.14637
G1 X144.65 Y138.517 E-.03042
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.861 Y137.426 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.168446
G1 F15000
M204 S6000
G1 X145.333 Y137.262 E.00566
; LINE_WIDTH: 0.139096
G1 X145.291 Y137.293 E.0004
; LINE_WIDTH: 0.102753
G1 X145.218 Y137.391 E.0006
; WIPE_START
G1 X145.291 Y137.293 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.555 Y130.003 Z4.2 F42000
G1 X147.888 Y128.93 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.629557
G1 F6136.683
M204 S6000
G2 X146.821 Y121.514 I-20.698 J-.806 E.36013
; WIPE_START
G1 X147.162 Y122.635 E-.44521
G1 X147.366 Y123.438 E-.31479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.616 Y120.22 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3000
M204 S2000
G1 X145.669 Y119.273 E.04115
G1 X145.949 Y120.086
G1 X146.959 Y121.096 E.04385
G1 X146.817 Y121.487
G1 X146.321 Y120.991 E.02157
; WIPE_START
M204 S6000
G1 X146.817 Y121.487 E-.26675
G1 X146.959 Y121.096 E-.15831
G1 X146.335 Y120.472 E-.33494
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.398 Y119.708 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.111023
G1 F15000
M204 S6000
G1 X146.319 Y119.596 E.00076
; LINE_WIDTH: 0.156748
G1 X146.239 Y119.483 E.00128
; LINE_WIDTH: 0.202472
G1 X146.16 Y119.371 E.00179
; LINE_WIDTH: 0.248196
G1 X146.081 Y119.258 E.0023
; LINE_WIDTH: 0.29392
G1 F14342.663
G1 X146.001 Y119.146 E.00282
; LINE_WIDTH: 0.340602
G1 F12093.474
G1 X145.922 Y119.033 E.00334
G1 X145.906 Y119.037 E.00041
; LINE_WIDTH: 0.31434
G1 F13263.584
G1 X145.878 Y119.051 E.00068
; LINE_WIDTH: 0.274298
G1 F15000
G1 X145.851 Y119.065 E.00058
; LINE_WIDTH: 0.234255
G1 X145.824 Y119.079 E.00048
; LINE_WIDTH: 0.194212
G1 X145.797 Y119.093 E.00038
; LINE_WIDTH: 0.15417
G1 X145.77 Y119.107 E.00028
; LINE_WIDTH: 0.1094
G1 X145.689 Y119.226 E.00078
; WIPE_START
G1 X145.77 Y119.107 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X146.788 Y120.632 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.108522
G1 F15000
M204 S6000
G1 X146.71 Y120.516 E.00075
; LINE_WIDTH: 0.149215
G1 X146.632 Y120.399 E.00122
; LINE_WIDTH: 0.189908
G1 X146.554 Y120.282 E.00168
M204 S10000
G1 X146.308 Y121.004 F42000
; LINE_WIDTH: 0.166179
G1 F15000
M204 S6000
G1 X146.338 Y120.858 E.0015
; LINE_WIDTH: 0.187116
G1 X146.277 Y120.767 E.00128
; LINE_WIDTH: 0.147534
G1 X146.217 Y120.676 E.00093
; LINE_WIDTH: 0.107953
G1 X146.156 Y120.586 E.00058
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X146.217 Y120.676 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/76
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S201.45
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.2 I-.748 J-.96 P1  F42000
G1 X124.036 Y137.942 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.1113
G2 X120.311 Y137.662 I-5.381 J.968 E.01219
G1 X123 Y137.864 E.08286
G1 X123.976 Y137.937 E.03008
; WIPE_START
G1 F3000
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.915 Y144.378 Z4.4 F42000
G1 X117.915 Y144.379 Z4.4
G1 Z4
G1 E.8 F1800
G1 F2588
M204 S5000
G1 X117.853 Y144.413 E.00215
G3 X116.542 Y144.009 I-.445 J-.884 E.04655
G2 X118.33 Y143.172 I-1.296 J-5.095 E.06102
G1 X118.337 Y143.187 E.00052
G3 X118.016 Y144.31 I-.929 J.341 E.03837
G1 X117.964 Y144.346 E.00193
; WIPE_START
G1 F3000
M204 S6000
G1 X117.853 Y144.413 E-.04936
G1 X117.675 Y144.487 E-.07338
G1 X117.484 Y144.52 E-.07351
G1 X117.291 Y144.516 E-.07348
G1 X117.101 Y144.474 E-.07371
G1 X116.925 Y144.396 E-.07331
G1 X116.766 Y144.285 E-.07366
G1 X116.632 Y144.146 E-.07341
G1 X116.542 Y144.009 E-.06216
G1 X116.88 Y143.906 E-.13402
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


G1 X116.91 Y144.149 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298922
G1 F2588
M204 S6000
G1 X117.908 Y144.15 E.02082
M204 S10000
G1 X117.617 Y144.299 F42000
; LINE_WIDTH: 0.247846
G1 F2588
M204 S6000
G2 X118.202 Y143.531 I-27.734 J-21.755 E.01612
M204 S10000
G1 X118.196 Y143.638 F42000
; LINE_WIDTH: 0.419036
G1 F2588
M204 S6000
G1 X117.891 Y143.899 E.01232
G3 X117.812 Y143.96 I-.657 J-.773 E.00305
; LINE_WIDTH: 0.472022
G3 X117.448 Y144.124 I-.606 J-.86 E.01405
; LINE_WIDTH: 0.436558
G1 X117.004 Y144.214 E.01453
; WIPE_START
G1 F9145.473
G1 X117.448 Y144.124 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.113 Y138.665 Z4.4 F42000
G1 X110.469 Y136.982 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F2588
M204 S5000
G1 X110.475 Y136.905 E.00213
G1 X110.501 Y136.906 E.00072
G1 X110.492 Y136.927 E.0006
; WIPE_START
G1 F3000
M204 S6000
G1 X110.475 Y136.905 E-.28131
G1 X110.501 Y136.906 E-.26029
G1 X110.492 Y136.927 E-.2184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z4.4 F42000
G1 X112.004 Y116.505 Z4.4
G1 Z4
G1 E.8 F1800
G1 F2588
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.565 E.00048
; WIPE_START
G1 F3000
M204 S6000
G1 X112.024 Y116.585 E-.31819
G1 X111.998 Y116.583 E-.26383
G1 X111.999 Y116.565 E-.17798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.185 Y112.095 Z4.4 F42000
G1 X120.554 Y110.384 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G1 X120.62 Y110.456 E.00301
G3 X120.7 Y111.556 I-.786 J.61 E.03594
G2 X119.056 Y110.462 I-3.686 J3.755 E.06102
G3 X119.968 Y110.08 I.79 J.605 E.03178
G3 X120.45 Y110.284 I-.134 J.986 E.01629
G1 X120.511 Y110.342 E.00257
M204 S10000
G1 X120.406 Y110.504 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.292487
G1 F2588
M204 S6000
G1 X119.676 Y110.409 E.01496
; LINE_WIDTH: 0.26459
G1 X119.431 Y110.383 E.00446
M204 S10000
G1 X119.542 Y110.328 F42000
; LINE_WIDTH: 0.429943
G1 F2588
M204 S6000
G1 X119.94 Y110.473 E.01334
; LINE_WIDTH: 0.46983
G3 X120.175 Y110.594 I-.404 J1.066 E.00923
G1 X120.243 Y110.646 E.00298
; LINE_WIDTH: 0.453831
G1 X120.365 Y110.762 E.00564
; LINE_WIDTH: 0.405688
G1 X120.635 Y111.092 E.01262
M204 S10000
G1 X120.625 Y111.196 F42000
; LINE_WIDTH: 0.217916
G1 F2588
M204 S6000
G2 X120.204 Y110.358 I-37.301 J18.174 E.01338
; WIPE_START
G1 F15000
G1 X120.625 Y111.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.295 Y117.233 Z4.4 F42000
G1 X125.562 Y117.579 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.044 J-2.133 E.01218
G1 X122.81 Y116.991 E.02564
G1 X125.59 Y117.2 E.08567
G1 X125.566 Y117.519 E.00983
; WIPE_START
G1 F3000
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z4.4 F42000
G1 X130.272 Y132.592 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2588
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2588
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z4.4 F42000
G1 X130.931 Y123.798 Z4.4
G1 Z4
G1 E.8 F1800
G1 F2588
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2588
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z4.4 F42000
G1 X130.512 Y131.808 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.845 Y121.404 E.0164
G1 X131.29 Y121.437 E.01371
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2588
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2588
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.963
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z4.4 F42000
G1 X132.116 Y133.122 Z4.4
G1 Z4
G1 E.8 F1800
G1 F2588
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.194 Y126.137 Z4.4 F42000
G1 X135.311 Y125.871 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G1 X135.49 Y125.83 E.00563
G3 X135.908 Y125.789 I.488 J2.767 E.01292
G1 X136.048 Y125.789 E.0043
G3 X135.217 Y125.893 I-.07 J2.809 E.51661
G1 X135.253 Y125.885 E.00113
; WIPE_START
G1 F3000
M204 S6000
G1 X135.49 Y125.83 E-.09246
G1 X135.908 Y125.789 E-.15957
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10649
G1 X136.603 Y125.858 E-.10642
G1 X136.872 Y125.934 E-.10639
G1 X137.133 Y126.036 E-.10651
G1 X137.201 Y126.071 E-.02892
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.839 Y131.184 Z4.4 F42000
G1 Z4
G1 E.8 F1800
G1 F2588
M204 S5000
G1 X137.704 Y131.271 E.00492
G3 X135.898 Y125.409 I-1.733 J-2.675 E.3618
G3 X136.187 Y125.415 I.079 J2.894 E.00888
G3 X137.962 Y131.086 I-.216 J3.18 E.23502
G1 X137.885 Y131.146 E.003
; WIPE_START
G1 F3000
M204 S6000
G1 X137.704 Y131.271 E-.08358
G1 X137.433 Y131.437 E-.12082
G1 X137.143 Y131.567 E-.12073
G1 X136.842 Y131.669 E-.12088
G1 X136.532 Y131.739 E-.12086
G1 X136.216 Y131.779 E-.12087
G1 X136.026 Y131.784 E-.07226
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.493 Y130.204 Z4.4 F42000
G1 X147.134 Y129.434 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2588
M204 S6000
G1 X146.811 Y129.584 E.01181
G1 X146.724 Y129.593 E.00292
G3 X146.78 Y129.217 I.024 J-.188 E.02005
G1 X146.833 Y129.235 E.00186
G1 X147.084 Y129.401 E.00999
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F2588
M204 S6000
G1 X147.831 Y129.56 E.00485
G1 X146.948 Y129.968 E.03225
G3 X146.756 Y128.807 I-.201 J-.563 E.06936
G3 X147.046 Y128.888 I-.009 J.595 E.01011
G1 X147.792 Y129.381 E.02964
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2588
M204 S5000
G3 X147.071 Y130.34 I-1.827 J-3.284 E.01826
G3 X147.246 Y128.55 I-.324 J-.935 E.12171
G1 X147.704 Y128.853 E.0169
G2 X146.773 Y121.994 I-20.839 J-.662 E.21368
G2 X146.243 Y120.552 I-15.387 J4.833 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.84 J-10.065 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228874
G1 F2588
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.267 Z4.4 F42000
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.228915
G1 F2588
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13116
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.045 Y121.905 E-.45366
G1 X147.273 Y122.678 E-.30634
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/76
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.4 I-.668 J-1.017 P1  F42000
G1 X124.036 Y137.942 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.1113
G2 X120.311 Y137.662 I-5.409 J.974 E.01219
G1 X123.498 Y137.901 E.09821
G1 X123.976 Y137.937 E.01473
; WIPE_START
G1 F3000
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.957 Y144.353 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2592
M204 S5000
G1 X117.853 Y144.413 E.00368
G3 X116.542 Y144.009 I-.446 J-.884 E.04657
G2 X118.33 Y143.172 I-1.295 J-5.094 E.06102
G1 X118.337 Y143.188 E.00052
G3 X118.015 Y144.311 I-.929 J.341 E.0384
G1 X118.006 Y144.317 E.00036
; WIPE_START
G1 F3000
M204 S6000
G1 X117.853 Y144.413 E-.06822
G1 X117.675 Y144.487 E-.07343
G1 X117.484 Y144.52 E-.07358
G1 X117.291 Y144.516 E-.07349
G1 X117.102 Y144.474 E-.07363
G1 X116.925 Y144.396 E-.07351
G1 X116.766 Y144.285 E-.07352
G1 X116.632 Y144.146 E-.07353
G1 X116.542 Y144.009 E-.06215
G1 X116.832 Y143.921 E-.11494
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


G1 X116.91 Y144.149 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298897
G1 F2592
M204 S6000
G1 X117.909 Y144.149 E.02083
M204 S10000
G1 X117.616 Y144.299 F42000
; LINE_WIDTH: 0.247845
G1 F2592
M204 S6000
G2 X118.202 Y143.531 I-27.221 J-21.386 E.01613
M204 S10000
G1 X118.196 Y143.638 F42000
; LINE_WIDTH: 0.419122
G1 F2592
M204 S6000
G1 X117.89 Y143.899 E.01234
G3 X117.812 Y143.96 I-.66 J-.778 E.00304
; LINE_WIDTH: 0.472269
G3 X117.451 Y144.123 I-.607 J-.861 E.01392
; LINE_WIDTH: 0.437374
G1 X117.004 Y144.214 E.01468
; WIPE_START
M73 P68 R9
G1 F9126.54
G1 X117.451 Y144.123 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.115 Y138.666 Z4.6 F42000
G1 X110.469 Y136.982 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F2592
M204 S5000
G1 X110.475 Y136.905 E.00213
G1 X110.501 Y136.906 E.00071
G1 X110.492 Y136.927 E.0006
; WIPE_START
G1 F3000
M204 S6000
G1 X110.475 Y136.905 E-.28135
G1 X110.501 Y136.906 E-.2597
G1 X110.492 Y136.927 E-.21895
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z4.6 F42000
G1 X112.004 Y116.505 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2592
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00072
G1 X111.999 Y116.565 E.00049
; WIPE_START
G1 F3000
M204 S6000
G1 X112.024 Y116.585 E-.31811
G1 X111.998 Y116.583 E-.26306
G1 X111.999 Y116.565 E-.17883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.229 Y112.155 Z4.6 F42000
G1 X120.619 Y110.464 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G1 X120.698 Y110.573 E.00416
G3 X120.7 Y111.556 I-.864 J.493 E.0316
G2 X119.056 Y110.462 I-3.687 J3.755 E.06103
G1 X119.068 Y110.446 E.0006
G3 X119.918 Y110.075 I.776 J.617 E.02967
G3 X120.526 Y110.351 I-.084 J.991 E.02091
G1 X120.58 Y110.417 E.00265
M204 S10000
G1 X120.424 Y110.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.30429
G1 F2592
M204 S6000
G1 X119.676 Y110.409 E.01613
; LINE_WIDTH: 0.276966
G1 X119.442 Y110.379 E.00449
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423495
G1 F2592
M204 S6000
G1 X119.939 Y110.472 E.01347
; LINE_WIDTH: 0.469387
G3 X120.306 Y110.702 I-.362 J.985 E.01514
; LINE_WIDTH: 0.440558
G1 X120.366 Y110.764 E.0028
; LINE_WIDTH: 0.405474
G1 X120.635 Y111.093 E.01256
M204 S10000
G1 X120.625 Y111.196 F42000
; LINE_WIDTH: 0.215044
G1 F2592
M204 S6000
G2 X120.204 Y110.355 I-42.201 J20.592 E.0132
; WIPE_START
G1 F15000
G1 X120.625 Y111.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.295 Y117.233 Z4.6 F42000
G1 X125.562 Y117.579 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G1 X121.837 Y117.3 E.11478
G2 X121.978 Y116.929 I-5.067 J-2.142 E.01218
G1 X122.412 Y116.962 E.01335
G1 X125.59 Y117.2 E.09795
G1 X125.566 Y117.519 E.00983
; WIPE_START
G1 F3000
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z4.6 F42000
G1 X130.272 Y132.592 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2592
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2592
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z4.6 F42000
G1 X130.931 Y123.798 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2592
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2592
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z4.6 F42000
G1 X130.512 Y131.808 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.757 Y121.398 E.01371
G1 X131.29 Y121.437 E.0164
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2592
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2592
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.949
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z4.6 F42000
G1 X132.116 Y133.122 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2592
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.175 Y126.129 Z4.6 F42000
G1 X135.286 Y125.877 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G1 X135.352 Y125.858 E.00213
G3 X135.908 Y125.789 I.625 J2.739 E.01722
G1 X136.048 Y125.789 E.0043
G3 X135.083 Y125.934 I-.07 J2.809 E.5123
G1 X135.228 Y125.893 E.00464
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.04909
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10648
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10644
G1 X136.603 Y125.858 E-.10651
G1 X136.872 Y125.934 E-.10638
G1 X137.133 Y126.036 E-.10645
G1 X137.178 Y126.059 E-.01896
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.831 Y131.189 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F2592
M204 S5000
G1 X137.704 Y131.271 E.00466
G3 X135.898 Y125.409 I-1.734 J-2.675 E.36183
G3 X136.183 Y125.415 I.079 J2.858 E.00875
G3 X137.961 Y131.085 I-.212 J3.181 E.23511
G1 X137.878 Y131.152 E.00326
; WIPE_START
G1 F3000
M204 S6000
G1 X137.704 Y131.271 E-.08031
G1 X137.433 Y131.437 E-.12074
G1 X137.143 Y131.567 E-.12076
G1 X136.841 Y131.669 E-.12093
G1 X136.532 Y131.739 E-.12081
G1 X136.216 Y131.779 E-.12087
G1 X136.017 Y131.784 E-.07558
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.485 Y130.205 Z4.6 F42000
G1 X147.134 Y129.434 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2592
M204 S6000
G1 X146.811 Y129.584 E.01181
G1 X146.723 Y129.593 E.00294
G3 X146.78 Y129.217 I.025 J-.188 E.02004
G1 X146.833 Y129.235 E.00185
G1 X147.084 Y129.401 E.00999
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F2592
M204 S6000
G1 X147.831 Y129.559 E.00484
G1 X146.948 Y129.968 E.03227
G3 X146.756 Y128.807 I-.201 J-.563 E.06935
G3 X147.046 Y128.888 I-.035 J.688 E.01008
G1 X147.792 Y129.38 E.02964
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2592
M204 S5000
G3 X147.071 Y130.34 I-1.81 J-3.243 E.01828
G3 X147.245 Y128.55 I-.323 J-.935 E.12169
G1 X147.704 Y128.853 E.0169
G2 X146.773 Y121.994 I-20.839 J-.662 E.21367
G2 X146.243 Y120.552 I-15.384 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.724 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228811
G1 F2592
M204 S6000
G3 X145.362 Y137.919 I-20.513 J-1.951 E.13109
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.228885
G1 F2592
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/76
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.6 I-.668 J-1.017 P1  F42000
G1 X124.036 Y137.942 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G1 X124.008 Y138.321 E.01168
G1 X120.395 Y138.05 E.1113
G2 X120.311 Y137.662 I-5.433 J.979 E.01218
G1 X123.976 Y137.937 E.11293
; WIPE_START
G1 F3000
M204 S6000
G1 X124.008 Y138.321 E-.14619
G1 X122.397 Y138.2 E-.61381
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118 Y144.325 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2596
M204 S5000
G1 X117.854 Y144.413 E.00523
G3 X116.542 Y144.009 I-.446 J-.884 E.04658
G2 X118.33 Y143.172 I-1.295 J-5.095 E.06102
G1 X118.337 Y143.188 E.00053
G3 X118.045 Y144.286 I-.929 J.341 E.03719
; WIPE_START
G1 F3000
M204 S6000
G1 X117.854 Y144.413 E-.08723
G1 X117.675 Y144.487 E-.07345
G1 X117.485 Y144.52 E-.07355
G1 X117.291 Y144.516 E-.07349
G1 X117.102 Y144.474 E-.07365
G1 X116.925 Y144.396 E-.07349
G1 X116.766 Y144.285 E-.07356
G1 X116.632 Y144.146 E-.07362
G1 X116.542 Y144.009 E-.06212
G1 X116.784 Y143.935 E-.09584
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


G1 X116.91 Y144.149 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298896
G1 F2596
M204 S6000
G1 X117.909 Y144.149 E.02083
M204 S10000
G1 X117.616 Y144.299 F42000
; LINE_WIDTH: 0.247885
G1 F2596
M204 S6000
G2 X118.202 Y143.531 I-25.663 J-20.211 E.01614
M204 S10000
G1 X118.196 Y143.638 F42000
; LINE_WIDTH: 0.419249
G1 F2596
M204 S6000
G1 X117.89 Y143.899 E.01235
G3 X117.811 Y143.96 I-.662 J-.781 E.00305
; LINE_WIDTH: 0.472472
G3 X117.454 Y144.122 I-.606 J-.861 E.0138
; LINE_WIDTH: 0.438065
G1 X117.004 Y144.214 E.0148
; WIPE_START
G1 F9110.586
G1 X117.454 Y144.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.117 Y138.666 Z4.8 F42000
G1 X110.469 Y136.982 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.378512
G1 F2596
M204 S5000
G1 X110.475 Y136.905 E.00213
G1 X110.501 Y136.906 E.00071
G1 X110.492 Y136.927 E.0006
; WIPE_START
G1 F3000
M204 S6000
G1 X110.475 Y136.905 E-.28147
G1 X110.501 Y136.906 E-.25945
G1 X110.492 Y136.927 E-.21909
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.056 Y129.315 Z4.8 F42000
G1 X112.004 Y116.505 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F2596
M204 S5000
G1 X112.024 Y116.585 E.00224
G1 X111.998 Y116.583 E.00071
G1 X111.999 Y116.565 E.00048
; WIPE_START
G1 F3000
M204 S6000
G1 X112.024 Y116.585 E-.31806
G1 X111.998 Y116.583 E-.26295
G1 X111.999 Y116.565 E-.17898
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.265 Y112.207 Z4.8 F42000
G1 X120.673 Y110.532 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G1 X120.698 Y110.573 E.00148
G3 X120.7 Y111.556 I-.864 J.493 E.03162
G2 X119.056 Y110.462 I-3.686 J3.755 E.06103
G1 X119.067 Y110.447 E.00057
G3 X119.918 Y110.075 I.777 J.617 E.02971
G3 X120.557 Y110.383 I-.084 J.991 E.02229
G1 X120.636 Y110.484 E.00395
M204 S10000
G1 X120.424 Y110.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.303838
G1 F2596
M204 S6000
G1 X119.675 Y110.409 E.01611
; LINE_WIDTH: 0.276923
G1 X119.442 Y110.379 E.00448
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423427
G1 F2596
M204 S6000
G1 X119.939 Y110.472 E.01345
; LINE_WIDTH: 0.469121
G3 X120.306 Y110.702 I-.38 J1.015 E.01515
; LINE_WIDTH: 0.440641
G1 X120.366 Y110.763 E.00277
; LINE_WIDTH: 0.405423
G1 X120.635 Y111.093 E.01257
M204 S10000
G1 X120.625 Y111.196 F42000
; LINE_WIDTH: 0.21241
G1 F2596
M204 S6000
G2 X120.204 Y110.355 I-43.243 J21.122 E.01299
; WIPE_START
G1 F15000
G1 X120.625 Y111.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.295 Y117.233 Z4.8 F42000
G1 X125.562 Y117.579 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G1 X121.837 Y117.3 E.11477
G2 X121.978 Y116.929 I-5.086 J-2.149 E.01218
G1 X122.013 Y116.932 E.00107
G1 X125.59 Y117.2 E.11023
G1 X125.566 Y117.519 E.00983
; WIPE_START
G1 F3000
M204 S6000
G1 X123.57 Y117.401 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.651 Y124.384 Z4.8 F42000
G1 X130.272 Y132.592 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2596
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2596
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z4.8 F42000
G1 X130.931 Y123.798 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F2596
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2596
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z4.8 F42000
G1 X130.512 Y131.808 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.67 Y121.391 E.01102
G1 X131.29 Y121.437 E.01909
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2596
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z4.8 F42000
M73 P68 R8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2596
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.949
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z4.8 F42000
G1 X132.116 Y133.122 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2596
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.16 Y126.123 Z4.8 F42000
G1 X135.264 Y125.883 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G1 X135.352 Y125.858 E.00282
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X135.083 Y125.934 I-.07 J2.809 E.51231
G1 X135.206 Y125.899 E.00394
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.05762
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10644
G1 X136.873 Y125.934 E-.1064
G1 X137.133 Y126.036 E-.10647
G1 X137.158 Y126.049 E-.01037
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.806 Y131.21 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
G1 F2596
M204 S5000
G1 X137.569 Y131.354 E.00852
G3 X135.898 Y125.409 I-1.599 J-2.758 E.35699
G3 X136.179 Y125.415 I.079 J2.821 E.00864
G3 X137.85 Y131.17 I-.209 J3.181 E.23948
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.12784
G1 X137.143 Y131.567 E-.18094
G1 X136.842 Y131.669 E-.12086
G1 X136.532 Y131.739 E-.12085
G1 X136.216 Y131.779 E-.12088
G1 X135.983 Y131.785 E-.08864
; WIPE_END
M73 P69 R8
G1 E-.04 F1800
M204 S10000
G1 X143.451 Y130.21 Z4.8 F42000
G1 X147.134 Y129.434 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2596
M204 S6000
G1 X146.811 Y129.584 E.01183
G1 X146.722 Y129.593 E.00295
G3 X146.775 Y129.217 I.025 J-.188 E.01984
G1 X146.822 Y129.23 E.00162
G3 X147.087 Y129.397 I-.829 J1.611 E.01041
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F2596
M204 S6000
G1 X147.831 Y129.559 E.00484
G1 X146.948 Y129.968 E.03226
G3 X146.756 Y128.807 I-.201 J-.563 E.06937
G1 X146.898 Y128.827 E.00475
G1 X147.046 Y128.888 E.00531
G1 X147.792 Y129.381 E.02966
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2596
M204 S5000
G3 X147.071 Y130.34 I-1.81 J-3.243 E.01828
G3 X147.245 Y128.55 I-.322 J-.935 E.12151
G1 X147.704 Y128.853 E.0169
G2 X146.773 Y121.994 I-20.839 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.724 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228896
G1 F2596
M204 S6000
G3 X145.362 Y137.919 I-20.513 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z4.8 F42000
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.228753
G1 F2596
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13104
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/76
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z4.8 I-.723 J-.979 P1  F42000
G1 X118.064 Y144.271 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
M204 S5000
G1 X118.017 Y144.309 E.00187
G3 X116.542 Y144.009 I-.609 J-.78 E.05253
G2 X118.33 Y143.172 I-1.295 J-5.094 E.06102
G1 X118.337 Y143.188 E.00052
G3 X118.152 Y144.181 I-.929 J.341 E.03259
G1 X118.106 Y144.228 E.00202
; WIPE_START
G1 F3000
M204 S6000
G1 X118.017 Y144.309 E-.04581
G1 X117.856 Y144.417 E-.07357
G1 X117.676 Y144.487 E-.07358
G1 X117.485 Y144.52 E-.0736
G1 X117.291 Y144.516 E-.07354
G1 X117.102 Y144.474 E-.07364
G1 X116.925 Y144.396 E-.0735
G1 X116.766 Y144.286 E-.07353
G1 X116.632 Y144.146 E-.07365
G1 X116.542 Y144.009 E-.06218
G1 X116.702 Y143.96 E-.06341
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


G1 X116.91 Y144.149 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298803
G1 F2293
M204 S6000
G1 X117.909 Y144.149 E.02083
M204 S10000
G1 X117.617 Y144.299 F42000
; LINE_WIDTH: 0.248112
G1 F2293
M204 S6000
G2 X118.202 Y143.532 I-30.54 J-23.905 E.01613
M204 S10000
G1 X118.196 Y143.638 F42000
; LINE_WIDTH: 0.419349
G1 F2293
M204 S6000
G1 X117.89 Y143.9 E.01236
G3 X117.811 Y143.96 I-.666 J-.785 E.00306
; LINE_WIDTH: 0.472499
G3 X117.454 Y144.122 I-.605 J-.861 E.01378
; LINE_WIDTH: 0.43822
G1 X117.004 Y144.214 E.01481
; WIPE_START
G1 F9107.021
G1 X117.454 Y144.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.197 Y136.526 Z5 F42000
G1 X120.728 Y110.631 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
M204 S5000
G1 X120.791 Y110.794 E.00536
G3 X120.7 Y111.556 I-.957 J.272 E.02423
G2 X119.056 Y110.462 I-3.687 J3.756 E.06103
G1 X119.067 Y110.448 E.00054
G3 X119.919 Y110.075 I.786 J.635 E.0297
G3 X120.698 Y110.572 I-.085 J.991 E.02954
G1 X120.7 Y110.578 E.00019
M204 S10000
G1 X120.471 Y110.577 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.355389
G1 F2293
M204 S6000
G1 X119.476 Y110.361 E.02593
M204 S10000
G1 X119.446 Y110.377 F42000
; LINE_WIDTH: 0.280774
G1 F2293
M204 S6000
G3 X120.424 Y110.524 I-5.606 J40.488 E.01918
M204 S10000
G1 X120.203 Y110.355 F42000
; LINE_WIDTH: 0.209259
G1 F2293
M204 S6000
G3 X120.625 Y111.196 I-44.399 J22.763 E.01276
M204 S10000
G1 X120.635 Y111.093 F42000
; LINE_WIDTH: 0.405255
G1 F2293
M204 S6000
G1 X120.366 Y110.763 E.01258
; LINE_WIDTH: 0.440825
G1 X120.306 Y110.702 E.00278
; LINE_WIDTH: 0.469314
G2 X119.939 Y110.472 I-.747 J.787 E.01514
; LINE_WIDTH: 0.42343
G1 X119.528 Y110.334 E.01344
; WIPE_START
G1 F9460.992
G1 X119.939 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.169 Y117.387 Z5 F42000
G1 X130.272 Y132.592 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2293
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2293
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z5 F42000
G1 X130.931 Y123.798 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2293
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2293
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z5 F42000
G1 X130.512 Y131.808 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.583 Y121.385 E.00833
G1 X131.29 Y121.437 E.02178
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2293
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2293
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.963
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z5 F42000
G1 X132.116 Y133.122 Z5
G1 Z4.6
G1 E.8 F1800
G1 F2293
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.144 Y126.116 Z5 F42000
G1 X135.242 Y125.889 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
M204 S5000
G1 X135.352 Y125.858 E.00352
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X135.083 Y125.934 I-.07 J2.809 E.5123
G1 X135.184 Y125.906 E.00324
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.06637
G1 X135.628 Y125.81 E-.10647
G1 X135.908 Y125.789 E-.10649
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10649
G1 X136.603 Y125.858 E-.10644
G1 X136.873 Y125.934 E-.1065
G1 X137.133 Y126.036 E-.10636
G1 X137.137 Y126.038 E-.00166
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.799 Y131.214 Z5 F42000
G1 Z4.6
G1 E.8 F1800
G1 F2293
M204 S5000
G1 X137.569 Y131.353 E.00828
G3 X135.898 Y125.409 I-1.6 J-2.757 E.35703
G3 X136.175 Y125.415 I.079 J2.779 E.00851
G3 X137.844 Y131.174 I-.206 J3.181 E.2398
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.353 E-.12478
G1 X137.143 Y131.567 E-.18096
G1 X136.842 Y131.669 E-.12088
G1 X136.532 Y131.739 E-.12084
G1 X136.216 Y131.779 E-.12087
G1 X135.975 Y131.785 E-.09167
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.443 Y130.211 Z5 F42000
G1 X147.134 Y129.434 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2293
M204 S6000
G1 X146.811 Y129.584 E.01182
G1 X146.722 Y129.593 E.00297
G3 X146.78 Y129.217 I.026 J-.188 E.02
G1 X146.833 Y129.235 E.00184
G1 X147.084 Y129.401 E.01
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F2293
M204 S6000
G1 X147.831 Y129.56 E.00486
G1 X146.948 Y129.968 E.03227
G3 X146.756 Y128.807 I-.2 J-.563 E.06933
G3 X147.046 Y128.888 I-.035 J.691 E.01007
G1 X147.792 Y129.381 E.02966
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
M204 S5000
G3 X147.071 Y130.341 I-1.817 J-3.263 E.01828
G3 X147.245 Y128.549 I-.323 J-.935 E.12167
G1 X147.704 Y128.853 E.01691
G2 X146.773 Y121.994 I-20.839 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.922 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228898
G1 F2293
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13114
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.228887
G1 F2293
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/76
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5 I-.723 J-.979 P1  F42000
G1 X118.105 Y144.231 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2281
M204 S5000
G1 X118.014 Y144.311 E.00373
G3 X116.542 Y144.009 I-.606 J-.782 E.05241
G2 X118.33 Y143.172 I-1.295 J-5.094 E.06102
G1 X118.337 Y143.188 E.00053
G3 X118.152 Y144.182 I-.929 J.341 E.0326
G1 X118.146 Y144.187 E.00025
; WIPE_START
G1 F3000
M204 S6000
G1 X118.014 Y144.311 E-.06886
G1 X117.857 Y144.416 E-.07195
G1 X117.676 Y144.487 E-.07369
G1 X117.485 Y144.52 E-.07354
G1 X117.292 Y144.516 E-.07351
G1 X117.103 Y144.474 E-.07363
G1 X116.925 Y144.396 E-.07357
G1 X116.766 Y144.286 E-.07363
G1 X116.632 Y144.146 E-.0736
G1 X116.542 Y144.009 E-.06222
G1 X116.648 Y143.977 E-.04181
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


G1 X116.91 Y144.149 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.277895
G1 F2281
M204 S6000
G1 X117.147 Y144.154 E.00453
; LINE_WIDTH: 0.305221
G1 X117.909 Y144.149 E.0163
M204 S10000
G1 X117.616 Y144.299 F42000
; LINE_WIDTH: 0.248102
G1 F2281
M204 S6000
G2 X118.202 Y143.532 I-29.894 J-23.435 E.01614
M204 S10000
G1 X118.196 Y143.639 F42000
; LINE_WIDTH: 0.419414
G1 F2281
M204 S6000
G1 X117.89 Y143.9 E.01235
G3 X117.811 Y143.96 I-.657 J-.775 E.00304
; LINE_WIDTH: 0.472511
G3 X117.455 Y144.122 I-.604 J-.859 E.01378
; LINE_WIDTH: 0.438439
G1 X117.004 Y144.215 E.01482
; WIPE_START
G1 F9101.985
G1 X117.455 Y144.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.206 Y136.527 Z5.2 F42000
G1 X120.761 Y110.712 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2281
M204 S5000
G1 X120.791 Y110.794 E.00269
G3 X120.7 Y111.557 I-.957 J.272 E.02423
G2 X119.056 Y110.462 I-3.687 J3.756 E.06103
G1 X119.066 Y110.449 E.00051
G3 X119.919 Y110.075 I.778 J.616 E.02978
G3 X120.697 Y110.572 I-.085 J.991 E.02952
G1 X120.736 Y110.657 E.00287
M204 S10000
G1 X120.424 Y110.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.296897
G1 F2281
M204 S6000
G1 X119.442 Y110.379 E.02054
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.4233
G1 F2281
M204 S6000
G1 X119.938 Y110.472 E.01341
; LINE_WIDTH: 0.469256
G3 X120.305 Y110.701 I-.379 J1.015 E.01516
; LINE_WIDTH: 0.440902
G1 X120.365 Y110.763 E.00278
; LINE_WIDTH: 0.405204
G1 X120.635 Y111.093 E.01259
M204 S10000
G1 X120.625 Y111.196 F42000
; LINE_WIDTH: 0.206441
G1 F2281
M204 S6000
G2 X120.203 Y110.354 I-44.796 J21.916 E.01254
; WIPE_START
G1 F15000
G1 X120.625 Y111.196 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.762 Y118.154 Z5.2 F42000
G1 X130.272 Y132.592 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2281
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2281
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z5.2 F42000
G1 X130.931 Y123.798 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F2281
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2281
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
M73 P70 R8
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z5.2 F42000
G1 X130.512 Y131.808 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2281
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.496 Y121.378 E.00565
G1 X131.29 Y121.437 E.02447
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2281
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2281
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.949
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z5.2 F42000
G1 X132.116 Y133.122 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2281
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.128 Y126.109 Z5.2 F42000
G1 X135.219 Y125.896 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2281
M204 S5000
G1 X135.352 Y125.858 E.00424
G3 X135.907 Y125.789 I.625 J2.739 E.0172
G1 X136.048 Y125.789 E.00433
G3 X135.083 Y125.934 I-.07 J2.809 E.5123
G1 X135.162 Y125.912 E.00252
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.07527
G1 X135.628 Y125.81 E-.10645
G1 X135.907 Y125.789 E-.10622
G1 X136.048 Y125.789 E-.05352
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10643
G1 X136.873 Y125.934 E-.10642
G1 X137.116 Y126.029 E-.09917
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.792 Y131.219 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
G1 F2281
M204 S5000
G1 X137.568 Y131.353 E.00802
G3 X135.898 Y125.409 I-1.6 J-2.757 E.35707
G3 X136.171 Y125.415 I.079 J2.74 E.0084
G3 X137.837 Y131.178 I-.203 J3.181 E.24013
; WIPE_START
G1 F3000
M204 S6000
G1 X137.568 Y131.353 E-.12165
G1 X137.143 Y131.567 E-.18099
G1 X136.842 Y131.669 E-.12086
G1 X136.532 Y131.739 E-.12086
G1 X136.216 Y131.779 E-.12087
G1 X135.967 Y131.785 E-.09476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.435 Y130.213 Z5.2 F42000
G1 X147.134 Y129.434 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2281
M204 S6000
G1 X146.795 Y129.588 E.01237
G3 X146.775 Y129.217 I-.047 J-.184 E.02227
G1 X146.822 Y129.23 E.00162
G3 X147.087 Y129.397 I-.838 J1.625 E.01041
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F2281
M204 S6000
G1 X147.831 Y129.559 E.00486
G1 X146.948 Y129.968 E.03229
G3 X146.757 Y128.807 I-.2 J-.563 E.06935
G1 X146.897 Y128.826 E.0047
G1 X147.046 Y128.888 E.00534
G1 X147.792 Y129.38 E.02965
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2281
M204 S5000
G3 X147.071 Y130.341 I-1.815 J-3.256 E.01829
G3 X147.245 Y128.549 I-.321 J-.935 E.12149
G1 X147.704 Y128.853 E.01691
G2 X146.773 Y121.994 I-20.839 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228894
G1 F2281
M204 S6000
G3 X145.362 Y137.919 I-20.513 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z5.2 F42000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.228891
G1 F2281
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/76
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.2 I-.723 J-.979 P1  F42000
G1 X118.173 Y144.159 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X118.152 Y144.182 E.00095
G3 X116.542 Y144.009 I-.744 J-.653 E.05823
G2 X118.33 Y143.172 I-1.295 J-5.094 E.06102
G1 X118.337 Y143.188 E.00053
G3 X118.264 Y144.025 I-.929 J.341 E.02669
G1 X118.207 Y144.11 E.00313
; WIPE_START
G1 F3000
M204 S6000
G1 X118.152 Y144.182 E-.03447
G1 X118.02 Y144.312 E-.07029
G1 X117.857 Y144.416 E-.07372
G1 X117.676 Y144.486 E-.07357
G1 X117.485 Y144.52 E-.07368
G1 X117.292 Y144.516 E-.07347
G1 X117.103 Y144.474 E-.07375
G1 X116.925 Y144.397 E-.07348
G1 X116.767 Y144.286 E-.07363
G1 X116.632 Y144.146 E-.07367
G1 X116.542 Y144.009 E-.06223
G1 X116.552 Y144.006 E-.00404
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


G1 X116.91 Y144.149 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.298673
G1 F2279
M204 S6000
G1 X117.91 Y144.149 E.02084
M204 S10000
G1 X117.617 Y144.299 F42000
; LINE_WIDTH: 0.248251
G1 F2279
M204 S6000
G2 X118.202 Y143.531 I-23.77 J-18.729 E.01616
M204 S10000
G1 X118.196 Y143.639 F42000
; LINE_WIDTH: 0.419618
G1 F2279
M204 S6000
G1 X117.889 Y143.9 E.01237
G3 X117.81 Y143.961 I-.662 J-.781 E.00307
; LINE_WIDTH: 0.472549
G3 X117.455 Y144.122 I-.603 J-.858 E.01373
; LINE_WIDTH: 0.43859
G1 X117.004 Y144.215 E.01483
; WIPE_START
G1 F9098.506
G1 X117.455 Y144.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.212 Y136.527 Z5.4 F42000
G1 X120.7 Y111.557 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G2 X119.056 Y110.462 I-3.688 J3.757 E.06103
G1 X119.066 Y110.449 E.00049
G3 X119.919 Y110.075 I.778 J.615 E.02981
G3 X120.728 Y111.503 I-.085 J.991 E.05931
M204 S10000
G1 X120.625 Y111.196 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203521
G1 F2279
M204 S6000
G2 X120.205 Y110.355 I-51.31 J25.121 E.0123
M204 S10000
G1 X120.424 Y110.524 F42000
; LINE_WIDTH: 0.296519
G1 F2279
M204 S6000
G1 X119.442 Y110.379 E.0205
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423248
G1 F2279
M204 S6000
G1 X119.938 Y110.472 E.0134
; LINE_WIDTH: 0.469239
G3 X120.305 Y110.701 I-.378 J1.014 E.01517
; LINE_WIDTH: 0.441024
G1 X120.365 Y110.762 E.00277
; LINE_WIDTH: 0.405167
G1 X120.635 Y111.093 E.01261
; WIPE_START
G1 F9937.986
G1 X120.365 Y110.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.519 Y117.713 Z5.4 F42000
G1 X130.272 Y132.592 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2279
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z5.4 F42000
G1 X130.931 Y123.798 Z5.4
G1 Z5
G1 E.8 F1800
G1 F2279
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2279
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z5.4 F42000
G1 X130.512 Y131.808 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X130.408 Y121.371 E.00296
G1 X131.29 Y121.437 E.02716
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2279
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2279
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.949
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z5.4 F42000
G1 X132.116 Y133.122 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2279
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.111 Y126.102 Z5.4 F42000
G1 X135.196 Y125.902 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X135.352 Y125.858 E.00498
G3 X135.908 Y125.789 I.625 J2.739 E.01722
G1 X136.048 Y125.789 E.0043
G3 X135.083 Y125.934 I-.07 J2.809 E.5123
G1 X135.139 Y125.918 E.00179
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.08438
G1 X135.628 Y125.81 E-.1064
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10646
G1 X136.872 Y125.934 E-.10633
G1 X137.093 Y126.021 E-.0902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.802 Y131.21 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F2279
M204 S5000
G1 X137.705 Y131.272 E.00354
G3 X135.898 Y125.409 I-1.737 J-2.675 E.3622
G3 X136.167 Y125.414 I.079 J2.702 E.00828
G3 X137.962 Y131.086 I-.2 J3.183 E.23554
G1 X137.849 Y131.173 E.00438
; WIPE_START
G1 F3000
M204 S6000
G1 X137.705 Y131.272 E-.0665
G1 X137.433 Y131.436 E-.12073
G1 X137.143 Y131.567 E-.12083
G1 X136.842 Y131.669 E-.1209
G1 X136.532 Y131.739 E-.12084
G1 X136.216 Y131.779 E-.12087
G1 X135.981 Y131.785 E-.08934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.449 Y130.211 Z5.4 F42000
G1 X147.134 Y129.434 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X146.805 Y129.587 E.01203
G3 X146.78 Y129.217 I-.057 J-.182 E.02282
G1 X146.833 Y129.235 E.00183
G1 X147.084 Y129.401 E.01
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F2279
M204 S6000
G1 X147.831 Y129.559 E.00485
G1 X146.947 Y129.968 E.03229
G3 X146.756 Y128.807 I-.2 J-.563 E.06931
G3 X147.046 Y128.888 I-.036 J.693 E.01006
G1 X147.792 Y129.381 E.02967
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G3 X147.071 Y130.341 I-1.814 J-3.253 E.01829
G3 X147.245 Y128.549 I-.323 J-.936 E.12166
G1 X147.704 Y128.853 E.01691
G2 X146.773 Y121.994 I-20.839 J-.662 E.21368
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.885 J7.399 E.55871
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03875
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F2279
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.228891
G1 F2279
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/76
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.4 I-.722 J-.979 P1  F42000
G1 X118.208 Y144.11 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X118.152 Y144.182 E.00279
G3 X116.542 Y144.009 I-.744 J-.653 E.05823
G2 X118.33 Y143.172 I-1.295 J-5.094 E.06102
G1 X118.337 Y143.188 E.00054
G3 X118.264 Y144.026 I-.929 J.341 E.02669
G1 X118.241 Y144.06 E.00128
; WIPE_START
G1 F3000
M204 S6000
G1 X118.152 Y144.182 E-.05726
G1 X118.016 Y144.316 E-.07258
G1 X117.857 Y144.416 E-.0713
G1 X117.676 Y144.486 E-.07364
G1 X117.486 Y144.52 E-.07364
G1 X117.292 Y144.516 E-.07349
G1 X117.103 Y144.474 E-.07371
G1 X116.925 Y144.397 E-.07361
G1 X116.767 Y144.286 E-.07354
G1 X116.632 Y144.146 E-.07371
G1 X116.569 Y144.05 E-.04354
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


G1 X116.91 Y144.149 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.2817
G1 F2279
M204 S6000
G2 X117.897 Y144.159 I.879 J-37.822 E.01921
M204 S10000
G1 X117.615 Y144.299 F42000
; LINE_WIDTH: 0.248384
G1 F2279
M204 S6000
G2 X118.202 Y143.532 I-25.815 J-20.362 E.01618
M204 S10000
G1 X118.196 Y143.638 F42000
; LINE_WIDTH: 0.419659
G1 F2279
M204 S6000
G1 X117.889 Y143.9 E.0124
G3 X117.811 Y143.96 I-.658 J-.778 E.00304
; LINE_WIDTH: 0.472548
G3 X117.455 Y144.122 I-.602 J-.855 E.01375
; LINE_WIDTH: 0.43881
G1 X117.004 Y144.215 E.01484
; WIPE_START
G1 F9093.44
G1 X117.455 Y144.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.212 Y136.527 Z5.6 F42000
G1 X120.7 Y111.557 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G2 X119.056 Y110.462 I-3.688 J3.757 E.06103
G1 X119.065 Y110.45 E.00046
G3 X119.92 Y110.075 I.779 J.614 E.02986
G3 X120.728 Y111.503 I-.086 J.991 E.05929
M204 S10000
G1 X120.625 Y111.196 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.200696
G1 F2279
M204 S6000
G2 X120.203 Y110.354 I-43.566 J21.31 E.0121
M204 S10000
G1 X120.424 Y110.524 F42000
; LINE_WIDTH: 0.296204
G1 F2279
M204 S6000
G1 X119.442 Y110.379 E.02048
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423218
G1 F2279
M204 S6000
G1 X119.937 Y110.471 E.01337
; LINE_WIDTH: 0.469209
G3 X120.305 Y110.701 I-.377 J1.014 E.01519
; LINE_WIDTH: 0.441152
G1 X120.365 Y110.762 E.00276
; LINE_WIDTH: 0.404942
G1 X120.635 Y111.093 E.01261
; WIPE_START
G1 F9944.157
M73 P71 R8
G1 X120.365 Y110.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.519 Y117.712 Z5.6 F42000
G1 X130.272 Y132.592 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2279
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z5.6 F42000
G1 X130.931 Y123.798 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2279
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2279
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z5.6 F42000
G1 X130.512 Y131.808 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.321 Y121.365 E.41728
G1 X131.29 Y121.437 E.02984
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2279
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2279
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.963
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z5.6 F42000
G1 X132.116 Y133.122 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F2279
M204 S6000
G1 X130.446 Y132.997 E.05113
; WIPE_START
G1 F9608.963
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.094 Y126.095 Z5.6 F42000
G1 X135.173 Y125.909 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X135.352 Y125.858 E.00572
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X135.083 Y125.934 I-.07 J2.809 E.5123
G1 X135.115 Y125.925 E.00104
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.0935
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10652
G1 X136.603 Y125.858 E-.10638
G1 X136.873 Y125.934 E-.10647
G1 X137.071 Y126.012 E-.08094
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.78 Y131.226 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
G1 F2279
M204 S5000
G1 X137.57 Y131.355 E.00758
G3 X135.898 Y125.409 I-1.602 J-2.758 E.35736
G3 X136.163 Y125.414 I.079 J2.66 E.00815
G3 X137.836 Y131.182 I-.196 J3.183 E.24051
G1 X137.827 Y131.189 E.00034
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.355 E-.11641
G1 X137.29 Y131.506 E-.12077
G1 X136.994 Y131.622 E-.12082
G1 X136.532 Y131.739 E-.18116
G1 X136.216 Y131.779 E-.12087
G1 X135.953 Y131.785 E-.09997
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.422 Y130.215 Z5.6 F42000
G1 X147.134 Y129.434 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X146.805 Y129.586 E.01203
G3 X146.775 Y129.217 I-.057 J-.181 E.02264
G1 X146.822 Y129.23 E.00163
G3 X147.087 Y129.397 I-.835 J1.619 E.01041
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F2279
M204 S6000
G1 X147.831 Y129.559 E.00486
G1 X146.947 Y129.968 E.0323
G3 X146.757 Y128.807 I-.2 J-.563 E.06934
G3 X147.046 Y128.888 I-.01 J.598 E.01005
G1 X147.792 Y129.38 E.02966
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G3 X147.07 Y130.341 I-1.805 J-3.234 E.0183
G3 X147.245 Y128.549 I-.321 J-.935 E.12147
G1 X147.704 Y128.853 E.01692
G2 X146.773 Y121.994 I-20.838 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.873 Y120.6 E.0194
G1 X146.89 Y120.601 E.00052
G3 X145.576 Y138.132 I-18.89 J7.399 E.5587
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228897
G1 F2279
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z5.6 F42000
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.228893
G1 F2279
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/76
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.6 I-.722 J-.98 P1  F42000
G1 X118.242 Y144.063 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X118.151 Y144.182 E.00462
G3 X116.542 Y144.009 I-.743 J-.654 E.05821
G2 X118.33 Y143.172 I-1.299 J-5.102 E.06102
G1 X118.337 Y143.188 E.00053
G3 X118.272 Y144.011 I-.929 J.341 E.02617
; WIPE_START
G1 F3000
M204 S6000
G1 X118.151 Y144.182 E-.07979
G1 X118.016 Y144.316 E-.07231
G1 X117.857 Y144.416 E-.07112
G1 X117.677 Y144.486 E-.07369
G1 X117.486 Y144.52 E-.0736
G1 X117.293 Y144.516 E-.07354
G1 X117.103 Y144.474 E-.07371
G1 X116.925 Y144.397 E-.07368
G1 X116.767 Y144.286 E-.07357
G1 X116.632 Y144.146 E-.07367
G1 X116.602 Y144.099 E-.02133
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


G1 X116.911 Y144.149 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.280346
G1 F2279
M204 S6000
G2 X117.896 Y144.16 I1.011 J-46.801 E.01907
M204 S10000
G1 X117.675 Y144.28 F42000
; LINE_WIDTH: 0.198575
G1 F2279
M204 S6000
G2 X118.202 Y143.516 I-41.25 J-29.018 E.01178
M204 S10000
G1 X118.196 Y143.636 F42000
; LINE_WIDTH: 0.419129
G1 F2279
M204 S6000
G1 X117.89 Y143.899 E.01239
G3 X117.81 Y143.961 I-.666 J-.785 E.00308
; LINE_WIDTH: 0.469505
G3 X117.414 Y144.131 I-.606 J-.862 E.01511
; LINE_WIDTH: 0.429626
G1 X117.004 Y144.214 E.0132
; WIPE_START
G1 F9309.418
G1 X117.414 Y144.131 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.18 Y136.537 Z5.8 F42000
G1 X120.7 Y111.557 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G2 X119.056 Y110.462 I-3.689 J3.758 E.06103
G1 X119.064 Y110.451 E.00043
G3 X119.92 Y110.075 I.78 J.614 E.0299
G3 X120.728 Y111.503 I-.086 J.991 E.05929
M204 S10000
G1 X120.625 Y111.196 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.197989
G1 F2279
M204 S6000
G2 X120.201 Y110.354 I-39.653 J19.412 E.01191
M204 S10000
G1 X120.424 Y110.524 F42000
; LINE_WIDTH: 0.295915
G1 F2279
M204 S6000
G1 X119.442 Y110.379 E.02045
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423124
G1 F2279
M204 S6000
G1 X119.936 Y110.471 E.01335
; LINE_WIDTH: 0.469909
G3 X120.083 Y110.538 I-.457 J1.2 E.00562
G1 X120.24 Y110.644 E.00659
; LINE_WIDTH: 0.453827
G3 X120.365 Y110.762 I-.765 J.927 E.00574
; LINE_WIDTH: 0.40495
G1 X120.635 Y111.094 E.01262
; WIPE_START
G1 F9943.94
G1 X120.365 Y110.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.519 Y117.712 Z5.8 F42000
G1 X130.272 Y132.592 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X132.348 Y132.747 E.06905
G1 X132.29 Y133.527 E.02593
G1 X130.214 Y133.371 E.06905
G1 X130.268 Y132.652 E.02394
M204 S10000
G1 X130.092 Y132.17 F42000
G1 F2279
M204 S6000
G1 X132.785 Y132.372 E.08956
G1 X132.665 Y133.963 E.05294
G1 X129.778 Y133.747 E.09606
G1 X129.897 Y132.155 E.05294
G1 X130.032 Y132.166 E.00451
; WIPE_START
G1 F5400
G1 X132.027 Y132.315 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.053 Y124.745 Z5.8 F42000
G1 X130.931 Y123.798 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F2279
M204 S6000
G1 X130.99 Y123.019 E.02593
G1 X133.066 Y123.174 E.06905
G1 X133.007 Y123.954 E.02593
G1 X130.991 Y123.803 E.06706
M204 S10000
G1 X130.495 Y124.174 F42000
G1 F2279
M204 S6000
G1 X130.614 Y122.582 E.05294
G1 X133.502 Y122.799 E.09606
G1 X133.383 Y124.39 E.05294
G1 X130.555 Y124.178 E.09407
; WIPE_START
G1 F5400
G1 X130.614 Y122.582 E-.60686
G1 X131.016 Y122.612 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.599 Y130.233 Z5.8 F42000
G1 X130.512 Y131.808 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.29 Y121.437 E.03011
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
M204 S10000
G1 X130.009 Y131.967 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F2279
M204 S6000
G1 X130.578 Y124.377 E.36468
; WIPE_START
G1 F6123.087
G1 X130.428 Y126.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.163 Y123.424 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.417571
G1 F2279
M204 S6000
G1 X132.833 Y123.549 E.05113
; WIPE_START
G1 F9608.963
G1 X131.163 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.91 Y131.02 Z5.8 F42000
G1 X132.116 Y133.122 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.417562
G1 F2279
M204 S6000
G1 X130.446 Y132.997 E.05112
; WIPE_START
G1 F9609.189
G1 X132.116 Y133.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.08 Y126.089 Z5.8 F42000
G1 X135.152 Y125.92 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G1 X135.352 Y125.858 E.00645
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X134.951 Y125.982 I-.07 J2.809 E.50799
G1 X135.094 Y125.938 E.00461
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.10263
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10641
G1 X136.873 Y125.934 E-.10645
G1 X137.049 Y126.003 E-.07183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.773 Y131.231 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
G1 F2279
M204 S5000
G1 X137.569 Y131.355 E.00732
G3 X135.898 Y125.409 I-1.603 J-2.757 E.35738
G3 X136.159 Y125.414 I.079 J2.62 E.00803
G3 X137.836 Y131.182 I-.193 J3.184 E.24058
G1 X137.82 Y131.194 E.00061
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.355 E-.11319
G1 X137.29 Y131.506 E-.12076
G1 X136.993 Y131.622 E-.12085
G1 X136.688 Y131.708 E-.12077
G1 X136.374 Y131.763 E-.12084
G1 X135.944 Y131.784 E-.16358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.414 Y130.215 Z5.8 F42000
G1 X147.134 Y129.434 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
M204 S6000
G1 X146.805 Y129.586 E.01203
G3 X146.78 Y129.217 I-.057 J-.182 E.02283
G1 X146.832 Y129.235 E.00182
G1 X147.084 Y129.401 E.01001
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F2279
M204 S6000
G1 X147.831 Y129.559 E.00486
G1 X146.947 Y129.968 E.03229
G3 X146.756 Y128.807 I-.2 J-.563 E.06931
G3 X147.046 Y128.887 I-.036 J.694 E.01005
G1 X147.792 Y129.38 E.02967
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
M204 S5000
G3 X147.07 Y130.341 I-1.81 J-3.245 E.0183
G3 X147.245 Y128.549 I-.323 J-.936 E.12164
G1 X147.704 Y128.853 E.01692
G2 X146.773 Y121.994 I-20.838 J-.662 E.21367
G2 X146.243 Y120.552 I-15.384 J4.832 E.04721
G1 X146.85 Y120.598 E.01868
G1 X146.89 Y120.601 E.00124
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228896
G1 F2279
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.228892
G1 F2279
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/76
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z5.8 I-.721 J-.981 P1  F42000
G1 X118.294 Y143.969 Z5.8
G1 Z5.6
M73 P72 R8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G1 X118.263 Y144.026 E.00199
G3 X116.542 Y144.009 I-.856 J-.498 E.06412
G2 X118.33 Y143.172 I-1.299 J-5.102 E.06102
G1 X118.337 Y143.188 E.00054
G3 X118.344 Y143.851 I-.929 J.341 E.02078
G1 X118.317 Y143.914 E.00209
; WIPE_START
G1 F3000
M204 S6000
G1 X118.263 Y144.026 E-.04737
G1 X118.154 Y144.185 E-.07324
G1 X118.015 Y144.316 E-.07268
G1 X117.858 Y144.416 E-.07067
G1 X117.677 Y144.486 E-.07367
G1 X117.486 Y144.52 E-.07366
G1 X117.293 Y144.516 E-.07358
G1 X117.103 Y144.474 E-.07369
G1 X116.926 Y144.397 E-.07365
G1 X116.767 Y144.286 E-.07368
G1 X116.668 Y144.183 E-.0541
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


G1 X116.91 Y144.149 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.279651
G1 F2644
M204 S6000
G2 X117.894 Y144.161 I1.037 J-41.756 E.019
M204 S10000
G1 X117.676 Y144.28 F42000
; LINE_WIDTH: 0.195586
G1 F2644
M204 S6000
G2 X118.202 Y143.516 I-47.037 J-32.943 E.01153
M204 S10000
G1 X118.196 Y143.637 F42000
; LINE_WIDTH: 0.41928
G1 F2644
M204 S6000
G1 X117.89 Y143.9 E.01238
G3 X117.81 Y143.961 I-.666 J-.787 E.00309
; LINE_WIDTH: 0.469475
G3 X117.414 Y144.131 I-.605 J-.862 E.01511
; LINE_WIDTH: 0.429573
G1 X117.004 Y144.214 E.01318
; WIPE_START
G1 F9310.681
G1 X117.414 Y144.131 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.18 Y136.537 Z6 F42000
G1 X120.7 Y111.557 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G2 X119.056 Y110.462 I-3.689 J3.758 E.06103
G1 X119.064 Y110.451 E.0004
G3 X119.92 Y110.075 I.78 J.613 E.02993
G3 X120.728 Y111.503 I-.086 J.991 E.05928
M204 S10000
G1 X120.625 Y111.196 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.194867
G1 F2644
M204 S6000
G2 X120.201 Y110.354 I-41.012 J20.108 E.01167
M204 S10000
G1 X120.423 Y110.523 F42000
; LINE_WIDTH: 0.295483
G1 F2644
M204 S6000
G1 X119.441 Y110.38 E.02044
M204 S10000
G1 X119.528 Y110.334 F42000
; LINE_WIDTH: 0.423086
G1 F2644
M204 S6000
G1 X119.936 Y110.471 E.01334
; LINE_WIDTH: 0.469864
G3 X120.083 Y110.538 I-.455 J1.195 E.00562
G1 X120.24 Y110.643 E.00659
; LINE_WIDTH: 0.453951
G3 X120.364 Y110.762 I-.764 J.927 E.00574
; LINE_WIDTH: 0.404917
G1 X120.635 Y111.094 E.01264
; WIPE_START
G1 F9944.855
G1 X120.364 Y110.762 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.845 Y117.554 Z6 F42000
G1 X132.144 Y133.75 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
M204 S6000
G1 X132.25 Y132.332 E.04719
G1 X132.785 Y132.372 E.01778
G1 X132.665 Y133.963 E.05294
G1 X132.131 Y133.923 E.01777
G1 X132.14 Y133.81 E.00376
; WIPE_START
G1 F5400
G1 X132.25 Y132.332 E-.56341
G1 X132.766 Y132.37 E-.19659
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.844 Y124.738 Z6 F42000
G1 X132.848 Y124.35 Z6
G1 Z5.6
G1 E.8 F1800
G1 F2644
M204 S6000
G1 X132.968 Y122.759 E.05294
G1 X133.502 Y122.799 E.01778
G1 X133.383 Y124.39 E.05294
G1 X132.908 Y124.355 E.01578
; WIPE_START
G1 F5400
G1 X132.968 Y122.759 E-.60686
G1 X133.369 Y122.789 E-.15314
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.065 Y130.065 Z6 F42000
G1 X130.512 Y131.808 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G1 X133.205 Y132.01 E.08296
G1 X133.027 Y134.384 E.07313
G1 X130.335 Y134.182 E.08296
G1 X130.275 Y134.98 E.02458
G1 X129.298 Y134.906 E.03011
G1 X130.312 Y121.364 E.41728
G1 X131.29 Y121.437 E.03011
G1 X131.23 Y122.235 E.02458
G1 X133.922 Y122.437 E.08296
G1 X133.744 Y124.81 E.07313
G1 X131.052 Y124.609 E.08296
G1 X130.517 Y131.749 E.22001
; WIPE_START
M73 P72 R7
G1 F3000
M204 S6000
G1 X132.507 Y131.942 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.502 Y132.555 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.171643
G1 F2644
M204 S6000
G1 X132.413 Y133.74 E.01247
; WIPE_START
G1 F15000
G1 X132.502 Y132.555 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.548 Y134.717 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2644
M204 S2000
G1 X130.13 Y134.135 E.02528
G1 X131.287 Y134.045
G1 X131.923 Y133.409 E.02765
G1 X131.623 Y133.176
G1 X130.791 Y134.008 E.03616
G1 X130.295 Y133.971
G1 X132.035 Y132.231 E.07562
G1 X131.632 Y132.1
G1 X129.561 Y134.172 E.09001
G1 X129.604 Y133.595
G1 X131.136 Y132.063 E.06658
G1 X130.64 Y132.026
G1 X129.647 Y133.019 E.04314
G1 X129.69 Y132.442
G1 X130.303 Y131.83 E.02663
G1 X130.346 Y131.253
G1 X129.733 Y131.866 E.02663
G1 X129.777 Y131.289
G1 X130.389 Y130.677 E.02663
G1 X130.432 Y130.1
G1 X129.82 Y130.713 E.02663
G1 X129.863 Y130.136
G1 X130.476 Y129.524 E.02663
G1 X130.519 Y128.947
G1 X129.906 Y129.56 E.02663
G1 X129.949 Y128.983
G1 X130.562 Y128.371 E.02663
G1 X130.605 Y127.794
G1 X129.993 Y128.407 E.02663
G1 X130.036 Y127.831
G1 X130.648 Y127.218 E.02663
G1 X130.692 Y126.641
G1 X130.079 Y127.254 E.02663
G1 X130.122 Y126.678
G1 X130.735 Y126.065 E.02663
G1 X130.778 Y125.488
G1 X130.165 Y126.101 E.02663
G1 X130.209 Y125.525
G1 X130.821 Y124.912 E.02663
G1 X131.809 Y124.457
G1 X132.446 Y123.821 E.02765
G1 X132.357 Y123.376
G1 X131.313 Y124.42 E.04537
G1 X130.252 Y124.948
G1 X132.65 Y122.55 E.10423
G1 X132.154 Y122.512
G1 X130.295 Y124.372 E.0808
G1 X130.338 Y123.795
G1 X131.658 Y122.475 E.05736
G1 X131.162 Y122.438
G1 X130.381 Y123.219 E.03393
G1 X130.425 Y122.642
G1 X131.037 Y122.03 E.02662
G1 X130.916 Y121.617
G1 X130.468 Y122.066 E.01949
; WIPE_START
G1 F3000
M204 S6000
G1 X130.916 Y121.617 E-.24104
G1 X131.037 Y122.03 E-.16328
G1 X130.425 Y122.642 E-.32926
G1 X130.419 Y122.712 E-.02642
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.253 Y130.342 Z6 F42000
G1 X130.176 Y133.853 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0958433
G1 F2644
M204 S6000
G1 X130.019 Y134.025 E.001
; WIPE_START
G1 F15000
G1 X130.176 Y133.853 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.917 Y126.421 Z6 F42000
G1 X132.758 Y122.832 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.170087
G1 F2644
M204 S6000
G1 X132.326 Y123.228 E.00608
G1 X132.289 Y123.308 E.00091
M204 S10000
G1 X132.582 Y123.812 F42000
; LINE_WIDTH: 0.156509
G1 F2644
M204 S6000
G1 X132.619 Y123.914 E.001
G1 X132.6 Y124.536 E.00576
M204 S10000
G1 X133.131 Y124.167 F42000
; LINE_WIDTH: 0.17168
G1 F2644
M204 S6000
G1 X133.22 Y122.982 E.01247
; WIPE_START
G1 F15000
G1 X133.131 Y124.167 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.128 Y125.922 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G1 X135.216 Y125.893 E.00285
G3 X135.908 Y125.789 I.761 J2.705 E.02153
G1 X136.048 Y125.789 E.0043
G3 X134.951 Y125.982 I-.07 J2.809 E.50799
G1 X135.072 Y125.942 E.00391
; WIPE_START
G1 F3000
M204 S6000
G1 X135.216 Y125.893 E-.05808
G1 X135.49 Y125.83 E-.10657
G1 X135.908 Y125.789 E-.15955
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10652
G1 X136.603 Y125.858 E-.10644
G1 X137.004 Y125.982 E-.15954
G1 X137.028 Y125.993 E-.01007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.766 Y131.236 Z6 F42000
G1 Z5.6
G1 E.8 F1800
G1 F2644
M204 S5000
G1 X137.57 Y131.357 E.00706
G3 X135.739 Y125.417 I-1.6 J-2.759 E.35224
G3 X136.156 Y125.414 I.233 J3.414 E.0128
G3 X137.837 Y131.184 I-.185 J3.184 E.24091
G1 X137.814 Y131.2 E.00087
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.357 E-.11001
G1 X137.29 Y131.505 E-.12073
G1 X136.993 Y131.622 E-.12091
G1 X136.687 Y131.708 E-.12082
G1 X136.374 Y131.763 E-.12079
G1 X136.057 Y131.787 E-.1209
G1 X135.937 Y131.784 E-.04585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.406 Y130.216 Z6 F42000
G1 X147.134 Y129.434 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
M204 S6000
G1 X146.805 Y129.586 E.01203
G3 X146.775 Y129.217 I-.057 J-.181 E.02265
G1 X146.822 Y129.23 E.00163
G3 X147.087 Y129.397 I-.836 J1.622 E.0104
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F2644
M204 S6000
G1 X147.831 Y129.559 E.00486
G1 X146.947 Y129.968 E.03231
G3 X146.757 Y128.807 I-.199 J-.563 E.06933
G3 X147.045 Y128.887 I-.011 J.599 E.01005
G1 X147.792 Y129.38 E.02966
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
M204 S5000
G3 X147.07 Y130.341 I-1.809 J-3.243 E.01831
G3 X147.245 Y128.549 I-.321 J-.936 E.12146
G1 X147.704 Y128.853 E.01692
G2 X146.773 Y121.994 I-20.838 J-.662 E.21366
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.826 Y120.596 E.01797
G1 X146.89 Y120.601 E.00196
G3 X145.576 Y138.132 I-18.897 J7.399 E.55868
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228899
G1 F2644
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z6 F42000
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.228894
G1 F2644
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/76
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6 I.47 J-1.123 P1  F42000
G1 X120.7 Y111.557 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
M204 S5000
G2 X119.056 Y110.462 I-3.689 J3.758 E.06104
G1 X119.063 Y110.452 E.00037
G3 X119.921 Y110.075 I.781 J.612 E.02998
G3 X120.728 Y111.504 I-.087 J.991 E.05926
; WIPE_START
G1 F3000
M204 S6000
G1 X120.388 Y111.274 E-.15577
G1 X119.945 Y110.94 E-.21096
G1 X119.524 Y110.686 E-.18671
G1 X119.056 Y110.462 E-.1971
G1 X119.063 Y110.452 E-.00461
G1 X119.072 Y110.443 E-.00484
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


G1 X119.441 Y110.38 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.295082
G1 F1751
M204 S6000
G1 X120.423 Y110.524 E.02041
M204 S10000
G1 X120.199 Y110.353 F42000
; LINE_WIDTH: 0.192119
G1 F1751
M204 S6000
G3 X120.625 Y111.196 I-35.521 J18.464 E.01148
M204 S10000
G1 X120.632 Y111.119 F42000
; LINE_WIDTH: 0.381976
G1 F1751
M204 S6000
G2 X120.379 Y110.779 I-3.625 J2.432 E.01171
; LINE_WIDTH: 0.436926
G1 X120.304 Y110.7 E.00351
; LINE_WIDTH: 0.469139
G2 X119.936 Y110.471 I-.742 J.782 E.01518
; LINE_WIDTH: 0.423146
G1 X119.528 Y110.334 E.01333
; WIPE_START
G1 F9468.075
G1 X119.936 Y110.471 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.197 Y114.836 Z6.2 F42000
G1 X147.134 Y129.434 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
M204 S6000
G1 X146.805 Y129.586 E.01203
G3 X146.775 Y129.217 I-.058 J-.181 E.02265
G1 X146.822 Y129.23 E.00164
G3 X147.087 Y129.397 I-.851 J1.645 E.01041
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1751
M204 S6000
G1 X147.831 Y129.559 E.00488
G1 X146.947 Y129.968 E.03232
G3 X146.757 Y128.807 I-.199 J-.563 E.06933
G3 X147.045 Y128.887 I-.011 J.6 E.01003
G1 X147.792 Y129.38 E.02967
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
M204 S5000
G3 X147.07 Y130.341 I-1.809 J-3.243 E.01831
G3 X147.245 Y128.549 I-.321 J-.936 E.12144
G1 X147.704 Y128.852 E.01693
G2 X146.773 Y121.994 I-20.838 J-.662 E.21366
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.803 Y120.594 E.01725
G1 X146.89 Y120.601 E.00267
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228898
G1 F1751
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.228892
G1 F1751
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.127 E.13113
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z6.2 F42000
G1 X133.007 Y123.954 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1751
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.099 Y125.929 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1751
M204 S5000
G1 X135.352 Y125.858 E.00808
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X135.042 Y125.948 I-.07 J2.809 E.51098
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.12269
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
M73 P73 R7
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10639
G1 X136.872 Y125.934 E-.1064
G1 X136.999 Y125.984 E-.05182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.758 Y131.24 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F1751
M204 S5000
G1 X137.57 Y131.356 E.00679
G3 X135.739 Y125.417 I-1.6 J-2.759 E.35226
G3 X136.152 Y125.414 I.233 J3.409 E.01268
G3 X137.837 Y131.184 I-.181 J3.184 E.24102
G1 X137.807 Y131.205 E.00113
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.356 E-.10673
G1 X137.29 Y131.506 E-.12079
G1 X136.993 Y131.622 E-.12085
G1 X136.688 Y131.708 E-.12075
G1 X136.374 Y131.763 E-.12088
G1 X136.057 Y131.787 E-.12087
G1 X135.928 Y131.784 E-.04913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1751
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1751
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1751
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z6.2 F42000
G1 X118.33 Y143.172 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1751
M204 S5000
G1 X118.337 Y143.188 E.00054
G3 X116.542 Y144.009 I-.929 J.341 E.09083
G2 X118.281 Y143.207 I-1.299 J-5.103 E.05918
M204 S10000
G1 X118.202 Y143.516 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.192453
G1 F1751
M204 S6000
G3 X117.673 Y144.281 I-34.606 J-23.356 E.01133
M204 S10000
G1 X117.894 Y144.161 F42000
; LINE_WIDTH: 0.279222
G1 F1751
M204 S6000
G3 X116.909 Y144.148 I-.054 J-31.879 E.01898
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429472
G1 F1751
M204 S6000
G1 X117.413 Y144.131 E.01315
; LINE_WIDTH: 0.469453
G2 X117.809 Y143.962 I-.209 J-1.034 E.01508
; LINE_WIDTH: 0.419424
G2 X117.89 Y143.9 I-.588 J-.851 E.00312
G1 X118.196 Y143.636 E.01241
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9561.665
G1 X117.89 Y143.9 E-.60723
G1 X117.809 Y143.962 E-.15277
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/76
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G2 X119.056 Y110.462 I-3.69 J3.759 E.06104
G1 X119.063 Y110.453 E.00034
G3 X119.972 Y110.081 I.781 J.611 E.03159
G3 X120.728 Y111.504 I-.13 J.981 E.05786
; WIPE_START
G1 F3000
M204 S6000
G1 X120.391 Y111.277 E-.15453
G1 X119.944 Y110.94 E-.21261
G1 X119.524 Y110.685 E-.18669
G1 X119.056 Y110.462 E-.19692
G1 X119.063 Y110.453 E-.00425
G1 X119.072 Y110.443 E-.005
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


G1 X119.441 Y110.379 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29478
G1 F1770
M204 S6000
G1 X120.425 Y110.523 E.02041
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.382015
G1 F1770
M204 S6000
G1 X119.491 Y110.353 E.0286
M204 S10000
G1 X119.55 Y110.326 F42000
; LINE_WIDTH: 0.429329
G1 F1770
M204 S6000
G1 X119.944 Y110.474 E.01326
; LINE_WIDTH: 0.468408
G3 X120.328 Y110.723 I-.365 J.985 E.01599
; LINE_WIDTH: 0.410107
G1 X120.635 Y111.088 E.01428
M204 S10000
G1 X120.202 Y110.356 F42000
; LINE_WIDTH: 0.189289
G1 F1770
M204 S6000
G3 X120.625 Y111.195 I-42.231 J21.797 E.01121
M204 S10000
G1 X120.629 Y111.15 F42000
; LINE_WIDTH: 0.331554
G1 F1770
M204 S6000
G1 X120.087 Y110.308 E.02356
; WIPE_START
G1 F12472.559
G1 X120.629 Y111.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.484 Z6.4 F42000
G1 X147.134 Y129.434 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X146.806 Y129.586 E.01202
G3 X146.781 Y129.217 I-.056 J-.181 E.02275
G1 X146.832 Y129.234 E.0018
G1 X147.084 Y129.401 E.01002
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1770
M204 S6000
G1 X147.831 Y129.56 E.00488
G1 X146.947 Y129.968 E.03231
G3 X146.756 Y128.807 I-.199 J-.563 E.06928
G3 X147.045 Y128.887 I-.037 J.698 E.01005
G1 X147.792 Y129.38 E.02968
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G3 X147.07 Y130.341 I-1.808 J-3.245 E.01831
G3 X147.245 Y128.549 I-.322 J-.936 E.12161
G1 X147.704 Y128.853 E.01693
G2 X146.773 Y121.994 I-20.838 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.78 Y120.593 E.01653
G1 X146.89 Y120.601 E.00339
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228898
G1 F1770
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13114
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.228892
G1 F1770
M204 S6000
G2 X146.647 Y120.779 I-20.575 J-1.127 E.13113
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z6.4 F42000
G1 X133.007 Y123.954 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1770
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.079 Y125.943 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X135.352 Y125.858 E.00879
G3 X135.908 Y125.789 I.625 J2.739 E.01723
G1 X136.048 Y125.789 E.0043
G3 X134.951 Y125.982 I-.07 J2.809 E.50799
G1 X135.021 Y125.96 E.00227
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.13155
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10638
G1 X136.872 Y125.934 E-.10641
G1 X136.978 Y125.975 E-.04297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.751 Y131.245 Z6.4 F42000
G1 Z6
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X137.57 Y131.356 E.00651
G3 X135.739 Y125.417 I-1.6 J-2.759 E.35227
G3 X136.148 Y125.413 I.233 J3.407 E.01256
G3 X137.837 Y131.184 I-.178 J3.184 E.24113
G1 X137.799 Y131.21 E.00141
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.356 E-.10322
G1 X137.29 Y131.506 E-.12084
G1 X136.993 Y131.622 E-.12085
G1 X136.687 Y131.708 E-.12081
G1 X136.374 Y131.763 E-.12079
G1 X136.057 Y131.787 E-.1209
G1 X135.919 Y131.783 E-.05258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1770
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z6.4 F42000
G1 X118.33 Y143.172 Z6.4
G1 Z6
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X118.337 Y143.188 E.00054
G3 X116.542 Y144.009 I-.929 J.34 E.09082
G2 X118.281 Y143.207 I-1.3 J-5.104 E.05918
M204 S10000
G1 X118.202 Y143.516 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.189617
G1 F1770
M204 S6000
G3 X117.675 Y144.28 I-37.798 J-25.506 E.0111
M204 S10000
G1 X117.894 Y144.161 F42000
; LINE_WIDTH: 0.278816
G1 F1770
M204 S6000
G3 X116.91 Y144.149 I.033 J-40.673 E.01892
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.42947
G1 F1770
M204 S6000
G1 X117.413 Y144.131 E.01314
; LINE_WIDTH: 0.46945
G2 X117.808 Y143.962 I-.209 J-1.034 E.01506
; LINE_WIDTH: 0.419567
G2 X117.89 Y143.9 I-.598 J-.865 E.00314
G1 X118.196 Y143.637 E.0124
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9558.026
G1 X117.89 Y143.9 E-.6065
G1 X117.808 Y143.962 E-.1535
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/76
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G2 X119.056 Y110.462 I-3.69 J3.759 E.06104
G1 X119.062 Y110.454 E.00031
G3 X119.972 Y110.081 I.782 J.61 E.03162
G3 X120.728 Y111.504 I-.13 J.981 E.05786
; WIPE_START
G1 F3000
M204 S6000
G1 X120.394 Y111.279 E-.1532
G1 X119.944 Y110.939 E-.21409
G1 X119.523 Y110.685 E-.18674
G1 X119.056 Y110.462 E-.19674
G1 X119.062 Y110.454 E-.00389
G1 X119.072 Y110.444 E-.00534
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


G1 X119.44 Y110.38 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.294385
G1 F1770
M204 S6000
G1 X120.425 Y110.523 E.0204
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.382061
G1 F1770
M204 S6000
G1 X119.491 Y110.353 E.0286
M204 S10000
G1 X119.55 Y110.326 F42000
; LINE_WIDTH: 0.429243
G1 F1770
M204 S6000
G1 X119.943 Y110.474 E.01324
; LINE_WIDTH: 0.468364
G3 X120.328 Y110.723 I-.365 J.985 E.016
; LINE_WIDTH: 0.410063
G1 X120.635 Y111.088 E.01428
M204 S10000
G1 X120.2 Y110.355 F42000
; LINE_WIDTH: 0.186463
G1 F1770
M204 S6000
G3 X120.625 Y111.196 I-31.813 J16.603 E.01102
M204 S10000
G1 X120.629 Y111.15 F42000
; LINE_WIDTH: 0.33135
G1 F1770
M204 S6000
G1 X120.088 Y110.308 E.02354
; WIPE_START
G1 F12481.374
G1 X120.629 Y111.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.484 Z6.6 F42000
G1 X147.134 Y129.434 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X146.806 Y129.586 E.01201
G3 X146.79 Y129.218 I-.056 J-.182 E.02306
G1 X146.822 Y129.23 E.00115
G3 X147.087 Y129.397 I-.849 J1.64 E.01039
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1770
M204 S6000
G1 X147.831 Y129.559 E.00486
G1 X146.947 Y129.968 E.03233
G3 X146.822 Y128.812 I-.199 J-.563 E.07141
G1 X146.845 Y128.815 E.00078
G3 X147.045 Y128.887 I-.107 J.614 E.00708
G1 X147.792 Y129.38 E.02969
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G3 X147.07 Y130.341 I-1.8 J-3.224 E.01832
G3 X147.244 Y128.549 I-.321 J-.936 E.12155
G1 X147.704 Y128.853 E.01694
G2 X146.773 Y121.994 I-20.839 J-.662 E.21367
G2 X146.243 Y120.552 I-15.384 J4.832 E.04721
G1 X146.757 Y120.591 E.01582
G1 X146.89 Y120.601 E.00411
G3 X145.576 Y138.132 I-18.918 J7.397 E.55865
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03875
M204 S10000
G1 X147.941 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228897
G1 F1770
M204 S6000
G3 X145.362 Y137.919 I-20.513 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.228892
G1 F1770
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z6.6 F42000
G1 X133.007 Y123.954 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1770
M204 S6000
G1 X131.791 Y124.271 E.05294
M73 P74 R7
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.057 Y125.946 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X135.216 Y125.893 E.00516
G3 X135.908 Y125.789 I.761 J2.705 E.02153
G1 X136.048 Y125.789 E.0043
G3 X134.951 Y125.982 I-.07 J2.809 E.50799
G1 X135 Y125.965 E.0016
; WIPE_START
G1 F3000
M204 S6000
G1 X135.216 Y125.893 E-.08665
G1 X135.49 Y125.83 E-.10653
G1 X135.908 Y125.789 E-.15957
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10646
G1 X136.873 Y125.934 E-.10641
G1 X136.957 Y125.967 E-.03465
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.746 Y131.242 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X137.571 Y131.357 E.00645
G3 X132.812 Y128.983 I-1.594 J-2.76 E.19325
G3 X136.148 Y125.413 I3.172 J-.38 E.17092
G3 X137.964 Y131.089 I-.171 J3.183 E.23651
G1 X137.795 Y131.207 E.00633
; WIPE_START
G1 F3000
M204 S6000
G1 X137.571 Y131.357 E-.10261
G1 X137.143 Y131.567 E-.18107
G1 X136.687 Y131.708 E-.1812
G1 X136.216 Y131.779 E-.18121
G1 X135.916 Y131.786 E-.11392
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z6.6 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1770
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1770
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1770
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z6.6 F42000
G1 X118.33 Y143.172 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F1770
M204 S5000
G1 X118.337 Y143.188 E.00054
G3 X116.542 Y144.009 I-.929 J.341 E.09083
G2 X118.281 Y143.207 I-1.3 J-5.104 E.05918
M204 S10000
G1 X118.202 Y143.507 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.186414
G1 F1770
M204 S6000
G3 X117.677 Y144.28 I-8.856 J-5.45 E.01093
M204 S10000
G1 X117.895 Y144.161 F42000
; LINE_WIDTH: 0.278503
G1 F1770
M204 S6000
G3 X116.908 Y144.147 I-.089 J-28.703 E.01894
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.42951
G1 F1770
M204 S6000
G1 X117.422 Y144.129 E.01343
; LINE_WIDTH: 0.470166
G2 X117.81 Y143.961 I-.216 J-1.03 E.01483
; LINE_WIDTH: 0.419479
G2 X117.889 Y143.9 I-.581 J-.841 E.00308
G1 X118.196 Y143.636 E.01243
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9560.261
G1 X117.889 Y143.9 E-.60907
G1 X117.81 Y143.961 E-.15093
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/76
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G2 X119.056 Y110.462 I-3.833 J3.975 E.06101
G1 X119.062 Y110.454 E.00029
G3 X119.973 Y110.081 I.782 J.61 E.03167
G3 X120.728 Y111.504 I-.131 J.981 E.05783
; WIPE_START
G1 F3000
M204 S6000
G1 X120.339 Y111.232 E-.18057
G1 X119.944 Y110.939 E-.1867
G1 X119.523 Y110.685 E-.18682
G1 X119.056 Y110.462 E-.1966
G1 X119.062 Y110.454 E-.00355
G1 X119.072 Y110.443 E-.00577
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


G1 X119.44 Y110.38 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.294128
G1 F1769
M204 S6000
G1 X120.425 Y110.523 E.02037
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.381887
G1 F1769
M204 S6000
G1 X119.491 Y110.353 E.02858
M204 S10000
G1 X119.55 Y110.326 F42000
; LINE_WIDTH: 0.429301
G1 F1769
M204 S6000
G1 X119.943 Y110.474 E.01322
; LINE_WIDTH: 0.466849
G3 X120.347 Y110.743 I-.369 J.993 E.0169
; LINE_WIDTH: 0.408606
G1 X120.636 Y111.086 E.01336
M204 S10000
G1 X120.187 Y110.348 F42000
; LINE_WIDTH: 0.260938
G1 F1769
M204 S6000
G3 X120.625 Y111.191 I-35.635 J19.06 E.01687
M204 S10000
G1 X120.63 Y111.147 F42000
; LINE_WIDTH: 0.329594
G1 F1769
M204 S6000
G1 X120.084 Y110.306 E.02341
; WIPE_START
G1 F12557.833
G1 X120.63 Y111.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z6.8 F42000
G1 X147.134 Y129.434 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X146.806 Y129.586 E.01201
G3 X146.789 Y129.218 I-.058 J-.182 E.02317
G1 X146.822 Y129.23 E.00115
G3 X147.087 Y129.397 I-.879 J1.687 E.0104
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1769
M204 S6000
G1 X147.831 Y129.56 E.00487
G1 X146.947 Y129.968 E.03232
G3 X146.821 Y128.812 I-.197 J-.564 E.07119
G1 X146.845 Y128.815 E.00081
G3 X147.045 Y128.887 I-.107 J.612 E.00707
G1 X147.792 Y129.38 E.02969
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G3 X147.07 Y130.341 I-1.803 J-3.232 E.01832
G3 X147.244 Y128.549 I-.32 J-.936 E.12143
G1 X147.704 Y128.853 E.01694
G2 X146.773 Y121.994 I-20.838 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.733 Y120.589 E.0151
G1 X146.89 Y120.601 E.00482
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03875
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228898
G1 F1769
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.228918
G1 F1769
M204 S6000
G2 X146.684 Y120.875 I-20.584 J-1.127 E.1296
; LINE_WIDTH: 0.206482
G1 X146.699 Y120.854 E.00035
; LINE_WIDTH: 0.162593
G1 X146.715 Y120.833 E.00025
; WIPE_START
G1 F15000
G1 X146.699 Y120.854 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.255 Y122.539 Z6.8 F42000
G1 X133.007 Y123.954 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1769
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.041 Y125.951 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X135.083 Y125.934 E.00139
G3 X135.908 Y125.789 I.895 J2.663 E.02584
G1 X136.048 Y125.789 E.0043
G3 X134.822 Y126.036 I-.07 J2.809 E.50369
G1 X134.985 Y125.973 E.00538
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.03994
G1 X135.352 Y125.858 E-.10648
G1 X135.628 Y125.81 E-.10638
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10646
G1 X136.873 Y125.934 E-.1064
G1 X136.941 Y125.961 E-.02809
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.739 Y131.247 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X137.571 Y131.357 E.00617
G3 X132.813 Y128.987 I-1.594 J-2.761 E.19312
G3 X136.144 Y125.413 I3.171 J-.384 E.17092
G3 X137.964 Y131.089 I-.167 J3.183 E.23664
G1 X137.788 Y131.213 E.00662
; WIPE_START
G1 F3000
M204 S6000
G1 X137.571 Y131.357 E-.09909
G1 X137.143 Y131.567 E-.181
G1 X136.687 Y131.708 E-.1812
G1 X136.216 Y131.779 E-.1812
G1 X135.907 Y131.779 E-.11752
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1769
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z6.8 F42000
G1 X118.33 Y143.172 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X118.337 Y143.188 E.00054
G3 X116.542 Y144.009 I-.93 J.34 E.09082
G2 X118.281 Y143.206 I-1.41 J-5.339 E.05915
M204 S10000
G1 X118.202 Y143.533 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251022
G1 F1769
M204 S6000
G3 X117.614 Y144.3 I-31.718 J-23.729 E.01639
M204 S10000
G1 X117.894 Y144.161 F42000
; LINE_WIDTH: 0.278155
G1 F1769
M204 S6000
G3 X116.909 Y144.148 I-.042 J-33.652 E.01888
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429461
G1 F1769
M204 S6000
G1 X117.421 Y144.13 E.01342
; LINE_WIDTH: 0.470208
G2 X117.808 Y143.962 I-.216 J-1.03 E.01477
; LINE_WIDTH: 0.420478
G2 X117.887 Y143.902 I-.579 J-.84 E.00308
G1 X118.196 Y143.639 E.01247
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9534.981
G1 X117.887 Y143.902 E-.60966
G1 X117.808 Y143.962 E-.15034
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/76
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z6.8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G2 X119.056 Y110.462 I-3.691 J3.761 E.06104
G1 X119.061 Y110.455 E.00026
G3 X119.973 Y110.081 I.783 J.609 E.0317
G3 X120.728 Y111.504 I-.131 J.981 E.05783
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.232 E-.18066
G1 X119.943 Y110.939 E-.18683
G1 X119.523 Y110.685 E-.18684
G1 X119.056 Y110.462 E-.19637
G1 X119.061 Y110.455 E-.00319
G1 X119.072 Y110.444 E-.0061
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


G1 X119.442 Y110.379 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.293849
G1 F1771
M204 S6000
G1 X120.425 Y110.523 E.02031
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.381871
G1 F1771
M204 S6000
G1 X119.491 Y110.353 E.02858
M204 S10000
G1 X119.55 Y110.326 F42000
; LINE_WIDTH: 0.429185
G1 F1771
M204 S6000
G1 X119.942 Y110.474 E.01319
; LINE_WIDTH: 0.466816
G3 X120.347 Y110.743 I-.368 J.993 E.01692
; LINE_WIDTH: 0.408508
G1 X120.636 Y111.086 E.01336
M204 S10000
G1 X120.187 Y110.348 F42000
; LINE_WIDTH: 0.261136
G1 F1771
M204 S6000
G3 X120.625 Y111.191 I-34.619 J18.543 E.01689
M204 S10000
G1 X120.63 Y111.146 F42000
; LINE_WIDTH: 0.329769
G1 F1771
M204 S6000
G1 X120.083 Y110.306 E.02343
; WIPE_START
G1 F12550.161
G1 X120.63 Y111.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z7 F42000
G1 X147.134 Y129.434 Z7
M73 P75 R7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X146.806 Y129.586 E.012
G3 X146.789 Y129.218 I-.058 J-.182 E.02318
G1 X146.822 Y129.23 E.00116
G3 X147.087 Y129.397 I-.854 J1.649 E.0104
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1771
M204 S6000
G1 X147.831 Y129.56 E.00489
G1 X146.946 Y129.969 E.03232
G3 X146.82 Y128.812 I-.198 J-.563 E.07135
G1 X146.845 Y128.815 E.00085
G3 X147.045 Y128.887 I-.107 J.612 E.00706
G1 X147.792 Y129.38 E.02969
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G3 X147.069 Y130.341 I-1.806 J-3.241 E.01832
G3 X147.244 Y128.549 I-.322 J-.936 E.12158
G1 X147.704 Y128.853 E.01694
G2 X146.773 Y121.994 I-20.838 J-.662 E.21367
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.71 Y120.587 E.01438
G1 X146.89 Y120.601 E.00554
G3 X145.576 Y138.132 I-18.915 J7.397 E.55865
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228901
G1 F1771
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13114
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.228742
G1 F1771
M204 S6000
G2 X146.689 Y120.868 I-20.63 J-1.138 E.12957
G1 X146.755 Y120.802 E.00142
; WIPE_START
G1 F15000
G1 X146.689 Y120.868 E-.03564
G1 X147.046 Y121.905 E-.41657
G1 X147.274 Y122.682 E-.3078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.672 Y123.36 Z7 F42000
G1 X133.007 Y123.954 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1771
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.019 Y125.959 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X135.083 Y125.934 E.00211
G3 X135.908 Y125.789 I.895 J2.662 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.822 Y126.037 I-.07 J2.807 E.50344
G1 X134.963 Y125.981 E.00466
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.04884
G1 X135.352 Y125.858 E-.10636
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10639
G1 X136.872 Y125.934 E-.10641
G1 X136.92 Y125.953 E-.01931
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.731 Y131.253 Z7 F42000
G1 Z6.6
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X137.571 Y131.357 E.00588
G3 X132.813 Y128.991 I-1.594 J-2.76 E.193
G3 X136.14 Y125.413 I3.171 J-.388 E.17092
G3 X137.964 Y131.089 I-.163 J3.184 E.23676
G1 X137.78 Y131.218 E.00692
; WIPE_START
G1 F3000
M204 S6000
G1 X137.571 Y131.357 E-.09545
G1 X137.143 Y131.567 E-.18104
G1 X136.687 Y131.708 E-.1812
G1 X136.374 Y131.763 E-.12082
G1 X135.898 Y131.787 E-.18117
G1 X135.897 Y131.787 E-.00032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z7 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1771
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z7 F42000
G1 X118.33 Y143.172 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X118.337 Y143.188 E.00054
G3 X116.542 Y144.009 I-.93 J.34 E.09082
G2 X118.281 Y143.207 I-1.3 J-5.106 E.05918
M204 S10000
G1 X118.202 Y143.533 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251356
G1 F1771
M204 S6000
G3 X117.613 Y144.3 I-28.758 J-21.482 E.01643
M204 S10000
G1 X117.896 Y144.16 F42000
; LINE_WIDTH: 0.278256
G1 F1771
M204 S6000
G3 X116.91 Y144.149 I-.014 J-43.206 E.01889
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429336
G1 F1771
M204 S6000
G1 X117.42 Y144.13 E.01337
; LINE_WIDTH: 0.470124
G2 X117.808 Y143.962 I-.215 J-1.031 E.0148
; LINE_WIDTH: 0.420539
G2 X117.887 Y143.902 I-.574 J-.835 E.00307
G1 X118.196 Y143.639 E.01247
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9533.416
G1 X117.887 Y143.902 E-.60976
G1 X117.808 Y143.962 E-.15024
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/76
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G2 X119.056 Y110.462 I-3.691 J3.761 E.06104
G1 X119.061 Y110.456 E.00023
G3 X119.973 Y110.081 I.784 J.608 E.03174
G3 X120.728 Y111.504 I-.131 J.981 E.05781
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.232 E-.18077
G1 X119.943 Y110.939 E-.1868
G1 X119.522 Y110.684 E-.18697
G1 X119.056 Y110.462 E-.19619
G1 X119.061 Y110.456 E-.00285
G1 X119.072 Y110.444 E-.00643
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


G1 X119.442 Y110.379 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.293547
G1 F1771
M204 S6000
G1 X120.425 Y110.523 E.02028
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.381863
G1 F1771
M204 S6000
G1 X119.491 Y110.353 E.02858
M204 S10000
G1 X119.55 Y110.326 F42000
; LINE_WIDTH: 0.429264
G1 F1771
M204 S6000
G1 X119.942 Y110.474 E.01318
; LINE_WIDTH: 0.466734
G3 X120.347 Y110.743 I-.368 J.993 E.01696
; LINE_WIDTH: 0.408513
G1 X120.636 Y111.086 E.01333
M204 S10000
G1 X120.187 Y110.348 F42000
; LINE_WIDTH: 0.261429
G1 F1771
M204 S6000
G3 X120.625 Y111.191 I-32.228 J17.294 E.01692
M204 S10000
G1 X120.63 Y111.147 F42000
; LINE_WIDTH: 0.329457
G1 F1771
M204 S6000
G1 X120.084 Y110.306 E.0234
; WIPE_START
G1 F12563.821
G1 X120.63 Y111.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z7.2 F42000
G1 X147.135 Y129.434 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X146.806 Y129.586 E.012
G3 X146.789 Y129.218 I-.058 J-.182 E.02319
G1 X146.822 Y129.23 E.00116
G3 X147.087 Y129.397 I-.872 J1.676 E.01041
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1771
M204 S6000
G1 X147.831 Y129.56 E.00491
G1 X146.946 Y129.969 E.03233
G3 X146.819 Y128.812 I-.197 J-.564 E.07124
G1 X146.846 Y128.816 E.00088
G3 X147.045 Y128.887 I-.107 J.61 E.00704
G1 X147.792 Y129.38 E.02969
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G3 X147.069 Y130.341 I-1.809 J-3.249 E.01833
G3 X147.244 Y128.549 I-.32 J-.936 E.1214
G1 X147.704 Y128.852 E.01694
G2 X146.773 Y121.994 I-20.837 J-.662 E.21365
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.687 Y120.586 E.01367
G1 X146.89 Y120.601 E.00626
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228899
G1 F1771
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.952 E.13114
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.228555
G1 F1771
M204 S6000
G2 X146.684 Y120.875 I-20.584 J-1.127 E.12934
G3 X146.578 Y120.774 I.274 J-.393 E.00222
; WIPE_START
G1 F15000
G1 X146.684 Y120.875 E-.05552
G1 X147.046 Y121.905 E-.41472
G1 X147.261 Y122.636 E-.28976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.66 Y123.339 Z7.2 F42000
G1 X133.007 Y123.954 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1771
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.997 Y125.968 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X135.083 Y125.934 E.00283
G3 X135.906 Y125.789 I.894 J2.664 E.02579
G1 X136.048 Y125.789 E.00435
G3 X134.822 Y126.036 I-.071 J2.809 E.50369
G1 X134.941 Y125.99 E.00393
; WIPE_START
G1 F3000
M204 S6000
M73 P75 R6
G1 X135.083 Y125.934 E-.05778
G1 X135.352 Y125.858 E-.10649
G1 X135.706 Y125.802 E-.13605
G1 X135.906 Y125.789 E-.07618
G1 X136.048 Y125.789 E-.05384
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10646
G1 X136.873 Y125.934 E-.1064
G1 X136.898 Y125.944 E-.01029
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.721 Y131.264 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X137.57 Y131.357 E.00544
G3 X135.739 Y125.417 I-1.601 J-2.759 E.35231
G3 X136.136 Y125.413 I.233 J3.405 E.01218
G3 X137.837 Y131.184 I-.166 J3.185 E.24149
G1 X137.77 Y131.23 E.00249
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.357 E-.09001
G1 X137.29 Y131.506 E-.12075
G1 X136.993 Y131.622 E-.12084
G1 X136.687 Y131.708 E-.12081
G1 X136.374 Y131.763 E-.12081
G1 X136.057 Y131.787 E-.12089
G1 X135.884 Y131.782 E-.06588
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1771
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z7.2 F42000
G1 X118.33 Y143.172 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X118.337 Y143.188 E.00055
G3 X116.542 Y144.009 I-.93 J.34 E.09082
G2 X118.281 Y143.207 I-1.301 J-5.106 E.05918
M204 S10000
G1 X118.202 Y143.533 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.251555
G1 F1771
M204 S6000
G3 X117.611 Y144.3 I-28.86 J-21.628 E.01646
M204 S10000
G1 X117.896 Y144.16 F42000
; LINE_WIDTH: 0.277928
G1 F1771
M204 S6000
G3 X116.909 Y144.148 I-.103 J-32.61 E.01889
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429303
G1 F1771
M204 S6000
G1 X117.42 Y144.13 E.01337
; LINE_WIDTH: 0.470071
G2 X117.809 Y143.961 I-.214 J-1.03 E.01486
; LINE_WIDTH: 0.42051
G2 X117.887 Y143.902 I-.565 J-.822 E.00302
G1 X118.196 Y143.639 E.01247
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P76 R6
G1 F9534.168
G1 X117.887 Y143.902 E-.61197
G1 X117.809 Y143.961 E-.14803
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/76
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G2 X119.056 Y110.462 I-3.691 J3.761 E.06104
G1 X119.06 Y110.457 E.0002
G3 X119.974 Y110.081 I.784 J.608 E.03178
G3 X120.728 Y111.504 I-.131 J.981 E.05781
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.231 E-.18085
G1 X119.943 Y110.939 E-.18694
G1 X119.522 Y110.684 E-.18695
G1 X119.056 Y110.462 E-.19601
G1 X119.06 Y110.457 E-.00248
G1 X119.072 Y110.444 E-.00677
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


G1 X119.442 Y110.379 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.293104
G1 F1769
M204 S6000
G1 X120.425 Y110.523 E.02024
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.38173
G1 F1769
M204 S6000
G1 X119.491 Y110.353 E.02856
M204 S10000
G1 X119.551 Y110.326 F42000
; LINE_WIDTH: 0.42925
G1 F1769
M204 S6000
G1 X119.942 Y110.474 E.01317
; LINE_WIDTH: 0.466697
G3 X120.348 Y110.743 I-.367 J.993 E.01698
; LINE_WIDTH: 0.408374
G1 X120.636 Y111.086 E.01332
M204 S10000
G1 X120.187 Y110.348 F42000
; LINE_WIDTH: 0.261503
G1 F1769
M204 S6000
G3 X120.625 Y111.19 I-37.052 J19.82 E.01692
M204 S10000
G1 X120.63 Y111.146 F42000
; LINE_WIDTH: 0.329519
G1 F1769
M204 S6000
G1 X120.083 Y110.306 E.02341
; WIPE_START
G1 F12561.115
G1 X120.63 Y111.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z7.4 F42000
G1 X147.135 Y129.434 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G3 X146.783 Y129.591 I-.812 J-1.343 E.01281
G3 X146.789 Y129.218 I-.033 J-.187 E.02226
G1 X146.823 Y129.23 E.00117
G3 X147.087 Y129.397 I-.877 J1.683 E.0104
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1769
M204 S6000
G1 X147.831 Y129.56 E.0049
G1 X146.971 Y129.958 E.03146
G3 X146.819 Y128.812 I-.222 J-.554 E.07207
G1 X146.846 Y128.816 E.00091
G3 X147.044 Y128.887 I-.107 J.61 E.00703
G1 X147.792 Y129.38 E.0297
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X147.113 Y130.324 E.01687
G3 X147.244 Y128.549 I-.364 J-.919 E.12283
G1 X147.704 Y128.852 E.01695
G2 X146.773 Y121.994 I-20.837 J-.662 E.21366
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.663 Y120.584 E.01295
G1 X146.89 Y120.601 E.00698
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03874
M204 S10000
G1 X147.94 Y129.726 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228899
G1 F1769
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.952 E.13114
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.228919
G1 F1769
M204 S6000
G2 X146.684 Y120.875 I-20.584 J-1.127 E.1296
; LINE_WIDTH: 0.215395
G1 X146.664 Y120.861 E.00035
; LINE_WIDTH: 0.1893
G1 X146.644 Y120.846 E.00029
; WIPE_START
G1 F15000
G1 X146.664 Y120.861 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.22 Y122.547 Z7.4 F42000
G1 X133.007 Y123.954 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1769
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.975 Y125.976 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X135.083 Y125.934 E.00355
G3 X135.908 Y125.789 I.895 J2.662 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.822 Y126.037 I-.07 J2.807 E.50344
G1 X134.919 Y125.998 E.00322
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.06669
G1 X135.352 Y125.858 E-.1064
G1 X135.628 Y125.81 E-.10638
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10646
G1 X136.873 Y125.934 E-.10641
G1 X136.876 Y125.935 E-.00141
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.714 Y131.269 Z7.4 F42000
G1 Z7
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X137.569 Y131.354 E.00516
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35212
G3 X136.132 Y125.413 I.233 J3.41 E.01206
G3 X137.835 Y131.181 I-.162 J3.184 E.24152
G1 X137.762 Y131.234 E.00275
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.08651
G1 X137.29 Y131.506 E-.12078
G1 X136.994 Y131.622 E-.12082
G1 X136.687 Y131.708 E-.12083
G1 X136.374 Y131.763 E-.12083
G1 X136.057 Y131.787 E-.12087
G1 X135.875 Y131.782 E-.06935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z7.4 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1769
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z7.4 F42000
G1 X118.33 Y143.172 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1769
M204 S5000
G1 X118.337 Y143.188 E.00055
G3 X116.542 Y144.009 I-.93 J.34 E.09082
G2 X118.281 Y143.207 I-1.301 J-5.106 E.05919
M204 S10000
G1 X118.202 Y143.53 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242687
G1 F1769
M204 S6000
G1 X118.076 Y143.7 E.00345
; LINE_WIDTH: 0.272882
G1 X117.609 Y144.301 E.01425
M204 S10000
G1 X117.897 Y144.159 F42000
; LINE_WIDTH: 0.277577
G1 F1769
M204 S6000
G3 X116.904 Y144.144 I-.278 J-14.939 E.01899
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429284
G1 F1769
M204 S6000
G1 X117.42 Y144.13 E.01336
; LINE_WIDTH: 0.469628
G2 X117.818 Y143.955 I-.214 J-1.03 E.01524
; LINE_WIDTH: 0.417701
G1 X118.196 Y143.634 E.01515
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9605.617
G1 X117.818 Y143.955 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/76
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1778
M204 S5000
G2 X119.056 Y110.462 I-3.692 J3.762 E.06105
G1 X119.059 Y110.457 E.00018
G3 X119.974 Y110.081 I.785 J.607 E.03181
G3 X120.728 Y111.504 I-.132 J.981 E.0578
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.231 E-.18086
G1 X119.942 Y110.938 E-.18707
G1 X119.521 Y110.684 E-.18701
G1 X119.056 Y110.462 E-.19582
G1 X119.059 Y110.457 E-.00219
G1 X119.072 Y110.444 E-.00705
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
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


G1 X119.418 Y110.392 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.29228
G1 F1778
M204 S6000
G3 X119.673 Y110.409 I.016 J1.673 E.0052
G1 X120.424 Y110.523 E.01543
M204 S10000
G1 X120.494 Y110.608 F42000
; LINE_WIDTH: 0.381729
G1 F1778
M204 S6000
G1 X119.491 Y110.353 E.02856
M204 S10000
G1 X119.551 Y110.326 F42000
; LINE_WIDTH: 0.429244
G1 F1778
M204 S6000
G1 X119.941 Y110.473 E.01314
; LINE_WIDTH: 0.466647
G3 X120.348 Y110.744 I-.367 J.993 E.01701
; LINE_WIDTH: 0.408257
G1 X120.635 Y111.086 E.01331
M204 S10000
G1 X120.186 Y110.348 F42000
; LINE_WIDTH: 0.261694
G1 F1778
M204 S6000
G3 X120.625 Y111.19 I-35.063 J18.805 E.01694
M204 S10000
G1 X120.63 Y111.146 F42000
; LINE_WIDTH: 0.329295
G1 F1778
M204 S6000
G1 X120.083 Y110.306 E.02339
; WIPE_START
G1 F12570.952
G1 X120.63 Y111.146 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z7.6 F42000
G1 X147.134 Y129.434 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1778
M204 S6000
G3 X146.783 Y129.591 I-.809 J-1.335 E.0128
G1 X146.684 Y129.583 E.0033
G3 X146.789 Y129.218 I.066 J-.179 E.01894
G1 X146.822 Y129.23 E.00116
G3 X147.087 Y129.397 I-.854 J1.647 E.0104
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1778
M204 S6000
G1 X147.831 Y129.559 E.00487
G1 X146.97 Y129.959 E.03149
G3 X146.818 Y128.812 I-.221 J-.554 E.07202
G1 X146.846 Y128.816 E.00094
G3 X147.044 Y128.887 I-.107 J.609 E.00701
G1 X147.792 Y129.38 E.02971
M204 S250
G1 X147.611 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1778
M204 S5000
G1 X147.113 Y130.325 E.01689
G3 X147.244 Y128.549 I-.363 J-.92 E.12281
G1 X147.704 Y128.853 E.01695
G2 X146.773 Y121.994 I-20.837 J-.662 E.21366
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.64 Y120.582 E.01223
G1 X146.89 Y120.601 E.00769
G3 X145.576 Y138.132 I-18.863 J7.401 E.55875
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03875
M204 S10000
G1 X147.94 Y129.725 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228898
G1 F1778
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.951 E.13115
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.266 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.228893
G1 F1778
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.127 E.13114
M204 S10000
G1 X146.565 Y120.773 F42000
; LINE_WIDTH: 0.147139
G1 F1778
M204 S6000
G1 X146.851 Y121.059 E.00343
; WIPE_START
G1 F15000
G1 X146.565 Y120.773 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.134 Y122.516 Z7.6 F42000
G1 X133.007 Y123.954 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1778
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1778
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1778
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.951 Y125.982 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1778
M204 S5000
G3 X135.908 Y125.789 I1.027 J2.614 E.03014
G1 X136.048 Y125.789 E.0043
G3 X134.895 Y126.005 I-.07 J2.807 E.5059
; WIPE_START
G1 F3000
M204 S6000
G1 X135.352 Y125.858 E-.18231
G1 X135.628 Y125.81 E-.10643
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10638
G1 X136.853 Y125.929 E-.09862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.706 Y131.274 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
G1 F1778
M204 S5000
G1 X137.569 Y131.354 E.00489
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35212
G3 X136.128 Y125.412 I.233 J3.416 E.01194
G3 X137.835 Y131.181 I-.158 J3.184 E.24164
G1 X137.755 Y131.239 E.00302
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.08315
G1 X137.29 Y131.506 E-.12078
G1 X136.993 Y131.622 E-.12084
G1 X136.688 Y131.708 E-.12079
G1 X136.374 Y131.763 E-.12085
G1 X136.057 Y131.787 E-.12087
G1 X135.866 Y131.782 E-.07271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1778
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1778
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P77 R6
G1 F1778
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z7.6 F42000
G1 X118.33 Y143.172 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F1778
M204 S5000
G1 X118.337 Y143.188 E.00055
G3 X116.542 Y144.009 I-.93 J.34 E.09082
G2 X118.281 Y143.207 I-1.301 J-5.106 E.05919
M204 S10000
G1 X118.202 Y143.53 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242438
G1 F1778
M204 S6000
G1 X118.076 Y143.7 E.00345
; LINE_WIDTH: 0.273018
G1 X117.609 Y144.3 E.01426
M204 S10000
G1 X117.897 Y144.159 F42000
; LINE_WIDTH: 0.277404
G1 F1778
M204 S6000
G3 X116.895 Y144.137 I-.317 J-8.445 E.01915
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.42919
G1 F1778
M204 S6000
G1 X117.419 Y144.13 E.01333
; LINE_WIDTH: 0.469587
G2 X117.818 Y143.955 I-.214 J-1.03 E.01525
; LINE_WIDTH: 0.417728
G1 X118.196 Y143.634 E.01516
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9604.933
G1 X117.818 Y143.955 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/76
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G2 X119.056 Y110.462 I-3.692 J3.762 E.06105
G1 X119.059 Y110.458 E.00015
G3 X119.974 Y110.081 I.785 J.607 E.03185
G3 X120.728 Y111.504 I-.136 J.983 E.0577
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.231 E-.18094
G1 X119.942 Y110.938 E-.18697
G1 X119.521 Y110.684 E-.18713
G1 X119.056 Y110.462 E-.19564
G1 X119.059 Y110.458 E-.0018
G1 X119.073 Y110.444 E-.00753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
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


G1 X119.42 Y110.391 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.292024
G1 F1771
M204 S6000
G1 X119.668 Y110.408 E.00505
G1 X120.424 Y110.523 E.01552
M204 S10000
G1 X120.493 Y110.608 F42000
; LINE_WIDTH: 0.381634
G1 F1771
M204 S6000
G1 X119.491 Y110.353 E.02855
M204 S10000
G1 X119.551 Y110.325 F42000
; LINE_WIDTH: 0.429173
G1 F1771
M204 S6000
G1 X119.941 Y110.473 E.01312
; LINE_WIDTH: 0.466543
G3 X120.348 Y110.744 I-.366 J.993 E.01705
; LINE_WIDTH: 0.408247
G1 X120.635 Y111.086 E.01329
M204 S10000
G1 X120.186 Y110.347 F42000
; LINE_WIDTH: 0.262035
G1 F1771
M204 S6000
G3 X120.625 Y111.19 I-34.312 J18.425 E.01698
M204 S10000
G1 X120.63 Y111.147 F42000
; LINE_WIDTH: 0.329283
G1 F1771
M204 S6000
G1 X120.083 Y110.306 E.02339
; WIPE_START
G1 F12571.477
G1 X120.63 Y111.147 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.912 Y115.481 Z7.8 F42000
G1 X147.134 Y129.434 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G3 X146.783 Y129.591 I-.814 J-1.35 E.01279
G1 X146.683 Y129.582 E.00334
G3 X146.785 Y129.218 I.065 J-.178 E.01882
G1 X146.822 Y129.23 E.00131
G3 X147.087 Y129.397 I-.856 J1.646 E.0104
M204 S10000
G1 X147.842 Y129.414 F42000
G1 F1771
M204 S6000
G1 X147.831 Y129.56 E.00487
G1 X146.97 Y129.959 E.03146
G3 X146.817 Y128.812 I-.222 J-.554 E.07201
G1 X146.847 Y128.816 E.00099
G3 X147.044 Y128.887 I-.107 J.607 E.00698
G1 X147.792 Y129.381 E.02974
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X147.113 Y130.324 E.01687
G3 X147.244 Y128.549 I-.364 J-.92 E.12281
G1 X147.704 Y128.853 E.01697
G2 X146.773 Y121.994 I-20.838 J-.662 E.21368
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.617 Y120.58 E.01151
G1 X146.89 Y120.601 E.00841
G3 X145.576 Y138.132 I-18.924 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03873
M204 S10000
G1 X147.94 Y129.726 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228902
G1 F1771
M204 S6000
G3 X145.362 Y137.919 I-20.512 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.267 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.228891
G1 F1771
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.128 E.13115
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z7.8 F42000
G1 X133.007 Y123.954 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1771
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.931 Y125.994 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X135.083 Y125.934 E.005
G3 X135.908 Y125.789 I.895 J2.663 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.822 Y126.036 I-.07 J2.809 E.50369
G1 X134.875 Y126.015 E.00176
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.08462
G1 X135.352 Y125.858 E-.10639
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05323
G1 X136.465 Y125.83 E-.15957
G1 X136.739 Y125.893 E-.10655
G1 X136.83 Y125.924 E-.03668
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.699 Y131.279 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X137.569 Y131.354 E.00462
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35212
G3 X136.124 Y125.412 I.233 J3.424 E.01181
G3 X137.835 Y131.181 I-.154 J3.184 E.24177
G1 X137.748 Y131.244 E.0033
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.0798
G1 X137.29 Y131.506 E-.12078
G1 X136.993 Y131.622 E-.12085
G1 X136.687 Y131.708 E-.12083
G1 X136.374 Y131.763 E-.12078
G1 X136.057 Y131.787 E-.1209
G1 X135.857 Y131.782 E-.07606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z7.8 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1771
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1771
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1771
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z7.8 F42000
G1 X118.33 Y143.172 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1771
M204 S5000
G1 X118.337 Y143.188 E.00055
G3 X116.542 Y144.009 I-.93 J.34 E.09081
G2 X118.281 Y143.207 I-1.301 J-5.107 E.05919
M204 S10000
G1 X118.202 Y143.53 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.24225
G1 F1771
M204 S6000
G1 X118.076 Y143.7 E.00345
; LINE_WIDTH: 0.272762
G1 X117.61 Y144.3 E.01423
M204 S10000
G1 X117.896 Y144.16 F42000
; LINE_WIDTH: 0.277161
G1 F1771
M204 S6000
G3 X116.895 Y144.137 I-.312 J-8.509 E.01912
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429057
G1 F1771
M204 S6000
G1 X117.418 Y144.13 E.0133
; LINE_WIDTH: 0.469509
G2 X117.819 Y143.955 I-.213 J-1.031 E.0153
; LINE_WIDTH: 0.417583
G1 X118.196 Y143.634 E.01514
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9608.638
G1 X117.819 Y143.955 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/76
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z7.8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G2 X119.056 Y110.462 I-3.692 J3.763 E.06105
G1 X119.058 Y110.459 E.00011
G3 X119.975 Y110.081 I.786 J.606 E.0319
G3 X120.728 Y111.504 I-.137 J.983 E.05769
; WIPE_START
G1 F3000
M204 S6000
G1 X120.338 Y111.231 E-.18093
G1 X119.942 Y110.938 E-.18711
G1 X119.52 Y110.683 E-.18718
G1 X119.056 Y110.462 E-.19546
G1 X119.058 Y110.459 E-.00138
G1 X119.073 Y110.444 E-.00794
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
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


G1 X119.417 Y110.392 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276537
G1 F1759
M204 S6000
G1 X119.667 Y110.408 E.00477
G1 X120.426 Y110.525 E.01462
M204 S10000
G1 X120.186 Y110.347 F42000
; LINE_WIDTH: 0.262178
G1 F1759
M204 S6000
G3 X120.625 Y111.19 I-39.885 J21.346 E.01698
M204 S10000
G1 X120.63 Y111.147 F42000
; LINE_WIDTH: 0.32912
G1 F1759
M204 S6000
G1 X120.083 Y110.306 E.02337
M204 S10000
G1 X119.551 Y110.325 F42000
; LINE_WIDTH: 0.429224
G1 F1759
M204 S6000
G1 X119.94 Y110.473 E.01311
; LINE_WIDTH: 0.466489
G3 X120.349 Y110.745 I-.366 J.993 E.01708
; LINE_WIDTH: 0.408112
G1 X120.635 Y111.086 E.01328
; WIPE_START
G1 F9857.83
G1 X120.349 Y110.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.608 Y115.112 Z8 F42000
G1 X147.134 Y129.434 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G3 X146.791 Y129.589 I-.797 J-1.304 E.01252
G1 X146.728 Y129.593 E.0021
G1 X146.656 Y129.57 E.00248
G1 X146.58 Y129.491 E.00366
G3 X146.784 Y129.218 I.168 J-.087 E.01412
G1 X146.822 Y129.23 E.00132
G3 X147.087 Y129.397 I-.858 J1.654 E.01038
M204 S10000
G1 X147.842 Y129.413 F42000
G1 F1759
M204 S6000
G1 X147.831 Y129.558 E.00485
G1 X146.969 Y129.959 E.03152
G3 X146.817 Y128.812 I-.221 J-.554 E.07196
G3 X147.044 Y128.887 I-.089 J.655 E.00799
G1 X147.792 Y129.38 E.02971
M204 S250
G1 X147.612 Y130.093 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X147.113 Y130.325 E.0169
G3 X147.244 Y128.549 I-.363 J-.92 E.1228
G1 X147.704 Y128.852 E.01695
G2 X146.773 Y121.994 I-20.838 J-.662 E.21366
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.594 Y120.579 E.0108
G1 X146.89 Y120.601 E.00913
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.603 Y130.152 E.03877
M204 S10000
G1 X147.941 Y129.724 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228894
G1 F1759
M204 S6000
G3 X145.362 Y137.919 I-20.513 J-1.95 E.13116
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.228894
G1 F1759
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.127 E.13113
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z8 F42000
G1 X133.007 Y123.954 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1759
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.925 Y125.994 Z8 F42000
G1 Z7.6
G1 E.8 F1800
M73 P78 R6
G1 F1759
M204 S5000
G1 X134.951 Y125.982 E.00086
G3 X135.908 Y125.789 I1.027 J2.614 E.03015
G1 X136.048 Y125.789 E.0043
G3 X134.696 Y126.097 I-.07 J2.807 E.49913
G1 X134.871 Y126.018 E.00589
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.0335
G1 X135.216 Y125.893 E-.10645
G1 X135.49 Y125.83 E-.10656
G1 X135.908 Y125.789 E-.15957
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10645
G1 X136.825 Y125.921 E-.08774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.691 Y131.284 Z8 F42000
G1 Z7.6
G1 E.8 F1800
G1 F1759
M204 S5000
G1 X137.569 Y131.354 E.00433
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35212
G3 X136.123 Y125.412 I.228 J2.988 E.01181
G3 X137.835 Y131.181 I-.154 J3.184 E.24177
G1 X137.74 Y131.249 E.00359
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.07626
G1 X137.29 Y131.505 E-.12075
G1 X136.993 Y131.622 E-.12088
G1 X136.687 Y131.708 E-.12081
G1 X136.374 Y131.763 E-.12081
G1 X136.057 Y131.787 E-.1209
G1 X135.848 Y131.782 E-.0796
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1759
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z8 F42000
G1 X118.33 Y143.172 Z8
G1 Z7.6
G1 E.8 F1800
G1 F1759
M204 S5000
G1 X118.337 Y143.189 E.00056
G3 X116.542 Y144.009 I-.93 J.34 E.09081
G2 X118.281 Y143.207 I-1.302 J-5.108 E.05919
M204 S10000
G1 X118.202 Y143.53 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243389
G1 F1759
M204 S6000
G1 X118.076 Y143.7 E.00347
; LINE_WIDTH: 0.272718
G1 X117.61 Y144.3 E.01422
M204 S10000
G1 X117.899 Y144.157 F42000
; LINE_WIDTH: 0.277072
G1 F1759
M204 S6000
G3 X116.897 Y144.138 I-.338 J-8.644 E.01915
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429024
G1 F1759
M204 S6000
G1 X117.418 Y144.13 E.01328
; LINE_WIDTH: 0.469471
G2 X117.818 Y143.955 I-.213 J-1.031 E.01531
; LINE_WIDTH: 0.417681
G1 X118.196 Y143.634 E.01513
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9606.143
G1 X117.818 Y143.955 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/76
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G2 X119.056 Y110.462 I-3.693 J3.763 E.06105
G1 X119.058 Y110.46 E.00009
G3 X119.975 Y110.081 I.787 J.605 E.03193
G3 X120.728 Y111.504 I-.137 J.983 E.05768
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.231 E-.181
G1 X119.942 Y110.938 E-.18724
G1 X119.52 Y110.683 E-.18711
G1 X119.056 Y110.462 E-.19532
G1 X119.058 Y110.46 E-.00106
G1 X119.073 Y110.444 E-.00827
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
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


G1 X119.42 Y110.391 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276449
G1 F1759
M204 S6000
G1 X119.667 Y110.408 E.00471
G1 X120.429 Y110.528 E.01467
M204 S10000
G1 X120.185 Y110.347 F42000
; LINE_WIDTH: 0.262396
G1 F1759
M204 S6000
G3 X120.625 Y111.19 I-34.602 J18.608 E.01702
M204 S10000
G1 X120.63 Y111.146 F42000
; LINE_WIDTH: 0.329174
G1 F1759
M204 S6000
G1 X120.083 Y110.306 E.02338
M204 S10000
G1 X119.551 Y110.325 F42000
; LINE_WIDTH: 0.429158
G1 F1759
M204 S6000
G1 X119.94 Y110.473 E.01307
; LINE_WIDTH: 0.46641
G3 X120.349 Y110.745 I-.365 J.994 E.01713
; LINE_WIDTH: 0.408057
G1 X120.635 Y111.087 E.01326
; WIPE_START
G1 F9859.325
G1 X120.349 Y110.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.609 Y115.112 Z8.2 F42000
G1 X147.135 Y129.434 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G3 X146.791 Y129.589 I-.809 J-1.339 E.01254
G1 X146.7 Y129.588 E.00303
G1 X146.64 Y129.561 E.00217
G1 X146.589 Y129.507 E.00245
G1 X146.563 Y129.447 E.00217
G3 X146.764 Y129.216 I.184 J-.044 E.01184
G1 X146.776 Y129.217 E.00042
G3 X146.83 Y129.233 I-.024 J.181 E.00187
G1 X147.085 Y129.401 E.01013
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1759
M204 S6000
G1 X147.831 Y129.561 E.00496
G1 X146.97 Y129.959 E.03146
G3 X146.793 Y128.809 I-.222 J-.554 E.07129
G3 X147.044 Y128.887 I-.076 J.691 E.00876
G1 X147.792 Y129.379 E.0297
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X147.113 Y130.325 E.01687
G3 X147.244 Y128.549 I-.365 J-.92 E.12297
G1 X147.704 Y128.852 E.01694
G2 X146.773 Y121.994 I-20.809 J-.666 E.21364
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.57 Y120.577 E.01008
G1 X146.89 Y120.601 E.00984
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.726 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228904
G1 F1759
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.228935
G1 F1759
M204 S6000
G2 X146.647 Y120.779 I-20.566 J-1.128 E.13114
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z8.2 F42000
G1 X133.007 Y123.954 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1759
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.887 Y126.011 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F1759
M204 S5000
G1 X135.083 Y125.934 E.00645
G3 X135.908 Y125.789 I.895 J2.662 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.822 Y126.037 I-.07 J2.807 E.50344
G1 X134.832 Y126.033 E.00032
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.10256
G1 X135.352 Y125.858 E-.10633
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10652
G1 X136.603 Y125.858 E-.10645
G1 X136.785 Y125.91 E-.07195
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.684 Y131.288 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
G1 F1759
M204 S5000
G1 X137.569 Y131.354 E.00408
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35211
G3 X136.12 Y125.412 I.228 J2.988 E.0117
G3 X137.835 Y131.181 I-.15 J3.184 E.24189
G1 X137.733 Y131.254 E.00383
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.07315
G1 X137.29 Y131.506 E-.12078
G1 X136.993 Y131.622 E-.12085
G1 X136.687 Y131.708 E-.12083
G1 X136.374 Y131.763 E-.12082
G1 X136.057 Y131.787 E-.12087
G1 X135.84 Y131.781 E-.08271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z8.2 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1759
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1759
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1759
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z8.2 F42000
G1 X118.33 Y143.172 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1759
M204 S5000
G1 X118.337 Y143.189 E.00056
G3 X116.542 Y144.009 I-.93 J.34 E.09081
G2 X118.281 Y143.207 I-1.302 J-5.108 E.05919
M204 S10000
G1 X118.202 Y143.529 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243343
G1 F1759
M204 S6000
G1 X118.076 Y143.701 E.00349
; LINE_WIDTH: 0.272549
G1 X117.61 Y144.3 E.0142
M204 S10000
G1 X117.901 Y144.156 F42000
; LINE_WIDTH: 0.276884
G1 F1759
M204 S6000
G3 X116.897 Y144.139 I-.356 J-8.442 E.01916
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.429006
G1 F1759
M204 S6000
G1 X117.418 Y144.13 E.01328
; LINE_WIDTH: 0.469426
G2 X117.819 Y143.954 I-.213 J-1.031 E.01534
; LINE_WIDTH: 0.417623
G1 X118.196 Y143.634 E.0151
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9607.616
G1 X117.819 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/76
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1763
M204 S5000
G2 X119.056 Y110.462 I-3.693 J3.763 E.06105
G1 X119.057 Y110.46 E.00006
G3 X119.975 Y110.081 I.787 J.605 E.03197
G3 X120.728 Y111.504 I-.138 J.983 E.05766
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.231 E-.18115
G1 X119.941 Y110.938 E-.18722
G1 X119.519 Y110.683 E-.18721
G1 X119.056 Y110.462 E-.1951
G1 X119.057 Y110.46 E-.00073
G1 X119.073 Y110.444 E-.00859
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
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


G1 X119.421 Y110.39 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276291
G1 F1763
M204 S6000
G1 X119.667 Y110.408 E.00469
G1 X120.429 Y110.528 E.01465
M204 S10000
G1 X120.185 Y110.347 F42000
; LINE_WIDTH: 0.262735
G1 F1763
M204 S6000
G3 X120.625 Y111.189 I-40.751 J21.831 E.01703
M204 S10000
G1 X120.63 Y111.146 F42000
; LINE_WIDTH: 0.329185
G1 F1763
M204 S6000
G1 X120.083 Y110.306 E.02338
M204 S10000
G1 X119.551 Y110.325 F42000
; LINE_WIDTH: 0.42915
G1 F1763
M204 S6000
G1 X119.939 Y110.473 E.01305
; LINE_WIDTH: 0.466368
G3 X120.349 Y110.745 I-.365 J.994 E.01715
; LINE_WIDTH: 0.408007
G1 X120.635 Y111.087 E.01326
; WIPE_START
G1 F9860.674
G1 X120.349 Y110.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.609 Y115.112 Z8.4 F42000
G1 X147.135 Y129.434 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1763
M204 S6000
G3 X146.792 Y129.589 I-.81 J-1.341 E.01253
G1 X146.701 Y129.588 E.00302
G1 X146.64 Y129.56 E.0022
G1 X146.589 Y129.508 E.00242
G1 X146.563 Y129.447 E.00221
G3 X146.764 Y129.216 I.184 J-.043 E.01183
G1 X146.776 Y129.217 E.0004
G3 X146.83 Y129.233 I-.025 J.183 E.00189
G1 X147.085 Y129.401 E.01013
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1763
M204 S6000
G1 X147.831 Y129.561 E.00496
G1 X146.97 Y129.959 E.03146
G3 X146.793 Y128.809 I-.222 J-.554 E.07129
G3 X147.044 Y128.886 I-.076 J.69 E.00876
G1 X147.792 Y129.379 E.02971
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1763
M204 S5000
G1 X147.113 Y130.325 E.01688
G3 X147.244 Y128.548 I-.365 J-.92 E.12296
G1 X147.704 Y128.852 E.01695
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.547 Y120.575 E.00936
G1 X146.89 Y120.601 E.01056
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228904
G1 F1763
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z8.4 F42000
M73 P79 R6
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1763
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z8.4 F42000
G1 X133.007 Y123.954 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1763
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1763
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1763
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.866 Y126.019 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F1763
M204 S5000
G1 X135.083 Y125.934 E.00717
G3 X135.908 Y125.789 I.895 J2.662 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.81 Y126.042 I-.07 J2.807 E.50304
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.11148
G1 X135.352 Y125.858 E-.10636
G1 X135.628 Y125.81 E-.10642
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10652
G1 X136.603 Y125.858 E-.10638
G1 X136.763 Y125.903 E-.06311
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.677 Y131.293 Z8.4 F42000
G1 Z8
G1 E.8 F1800
G1 F1763
M204 S5000
G1 X137.569 Y131.354 E.00381
G3 X135.739 Y125.417 I-1.599 J-2.758 E.3521
G3 X136.116 Y125.412 I.228 J2.983 E.01157
G3 X137.835 Y131.181 I-.146 J3.184 E.24202
G1 X137.726 Y131.258 E.0041
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.06986
G1 X137.29 Y131.505 E-.12076
G1 X136.993 Y131.622 E-.12087
G1 X136.687 Y131.708 E-.12081
G1 X136.374 Y131.763 E-.12084
G1 X136.057 Y131.787 E-.12087
G1 X135.831 Y131.781 E-.086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1763
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1763
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1763
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P79 R5
G1 X126.781 Y136.653 Z8.4 F42000
G1 X118.33 Y143.172 Z8.4
G1 Z8
G1 E.8 F1800
G1 F1763
M204 S5000
G1 X118.337 Y143.189 E.00056
G3 X116.542 Y144.009 I-.93 J.34 E.09081
G2 X118.281 Y143.207 I-1.302 J-5.108 E.05919
M204 S10000
G1 X118.204 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243305
G1 F1763
M204 S6000
G1 X118.075 Y143.701 E.00354
; LINE_WIDTH: 0.27279
G1 X117.61 Y144.3 E.0142
M204 S10000
G1 X117.904 Y144.154 F42000
; LINE_WIDTH: 0.27669
G1 F1763
M204 S6000
G3 X116.897 Y144.139 I-.382 J-8.234 E.01919
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.428828
G1 F1763
M204 S6000
G1 X117.417 Y144.13 E.01324
; LINE_WIDTH: 0.469354
G2 X117.819 Y143.954 I-.212 J-1.032 E.01538
; LINE_WIDTH: 0.417678
G1 X118.196 Y143.634 E.01511
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9606.216
G1 X117.819 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/76
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G2 X119.056 Y110.462 I-3.693 J3.764 E.06105
G1 X119.057 Y110.461 E.00002
G3 X119.976 Y110.081 I.788 J.604 E.03202
G3 X120.728 Y111.504 I-.138 J.983 E.05765
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.231 E-.18123
G1 X119.941 Y110.937 E-.1872
G1 X119.519 Y110.683 E-.18733
G1 X119.056 Y110.462 E-.19492
G1 X119.057 Y110.461 E-.00029
G1 X119.073 Y110.444 E-.00903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
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


G1 X119.422 Y110.39 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276379
G1 F1753
M204 S6000
G1 X119.668 Y110.408 E.0047
G1 X120.43 Y110.53 E.01469
M204 S10000
G1 X120.084 Y110.306 F42000
; LINE_WIDTH: 0.328868
G1 F1753
M204 S6000
G1 X120.486 Y110.926 E.01721
; LINE_WIDTH: 0.296468
G1 X120.513 Y110.97 E.00108
; LINE_WIDTH: 0.253875
G1 X120.625 Y111.19 E.00424
M204 S10000
G1 X120.635 Y111.087 F42000
; LINE_WIDTH: 0.407936
G1 F1753
M204 S6000
G1 X120.35 Y110.746 E.01324
; LINE_WIDTH: 0.466304
G2 X119.939 Y110.473 I-.775 J.721 E.01717
; LINE_WIDTH: 0.429202
G1 X119.551 Y110.325 E.01306
; WIPE_START
G1 F9319.629
G1 X119.939 Y110.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.2 Y114.838 Z8.6 F42000
G1 X147.135 Y129.434 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G3 X146.792 Y129.588 I-.808 J-1.337 E.01251
G1 X146.701 Y129.588 E.00303
G1 X146.64 Y129.56 E.00223
G1 X146.589 Y129.508 E.00241
G1 X146.563 Y129.446 E.00223
G3 X146.763 Y129.216 I.184 J-.043 E.01181
G1 X146.775 Y129.217 E.00039
G3 X146.83 Y129.233 I-.024 J.183 E.0019
G1 X147.085 Y129.401 E.01013
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1753
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.969 Y129.959 E.03148
G3 X146.793 Y128.809 I-.222 J-.554 E.07128
G3 X147.044 Y128.886 I-.075 J.69 E.00876
G1 X147.792 Y129.379 E.0297
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X147.112 Y130.325 E.01689
G3 X147.244 Y128.548 I-.364 J-.92 E.12294
G1 X147.704 Y128.852 E.01695
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.388 J4.834 E.04721
G1 X146.524 Y120.574 E.00865
G1 X146.89 Y120.601 E.01128
G3 X145.576 Y138.132 I-18.863 J7.401 E.55875
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1753
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1753
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z8.6 F42000
G1 X133.007 Y123.954 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1753
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.844 Y126.028 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X135.083 Y125.934 E.00789
G3 X135.908 Y125.789 I.895 J2.663 E.02583
G1 X136.048 Y125.789 E.0043
G3 X134.789 Y126.052 I-.07 J2.809 E.50257
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.12036
G1 X135.352 Y125.858 E-.1064
G1 X135.628 Y125.81 E-.10638
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10646
G1 X136.74 Y125.897 E-.05415
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.67 Y131.298 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X137.569 Y131.354 E.00354
G3 X135.739 Y125.417 I-1.599 J-2.758 E.3521
G3 X136.112 Y125.412 I.228 J2.985 E.01145
G3 X137.835 Y131.181 I-.142 J3.185 E.24215
G1 X137.719 Y131.263 E.00437
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.06656
G1 X137.289 Y131.506 E-.1209
G1 X136.994 Y131.622 E-.12074
G1 X136.687 Y131.708 E-.12088
G1 X136.374 Y131.763 E-.12078
G1 X136.057 Y131.787 E-.12087
G1 X135.822 Y131.781 E-.08926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z8.6 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1753
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z8.6 F42000
G1 X118.33 Y143.172 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X118.361 Y143.26 E.00286
G3 X116.542 Y144.009 I-.951 J.272 E.08872
G2 X118.282 Y143.207 I-1.302 J-5.11 E.0592
M204 S10000
G1 X118.204 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242886
G1 F1753
M204 S6000
G1 X118.075 Y143.701 E.00353
; LINE_WIDTH: 0.272649
G1 X117.611 Y144.3 E.01419
M204 S10000
G1 X117.904 Y144.154 F42000
; LINE_WIDTH: 0.276595
G1 F1753
M204 S6000
G3 X116.898 Y144.139 I-.382 J-8.434 E.01918
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428895
G1 F1753
M204 S6000
G1 X117.417 Y144.131 E.01322
; LINE_WIDTH: 0.469336
G2 X117.819 Y143.954 I-.212 J-1.032 E.01538
; LINE_WIDTH: 0.417602
G1 X118.196 Y143.634 E.01511
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9608.164
G1 X117.819 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/76
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G2 X119.056 Y110.462 I-3.694 J3.765 E.06105
G3 X119.976 Y110.081 I.788 J.603 E.03206
G3 X120.728 Y111.504 I-.138 J.983 E.05764
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.23 E-.1813
G1 X119.941 Y110.937 E-.18733
G1 X119.519 Y110.683 E-.18731
G1 X119.056 Y110.462 E-.19474
G1 X119.073 Y110.444 E-.00932
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.389 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276211
G1 F1753
M204 S6000
G1 X119.668 Y110.408 E.00467
G1 X120.43 Y110.53 E.01467
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328891
G1 F1753
M204 S6000
G1 X120.486 Y110.926 E.01723
; LINE_WIDTH: 0.296438
G1 X120.513 Y110.97 E.00107
; LINE_WIDTH: 0.254059
M73 P80 R5
G1 X120.626 Y111.191 E.00427
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422006
G1 F1753
M204 S6000
G2 X120.325 Y110.72 I-3.748 J2.921 E.01472
; LINE_WIDTH: 0.468144
G2 X119.938 Y110.472 I-.745 J.736 E.01604
; LINE_WIDTH: 0.429115
G1 X119.551 Y110.325 E.01302
; WIPE_START
G1 F9321.733
G1 X119.938 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.199 Y114.837 Z8.8 F42000
G1 X147.135 Y129.434 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G3 X146.793 Y129.588 I-.814 J-1.349 E.01249
G1 X146.726 Y129.593 E.00222
G1 X146.658 Y129.571 E.00237
G1 X146.605 Y129.528 E.00227
G1 X146.569 Y129.467 E.00236
G3 X146.764 Y129.216 I.179 J-.063 E.01251
G1 X146.775 Y129.217 E.00037
G3 X146.83 Y129.233 I-.024 J.183 E.00192
G1 X147.085 Y129.401 E.01014
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1753
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.97 Y129.959 E.03147
G3 X146.793 Y128.809 I-.222 J-.554 E.07128
G3 X147.044 Y128.886 I-.075 J.687 E.00875
G1 X147.792 Y129.379 E.02971
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X147.113 Y130.325 E.01688
G3 X147.243 Y128.548 I-.365 J-.92 E.12294
G1 X147.704 Y128.852 E.01696
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.501 Y120.572 E.00793
G1 X146.89 Y120.601 E.01199
G3 X145.576 Y138.132 I-18.863 J7.401 E.55875
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228906
G1 F1753
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.228898
G1 F1753
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z8.8 F42000
G1 X133.007 Y123.954 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1753
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.822 Y126.036 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F1753
M204 S5000
G3 X135.908 Y125.789 I1.156 J2.561 E.03445
G1 X136.048 Y125.789 E.0043
G3 X134.768 Y126.062 I-.07 J2.809 E.50185
; WIPE_START
G1 F3000
M204 S6000
G1 X135.083 Y125.934 E-.12915
G1 X135.352 Y125.858 E-.10654
G1 X135.628 Y125.81 E-.10639
G1 X135.908 Y125.789 E-.10649
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10645
G1 X136.718 Y125.89 E-.04524
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.663 Y131.302 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X137.569 Y131.354 E.00329
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35208
G3 X136.108 Y125.411 I.228 J2.985 E.01133
G3 X137.835 Y131.182 I-.138 J3.185 E.24229
G1 X137.712 Y131.268 E.00463
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.06337
G1 X137.29 Y131.506 E-.12078
G1 X136.993 Y131.622 E-.12085
G1 X136.687 Y131.708 E-.12081
G1 X136.374 Y131.763 E-.12082
G1 X136.057 Y131.787 E-.12088
G1 X135.814 Y131.781 E-.09249
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1753
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z8.8 F42000
G1 X118.33 Y143.172 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X118.36 Y143.259 E.00284
G3 X116.542 Y144.009 I-.953 J.269 E.08853
G2 X118.282 Y143.207 I-1.303 J-5.11 E.0592
M204 S10000
G1 X118.204 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243169
G1 F1753
M204 S6000
G1 X118.075 Y143.701 E.00354
; LINE_WIDTH: 0.272655
G1 X117.611 Y144.3 E.01418
M204 S10000
G1 X117.904 Y144.154 F42000
; LINE_WIDTH: 0.276393
G1 F1753
M204 S6000
G3 X116.897 Y144.139 I-.382 J-8.281 E.01917
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428781
G1 F1753
M204 S6000
G1 X117.416 Y144.131 E.0132
; LINE_WIDTH: 0.469271
G2 X117.82 Y143.954 I-.211 J-1.032 E.01542
; LINE_WIDTH: 0.417423
G1 X118.196 Y143.634 E.01509
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9612.74
G1 X117.82 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/76
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z8.8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G2 X119.056 Y110.462 I-3.694 J3.765 E.06104
G3 X119.976 Y110.081 I.788 J.603 E.03206
G3 X120.728 Y111.504 I-.139 J.983 E.05763
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.23 E-.18136
G1 X119.94 Y110.937 E-.1874
G1 X119.518 Y110.682 E-.18736
G1 X119.056 Y110.462 E-.19453
G1 X119.073 Y110.444 E-.00935
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
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


G1 X119.424 Y110.388 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.276154
G1 F1750
M204 S6000
G3 X120.43 Y110.53 I-.391 J6.415 E.01933
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328694
G1 F1750
M204 S6000
G1 X120.487 Y110.927 E.01723
; LINE_WIDTH: 0.296333
G1 X120.513 Y110.97 E.00104
; LINE_WIDTH: 0.254332
G1 X120.626 Y111.191 E.00428
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422157
G1 F1750
M204 S6000
G2 X120.324 Y110.72 I-3.664 J2.845 E.01476
; LINE_WIDTH: 0.468155
G2 X119.938 Y110.472 I-.744 J.736 E.01603
; LINE_WIDTH: 0.429115
G1 X119.552 Y110.325 E.01299
; WIPE_START
G1 F9321.72
G1 X119.938 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.199 Y114.837 Z9 F42000
G1 X147.135 Y129.434 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X146.81 Y129.584 E.01187
G1 X146.753 Y129.594 E.00191
G3 X146.763 Y129.215 I-.006 J-.189 E.0205
G1 X146.774 Y129.217 E.00036
G3 X146.83 Y129.233 I-.024 J.188 E.00194
G1 X147.085 Y129.401 E.01013
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1750
M204 S6000
G1 X147.831 Y129.561 E.00495
G1 X146.965 Y129.961 E.03165
G3 X146.793 Y128.809 I-.216 J-.556 E.07104
G3 X147.044 Y128.886 I-.075 J.689 E.00874
G1 X147.792 Y129.379 E.02972
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X147.111 Y130.325 E.01694
G3 X147.243 Y128.548 I-.361 J-.92 E.12272
G1 X147.704 Y128.852 E.01696
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.384 J4.832 E.04721
G1 X146.477 Y120.57 E.00721
G1 X146.89 Y120.601 E.01271
G3 X145.576 Y138.132 I-18.863 J7.401 E.55875
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.153 E.03873
M204 S10000
G1 X147.94 Y129.726 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228904
G1 F1750
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1750
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z9 F42000
G1 X133.007 Y123.954 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1750
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.825 Y126.039 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X134.951 Y125.982 E.00426
G3 X135.908 Y125.789 I1.027 J2.615 E.03014
G1 X136.048 Y125.789 E.0043
G3 X134.696 Y126.097 I-.07 J2.809 E.49938
G1 X134.77 Y126.064 E.00251
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.07544
G1 X135.352 Y125.858 E-.15959
G1 X135.628 Y125.81 E-.10644
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10652
G1 X136.603 Y125.858 E-.10638
G1 X136.719 Y125.891 E-.04589
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.655 Y131.307 Z9 F42000
G1 Z8.6
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X137.569 Y131.354 E.00302
G3 X135.739 Y125.417 I-1.599 J-2.758 E.35207
G3 X136.104 Y125.411 I.228 J2.986 E.01121
G3 X137.835 Y131.182 I-.133 J3.185 E.24242
G1 X137.704 Y131.273 E.0049
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.06
G1 X137.29 Y131.505 E-.12068
G1 X136.994 Y131.622 E-.12087
G1 X136.688 Y131.708 E-.12078
G1 X136.374 Y131.763 E-.12088
G1 X136.057 Y131.787 E-.12087
G1 X135.805 Y131.78 E-.09592
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z9 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1750
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z9 F42000
G1 X118.33 Y143.172 Z9
G1 Z8.6
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X118.36 Y143.258 E.00281
G3 X116.542 Y144.009 I-.953 J.27 E.08855
G2 X118.282 Y143.207 I-1.303 J-5.111 E.05919
M204 S10000
G1 X118.204 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243075
G1 F1750
M204 S6000
G1 X118.075 Y143.702 E.00354
; LINE_WIDTH: 0.272403
M73 P81 R5
G1 X117.612 Y144.3 E.01415
M204 S10000
G1 X117.904 Y144.154 F42000
; LINE_WIDTH: 0.276322
G1 F1750
M204 S6000
G3 X116.898 Y144.14 I-.382 J-8.74 E.01914
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.428762
G1 F1750
M204 S6000
G1 X117.416 Y144.131 E.0132
; LINE_WIDTH: 0.469254
G2 X117.819 Y143.954 I-.211 J-1.032 E.01542
; LINE_WIDTH: 0.417571
G1 X118.196 Y143.634 E.0151
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9608.959
G1 X117.819 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/76
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G2 X119.056 Y110.462 I-3.694 J3.765 E.06104
G3 X119.977 Y110.081 I.788 J.603 E.03207
G3 X120.728 Y111.504 I-.139 J.983 E.05762
; WIPE_START
G1 F3000
M204 S6000
G1 X120.337 Y111.23 E-.18137
G1 X119.94 Y110.937 E-.18745
G1 X119.518 Y110.682 E-.18749
G1 X119.056 Y110.462 E-.19432
G1 X119.073 Y110.444 E-.00938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
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


G1 X119.551 Y110.325 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.429072
G1 F1738
M204 S6000
G1 X119.937 Y110.472 E.01301
; LINE_WIDTH: 0.468127
G3 X120.324 Y110.719 I-.357 J.983 E.01604
; LINE_WIDTH: 0.422281
G3 X120.636 Y111.081 I-3.313 J3.172 E.01478
M204 S10000
G1 X120.626 Y111.191 F42000
; LINE_WIDTH: 0.254479
G1 F1738
M204 S6000
G1 X120.512 Y110.97 E.00429
; LINE_WIDTH: 0.2963
G1 X120.487 Y110.927 E.00103
; LINE_WIDTH: 0.32877
G1 X120.083 Y110.306 E.01724
; WIPE_START
G1 F12594.014
G1 X120.487 Y110.927 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.756 Y115.281 Z9.2 F42000
G1 X147.135 Y129.434 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1738
M204 S6000
G1 X146.792 Y129.59 E.01251
G3 X146.774 Y129.218 I-.044 J-.184 E.02214
G3 X146.846 Y129.243 I-.012 J.147 E.00255
G1 X147.085 Y129.401 E.00951
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1738
M204 S6000
G1 X147.831 Y129.561 E.00496
G1 X146.963 Y129.962 E.03172
G3 X146.833 Y128.814 I-.214 J-.557 E.07226
G3 X147.049 Y128.89 I-.094 J.615 E.00765
G1 X147.792 Y129.379 E.0295
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G3 X147.041 Y130.35 I-1.608 J-2.824 E.01923
G3 X147.245 Y128.55 I-.293 J-.945 E.12067
G1 X147.704 Y128.852 E.0169
G2 X146.773 Y121.994 I-20.835 J-.662 E.21365
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.454 Y120.568 E.0065
G1 X146.89 Y120.601 E.01343
G3 X145.576 Y138.132 I-18.925 J7.396 E.55863
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228906
G1 F1738
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.228898
G1 F1738
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z9.2 F42000
G1 X133.007 Y123.954 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1738
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1738
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.805 Y126.048 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F1738
M204 S5000
G1 X134.952 Y125.982 E.00494
G3 X135.908 Y125.789 I1.026 J2.616 E.03011
G1 X136.048 Y125.789 E.0043
G3 X134.696 Y126.097 I-.07 J2.809 E.49939
G1 X134.751 Y126.072 E.00185
; WIPE_START
G1 F3000
M204 S6000
G1 X134.952 Y125.982 E-.08393
G1 X135.216 Y125.893 E-.106
G1 X135.49 Y125.83 E-.10657
G1 X135.908 Y125.789 E-.15956
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10646
G1 X136.698 Y125.888 E-.03776
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.649 Y131.311 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
G1 F1738
M204 S5000
G1 X137.569 Y131.354 E.00277
G3 X135.739 Y125.417 I-1.598 J-2.758 E.35206
G3 X136.1 Y125.411 I.228 J2.987 E.01109
G3 X137.835 Y131.182 I-.129 J3.185 E.24256
G1 X137.698 Y131.277 E.00514
; WIPE_START
G1 F3000
M204 S6000
G1 X137.569 Y131.354 E-.05701
G1 X137.29 Y131.506 E-.12083
G1 X136.994 Y131.622 E-.12082
G1 X136.687 Y131.708 E-.12084
G1 X136.374 Y131.763 E-.1208
G1 X136.057 Y131.787 E-.1209
G1 X135.797 Y131.78 E-.0988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1738
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1738
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1738
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z9.2 F42000
G1 X118.33 Y143.172 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F1738
M204 S5000
G1 X118.36 Y143.258 E.00279
G3 X116.542 Y144.009 I-.952 J.271 E.08857
G2 X118.282 Y143.207 I-1.303 J-5.111 E.05919
M204 S10000
G1 X118.204 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242868
G1 F1738
M204 S6000
G1 X118.075 Y143.702 E.00355
; LINE_WIDTH: 0.27253
G1 X117.612 Y144.3 E.01415
M204 S10000
G1 X117.904 Y144.154 F42000
; LINE_WIDTH: 0.276203
G1 F1738
M204 S6000
G3 X116.898 Y144.14 I-.382 J-8.747 E.01913
M204 S10000
G1 X117.004 Y144.215 F42000
; LINE_WIDTH: 0.428638
G1 F1738
M204 S6000
G1 X117.415 Y144.131 E.01317
; LINE_WIDTH: 0.469187
G2 X117.82 Y143.954 I-.21 J-1.033 E.01545
; LINE_WIDTH: 0.417549
G1 X118.196 Y143.633 E.0151
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9609.521
G1 X117.82 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/76
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G2 X119.056 Y110.462 I-3.695 J3.766 E.06104
G3 X119.977 Y110.081 I.788 J.603 E.03208
G3 X120.728 Y111.504 I-.139 J.983 E.05761
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.18144
G1 X119.94 Y110.936 E-.18766
G1 X119.517 Y110.682 E-.18739
G1 X119.056 Y110.462 E-.19412
G1 X119.073 Y110.444 E-.00939
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
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


G1 X119.424 Y110.389 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275729
G1 F1749
M204 S6000
G3 X120.375 Y110.474 I-2.751 J36.214 E.01812
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328729
G1 F1749
M204 S6000
G1 X120.487 Y110.927 E.01725
; LINE_WIDTH: 0.29624
G1 X120.512 Y110.969 E.00102
; LINE_WIDTH: 0.254642
G1 X120.626 Y111.191 E.0043
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422341
G1 F1749
M204 S6000
G2 X120.324 Y110.719 I-3.569 J2.761 E.0148
; LINE_WIDTH: 0.468114
G2 X119.937 Y110.472 I-.743 J.736 E.01603
; LINE_WIDTH: 0.429067
G1 X119.55 Y110.326 E.013
; WIPE_START
G1 F9322.887
G1 X119.937 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.198 Y114.837 Z9.4 F42000
G1 X147.135 Y129.434 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X146.807 Y129.585 E.01199
G3 X146.773 Y129.218 I-.06 J-.18 E.02266
G3 X146.845 Y129.243 I-.012 J.148 E.00256
G1 X147.085 Y129.401 E.00952
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1749
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.963 Y129.962 E.03172
G3 X146.832 Y128.814 I-.214 J-.557 E.07224
G3 X147.049 Y128.89 I-.093 J.617 E.00767
G1 X147.792 Y129.379 E.0295
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G3 X147.042 Y130.35 I-1.613 J-2.836 E.01921
G3 X147.245 Y128.549 I-.294 J-.945 E.12069
G1 X147.704 Y128.852 E.0169
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.431 Y120.567 E.00578
G1 X146.89 Y120.601 E.01414
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1749
M204 S6000
G3 X145.362 Y137.919 I-20.51 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.228901
G1 F1749
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.045 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z9.4 F42000
G1 X133.007 Y123.954 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1749
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.785 Y126.057 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X134.951 Y125.982 E.00558
G3 X135.908 Y125.789 I1.027 J2.615 E.03015
G1 X136.048 Y125.789 E.0043
G3 X134.696 Y126.097 I-.07 J2.809 E.49938
G1 X134.731 Y126.081 E.00118
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.09181
G1 X135.352 Y125.858 E-.15961
G1 X135.628 Y125.81 E-.10645
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10645
G1 X136.678 Y125.879 E-.02942
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.642 Y131.316 Z9.4 F42000
G1 Z9
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X137.43 Y131.431 E.00742
G3 X135.897 Y125.409 I-1.464 J-2.834 E.35247
G1 X136.096 Y125.411 E.00612
G3 X137.704 Y131.272 I-.13 J3.187 E.2474
G1 X137.691 Y131.281 E.0005
; WIPE_START
G1 F3000
M204 S6000
G1 X137.43 Y131.431 E-.11449
G1 X137.143 Y131.567 E-.12079
G1 X136.842 Y131.669 E-.12082
G1 X136.532 Y131.739 E-.12081
G1 X136.216 Y131.779 E-.12091
G1 X135.898 Y131.787 E-.12077
G1 X135.789 Y131.779 E-.0414
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z9.4 F42000
M73 P82 R5
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1749
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z9.4 F42000
G1 X118.33 Y143.172 Z9.4
G1 Z9
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X118.36 Y143.257 E.00278
G3 X116.542 Y144.009 I-.952 J.271 E.08858
G2 X118.282 Y143.207 I-1.304 J-5.112 E.05919
M204 S10000
G1 X118.204 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242995
G1 F1749
M204 S6000
G1 X118.075 Y143.702 E.00355
; LINE_WIDTH: 0.272314
G1 X117.612 Y144.3 E.01413
M204 S10000
G1 X117.857 Y144.188 F42000
; LINE_WIDTH: 0.275859
G1 F1749
M204 S6000
G3 X116.899 Y144.14 I2.406 J-58.089 E.0182
M204 S10000
G1 X117.004 Y144.214 F42000
; LINE_WIDTH: 0.428625
G1 F1749
M204 S6000
G1 X117.415 Y144.131 E.01317
; LINE_WIDTH: 0.469172
G2 X117.82 Y143.954 I-.21 J-1.033 E.01547
; LINE_WIDTH: 0.417572
G1 X118.196 Y143.633 E.0151
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9608.93
G1 X117.82 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/76
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.557 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G2 X119.056 Y110.462 I-3.695 J3.766 E.06104
G3 X119.978 Y110.081 I.788 J.603 E.03209
G3 X120.728 Y111.504 I-.14 J.983 E.0576
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.1816
G1 X119.94 Y110.936 E-.18749
G1 X119.517 Y110.682 E-.1876
G1 X119.056 Y110.462 E-.19391
G1 X119.073 Y110.444 E-.00941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
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


G1 X119.425 Y110.388 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275675
G1 F1749
M204 S6000
G3 X120.377 Y110.475 I-2.724 J35.062 E.01814
M204 S10000
G1 X120.084 Y110.306 F42000
; LINE_WIDTH: 0.328481
G1 F1749
M204 S6000
G1 X120.488 Y110.928 E.01726
; LINE_WIDTH: 0.296059
G1 X120.512 Y110.969 E.00098
; LINE_WIDTH: 0.254796
G1 X120.626 Y111.191 E.00431
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422551
G1 F1749
M204 S6000
G2 X120.324 Y110.719 I-3.544 J2.738 E.01481
; LINE_WIDTH: 0.468086
G2 X119.937 Y110.472 I-.743 J.736 E.01605
; LINE_WIDTH: 0.429056
G1 X119.552 Y110.325 E.01296
; WIPE_START
G1 F9323.15
G1 X119.937 Y110.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.198 Y114.837 Z9.6 F42000
G1 X147.135 Y129.434 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X146.807 Y129.585 E.01198
G3 X146.773 Y129.218 I-.06 J-.18 E.02264
G3 X146.845 Y129.243 I-.011 J.147 E.00257
G1 X147.085 Y129.401 E.00952
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1749
M204 S6000
G1 X147.831 Y129.561 E.00496
G1 X146.962 Y129.962 E.03174
G3 X146.832 Y128.814 I-.214 J-.557 E.07221
G3 X147.049 Y128.89 I-.093 J.616 E.00767
G1 X147.792 Y129.379 E.02951
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G3 X147.042 Y130.35 I-1.607 J-2.82 E.0192
G3 X147.245 Y128.549 I-.294 J-.945 E.12071
G1 X147.704 Y128.852 E.0169
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.408 Y120.565 E.00506
G1 X146.89 Y120.601 E.01486
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.726 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228904
G1 F1749
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.2289
G1 F1749
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z9.6 F42000
G1 X133.007 Y123.954 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1749
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.79 Y126.053 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X134.822 Y126.036 E.00111
G3 X135.908 Y125.789 I1.156 J2.561 E.03445
G1 X136.048 Y125.789 E.0043
G3 X134.573 Y126.164 I-.07 J2.809 E.49508
G1 X134.736 Y126.08 E.00565
; WIPE_START
G1 F3000
M204 S6000
G1 X134.822 Y126.036 E-.0365
G1 X135.083 Y125.934 E-.10644
G1 X135.352 Y125.858 E-.10644
G1 X135.628 Y125.81 E-.10643
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10641
G1 X136.683 Y125.881 E-.03155
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.636 Y131.319 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X137.43 Y131.431 E.00721
G3 X135.897 Y125.409 I-1.463 J-2.834 E.35244
G1 X136.092 Y125.411 E.006
G3 X137.705 Y131.272 I-.125 J3.187 E.24755
G1 X137.686 Y131.285 E.0007
; WIPE_START
G1 F3000
M204 S6000
G1 X137.43 Y131.431 E-.11189
G1 X137.143 Y131.567 E-.12085
G1 X136.842 Y131.669 E-.1208
G1 X136.532 Y131.739 E-.12085
G1 X136.181 Y131.781 E-.13418
G1 X135.898 Y131.787 E-.10746
G1 X135.783 Y131.778 E-.04398
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1749
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z9.6 F42000
G1 X118.33 Y143.172 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X118.353 Y143.234 E.00202
G3 X116.542 Y144.009 I-.945 J.295 E.08934
G2 X118.281 Y143.207 I-1.304 J-5.112 E.05918
M204 S10000
G1 X118.204 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.24269
G1 F1749
M204 S6000
G1 X118.074 Y143.702 E.00355
; LINE_WIDTH: 0.272394
G1 X117.612 Y144.3 E.01413
M204 S10000
G1 X117.859 Y144.186 F42000
; LINE_WIDTH: 0.275696
G1 F1749
M204 S6000
G3 X116.899 Y144.14 I1.529 J-42.236 E.01824
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428566
G1 F1749
M204 S6000
G1 X117.414 Y144.131 E.01313
; LINE_WIDTH: 0.469128
G2 X117.82 Y143.954 I-.21 J-1.033 E.01549
; LINE_WIDTH: 0.417518
G1 X118.196 Y143.633 E.01509
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9610.302
G1 X117.82 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/76
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G2 X119.056 Y110.462 I-3.695 J3.766 E.06104
G3 X119.978 Y110.081 I.788 J.603 E.0321
M73 P82 R4
G3 X120.728 Y111.504 I-.14 J.983 E.05759
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.18167
G1 X119.939 Y110.936 E-.18755
G1 X119.516 Y110.681 E-.18764
G1 X119.056 Y110.462 E-.19371
G1 X119.073 Y110.444 E-.00943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275394
G1 F1752
M204 S6000
G3 X120.374 Y110.472 I-3.941 J49.967 E.01808
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328391
G1 F1752
M204 S6000
G1 X120.488 Y110.929 E.01727
; LINE_WIDTH: 0.295992
G1 X120.512 Y110.969 E.00097
; LINE_WIDTH: 0.254984
G1 X120.626 Y111.191 E.00432
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422717
G1 F1752
M204 S6000
G2 X120.323 Y110.718 I-3.515 J2.714 E.01485
; LINE_WIDTH: 0.472578
G2 X120.009 Y110.501 I-.743 J.738 E.01344
; LINE_WIDTH: 0.431807
G1 X119.554 Y110.324 E.01547
; WIPE_START
G1 F9257.201
G1 X120.009 Y110.501 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.268 Y114.87 Z9.8 F42000
G1 X147.135 Y129.434 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X146.807 Y129.585 E.01198
G3 X146.773 Y129.218 I-.06 J-.18 E.02263
G3 X146.845 Y129.243 I-.011 J.148 E.00258
G1 X147.085 Y129.401 E.00953
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1752
M204 S6000
G1 X147.831 Y129.561 E.00496
G1 X146.962 Y129.962 E.03173
G3 X146.831 Y128.814 I-.214 J-.557 E.07218
G3 X147.049 Y128.89 I-.092 J.618 E.00769
G1 X147.792 Y129.379 E.02952
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G3 X147.043 Y130.349 I-1.612 J-2.831 E.01916
G3 X147.245 Y128.549 I-.296 J-.944 E.12074
G1 X147.704 Y128.852 E.01691
G2 X146.773 Y121.994 I-20.835 J-.662 E.21365
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.384 Y120.563 E.00435
G1 X146.89 Y120.601 E.01558
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1752
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.952 E.13113
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1752
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z9.8 F42000
G1 X133.007 Y123.954 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1752
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.747 Y126.074 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X134.951 Y125.982 E.00687
G3 X135.908 Y125.789 I1.027 J2.615 E.03014
G1 X136.048 Y125.789 E.0043
G3 X134.693 Y126.099 I-.07 J2.809 E.49928
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.10776
G1 X135.216 Y125.893 E-.10637
G1 X135.49 Y125.83 E-.10653
G1 X135.908 Y125.789 E-.15958
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10651
G1 X136.603 Y125.858 E-.10645
G1 X136.637 Y125.868 E-.01358
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.631 Y131.322 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X137.431 Y131.431 E.007
G3 X135.897 Y125.409 I-1.463 J-2.834 E.35241
G1 X136.088 Y125.41 E.00587
M73 P83 R4
G3 X137.705 Y131.272 I-.121 J3.187 E.24771
G1 X137.68 Y131.289 E.00091
; WIPE_START
G1 F3000
M204 S6000
G1 X137.431 Y131.431 E-.10932
G1 X137.143 Y131.567 E-.12083
G1 X136.842 Y131.669 E-.12085
G1 X136.532 Y131.739 E-.12083
G1 X136.216 Y131.779 E-.12088
G1 X135.898 Y131.787 E-.12079
G1 X135.776 Y131.778 E-.04651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1752
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z9.8 F42000
G1 X118.33 Y143.172 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X118.353 Y143.234 E.00202
G3 X116.542 Y144.009 I-.945 J.295 E.08934
G2 X118.281 Y143.207 I-1.304 J-5.113 E.05917
M204 S10000
G1 X118.204 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.24282
G1 F1752
M204 S6000
G1 X118.074 Y143.702 E.00356
; LINE_WIDTH: 0.272197
G1 X117.613 Y144.3 E.0141
M204 S10000
G1 X117.861 Y144.184 F42000
; LINE_WIDTH: 0.275366
G1 F1752
M204 S6000
G3 X116.899 Y144.14 I1.183 J-36.24 E.01825
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428579
G1 F1752
M204 S6000
G1 X117.414 Y144.131 E.01311
; LINE_WIDTH: 0.469083
G2 X117.82 Y143.954 I-.209 J-1.033 E.01552
; LINE_WIDTH: 0.417556
G1 X118.196 Y143.633 E.01508
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9609.348
G1 X117.82 Y143.954 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/76
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z9.8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G2 X119.056 Y110.462 I-3.696 J3.767 E.06103
G3 X119.978 Y110.081 I.788 J.603 E.03211
G3 X120.728 Y111.504 I-.14 J.983 E.05757
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.18173
G1 X119.939 Y110.936 E-.18776
G1 X119.516 Y110.681 E-.18751
G1 X119.056 Y110.462 E-.19354
G1 X119.073 Y110.444 E-.00946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
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


G1 X119.425 Y110.388 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275245
G1 F1749
M204 S6000
G3 X120.375 Y110.473 I-3.655 J46.358 E.01806
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328413
G1 F1749
M204 S6000
G1 X120.488 Y110.929 E.01728
; LINE_WIDTH: 0.295987
G1 X120.512 Y110.968 E.00095
; LINE_WIDTH: 0.255157
G1 X120.626 Y111.191 E.00433
M204 S10000
G1 X120.636 Y111.081 F42000
; LINE_WIDTH: 0.422966
G1 F1749
M204 S6000
G2 X120.323 Y110.718 I-3.48 J2.685 E.01485
; LINE_WIDTH: 0.472615
G2 X120.01 Y110.501 I-.741 J.736 E.01342
; LINE_WIDTH: 0.431662
G1 X119.936 Y110.471 E.00253
G2 X119.507 Y110.344 I-.917 J2.31 E.01417
; WIPE_START
G1 F9260.642
G1 X119.936 Y110.471 E-.64479
G1 X120.01 Y110.501 E-.11521
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.268 Y114.87 Z10 F42000
G1 X147.135 Y129.434 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X146.807 Y129.585 E.01199
G3 X146.772 Y129.218 I-.06 J-.18 E.02263
G3 X146.845 Y129.243 I-.011 J.149 E.00259
G1 X147.085 Y129.401 E.00954
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1749
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.962 Y129.962 E.03174
G3 X146.83 Y128.814 I-.213 J-.557 E.07216
G3 X147.049 Y128.89 I-.092 J.619 E.0077
G1 X147.792 Y129.379 E.02952
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G3 X147.044 Y130.349 I-1.62 J-2.85 E.01914
G3 X147.245 Y128.549 I-.296 J-.944 E.12075
G1 X147.704 Y128.852 E.01691
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.388 J4.834 E.04721
G1 X146.361 Y120.561 E.00363
G1 X146.89 Y120.601 E.0163
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228906
G1 F1749
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.228898
G1 F1749
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z10 F42000
G1 X133.007 Y123.954 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1749
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.757 Y126.07 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X134.822 Y126.036 E.00223
G3 X135.908 Y125.789 I1.156 J2.561 E.03444
G1 X136.048 Y125.789 E.0043
G3 X134.573 Y126.164 I-.07 J2.809 E.49508
G1 X134.704 Y126.097 E.00454
; WIPE_START
G1 F3000
M204 S6000
G1 X134.822 Y126.036 E-.05041
G1 X135.083 Y125.934 E-.10643
G1 X135.352 Y125.858 E-.10647
G1 X135.628 Y125.81 E-.10637
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.603 Y125.858 E-.10646
G1 X136.648 Y125.871 E-.01762
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.625 Y131.326 Z10 F42000
G1 Z9.6
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X137.431 Y131.432 E.00681
G3 X135.897 Y125.409 I-1.462 J-2.834 E.35236
G1 X136.084 Y125.41 E.00575
G3 X137.705 Y131.273 I-.116 J3.187 E.24788
G1 X137.675 Y131.292 E.00111
; WIPE_START
G1 F3000
M204 S6000
G1 X137.431 Y131.432 E-.1069
G1 X137.143 Y131.567 E-.12073
G1 X136.842 Y131.668 E-.12077
G1 X136.531 Y131.739 E-.12096
G1 X136.216 Y131.779 E-.12084
G1 X135.898 Y131.787 E-.1208
G1 X135.77 Y131.777 E-.049
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1749
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z10 F42000
G1 X118.33 Y143.172 Z10
G1 Z9.6
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X118.353 Y143.234 E.00203
G3 X116.542 Y144.009 I-.945 J.294 E.08932
G2 X118.281 Y143.207 I-1.305 J-5.113 E.05917
M204 S10000
G1 X118.204 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242534
G1 F1749
M204 S6000
G1 X118.074 Y143.702 E.00356
; LINE_WIDTH: 0.272319
G1 X117.613 Y144.3 E.01411
M204 S10000
G1 X117.86 Y144.185 F42000
; LINE_WIDTH: 0.27512
G1 F1749
M204 S6000
G3 X116.899 Y144.14 I1.361 J-39.21 E.01821
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428486
G1 F1749
M204 S6000
G1 X117.413 Y144.131 E.0131
; LINE_WIDTH: 0.469029
G2 X117.82 Y143.953 I-.209 J-1.033 E.01554
; LINE_WIDTH: 0.41748
G1 X118.196 Y143.633 E.01508
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9611.287
G1 X117.82 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/76
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G2 X119.056 Y110.462 I-3.696 J3.767 E.06103
G3 X119.979 Y110.081 I.788 J.603 E.03212
G3 X120.728 Y111.504 I-.141 J.983 E.05757
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.18181
G1 X119.938 Y110.936 E-.18773
G1 X119.515 Y110.681 E-.18768
G1 X119.056 Y110.462 E-.19329
G1 X119.074 Y110.444 E-.00949
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274992
G1 F1752
M204 S6000
G3 X120.375 Y110.473 I-3.652 J46.238 E.01807
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328244
G1 F1752
M204 S6000
G1 X120.488 Y110.93 E.01729
; LINE_WIDTH: 0.295879
G1 X120.511 Y110.968 E.00092
; LINE_WIDTH: 0.255389
G1 X120.626 Y111.191 E.00434
M204 S10000
G1 X120.636 Y111.082 F42000
; LINE_WIDTH: 0.423092
G1 F1752
M204 S6000
G2 X120.323 Y110.718 I-3.394 J2.603 E.01489
; LINE_WIDTH: 0.472647
G2 X120.01 Y110.502 I-.741 J.736 E.01339
; LINE_WIDTH: 0.431655
G1 X119.935 Y110.471 E.00255
G2 X119.516 Y110.339 I-1.111 J2.795 E.01393
; WIPE_START
G1 F9260.812
G1 X119.935 Y110.471 E-.64229
G1 X120.01 Y110.502 E-.11771
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.269 Y114.87 Z10.2 F42000
G1 X147.135 Y129.434 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X146.807 Y129.585 E.01198
G3 X146.772 Y129.218 I-.058 J-.18 E.0224
G3 X146.845 Y129.243 I-.01 J.149 E.0026
G1 X147.085 Y129.401 E.00955
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1752
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.962 Y129.962 E.03175
G3 X146.83 Y128.814 I-.213 J-.557 E.07213
G3 X147.048 Y128.889 I-.091 J.619 E.00772
G1 X147.792 Y129.379 E.02952
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G3 X147.045 Y130.349 I-1.619 J-2.846 E.01911
G3 X147.245 Y128.549 I-.297 J-.944 E.12079
G1 X147.704 Y128.852 E.01691
G2 X146.773 Y121.994 I-20.836 J-.661 E.21365
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.338 Y120.56 E.00291
G1 X146.89 Y120.601 E.01701
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1752
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
M73 P84 R4
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.228895
G1 F1752
M204 S6000
G2 X146.647 Y120.779 I-20.574 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z10.2 F42000
G1 X133.007 Y123.954 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1752
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.709 Y126.091 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X134.951 Y125.982 E.00815
G3 X135.908 Y125.789 I1.027 J2.615 E.03015
G1 X136.048 Y125.789 E.0043
G3 X134.656 Y126.118 I-.07 J2.809 E.49799
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.12358
G1 X135.352 Y125.858 E-.15963
G1 X135.628 Y125.81 E-.10644
G1 X135.908 Y125.789 E-.1065
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.597 Y125.857 E-.10411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.619 Y131.329 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X137.431 Y131.432 E.0066
G3 X135.897 Y125.409 I-1.461 J-2.835 E.35231
G1 X136.08 Y125.41 E.00562
G3 X137.705 Y131.273 I-.111 J3.187 E.24806
G1 X137.669 Y131.296 E.00132
; WIPE_START
G1 F3000
M204 S6000
G1 X137.431 Y131.432 E-.10432
G1 X137.143 Y131.567 E-.12079
G1 X136.841 Y131.669 E-.12089
G1 X136.532 Y131.739 E-.12078
G1 X136.216 Y131.779 E-.12092
G1 X135.898 Y131.787 E-.12077
G1 X135.763 Y131.777 E-.05153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1752
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z10.2 F42000
G1 X118.33 Y143.172 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X118.353 Y143.235 E.00207
G3 X116.542 Y144.009 I-.946 J.293 E.08929
G2 X118.281 Y143.207 I-1.305 J-5.114 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243195
G1 F1752
M204 S6000
G1 X118.074 Y143.703 E.00355
; LINE_WIDTH: 0.27217
G1 X117.613 Y144.299 E.01409
M204 S10000
G1 X117.859 Y144.186 F42000
; LINE_WIDTH: 0.275049
G1 F1752
M204 S6000
G3 X116.899 Y144.14 I1.711 J-45.48 E.01818
M204 S10000
G1 X117.005 Y144.215 F42000
; LINE_WIDTH: 0.428415
G1 F1752
M204 S6000
G1 X117.413 Y144.131 E.01309
; LINE_WIDTH: 0.468982
G2 X117.821 Y143.953 I-.209 J-1.034 E.01556
; LINE_WIDTH: 0.417519
G1 X118.195 Y143.634 E.01503
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9610.295
G1 X117.821 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/76
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G2 X119.056 Y110.462 I-3.696 J3.768 E.06103
G3 X119.979 Y110.081 I.788 J.603 E.03213
G3 X120.728 Y111.504 I-.141 J.982 E.05755
; WIPE_START
G1 F3000
M204 S6000
G1 X120.336 Y111.23 E-.18182
G1 X119.938 Y110.935 E-.18786
G1 X119.515 Y110.681 E-.18772
G1 X119.056 Y110.462 E-.19309
G1 X119.074 Y110.444 E-.00951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274869
G1 F1752
M204 S6000
G3 X120.376 Y110.474 I-3.242 J41.082 E.01809
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328246
G1 F1752
M204 S6000
G1 X120.489 Y110.93 E.0173
; LINE_WIDTH: 0.295912
G1 X120.511 Y110.968 E.0009
; LINE_WIDTH: 0.255533
G1 X120.626 Y111.191 E.00435
M204 S10000
G1 X120.636 Y111.082 F42000
; LINE_WIDTH: 0.423294
G1 F1752
M204 S6000
G2 X120.322 Y110.717 I-3.392 J2.605 E.01491
; LINE_WIDTH: 0.472687
G2 X120.01 Y110.502 I-.74 J.736 E.01337
; LINE_WIDTH: 0.43157
G1 X119.935 Y110.471 E.00258
G2 X119.514 Y110.34 I-1.036 J2.596 E.01397
; WIPE_START
G1 F9262.839
G1 X119.935 Y110.471 E-.64158
G1 X120.01 Y110.502 E-.11842
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.269 Y114.87 Z10.4 F42000
G1 X147.135 Y129.434 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X146.808 Y129.585 E.01197
G3 X146.771 Y129.217 I-.058 J-.18 E.02239
G3 X146.845 Y129.243 I-.01 J.15 E.00261
G1 X147.085 Y129.401 E.00955
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1752
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.962 Y129.962 E.03176
G3 X146.829 Y128.814 I-.213 J-.557 E.07211
G3 X147.048 Y128.889 I-.091 J.619 E.00773
G1 X147.792 Y129.379 E.02953
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G3 X147.045 Y130.349 I-1.621 J-2.851 E.01909
G3 X147.245 Y128.549 I-.298 J-.944 E.1208
G1 X147.704 Y128.852 E.01692
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.314 Y120.558 E.00219
G1 X146.89 Y120.601 E.01773
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1752
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1752
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z10.4 F42000
G1 X133.007 Y123.954 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1752
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.696 Y126.097 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F1752
M204 S5000
G3 X135.908 Y125.789 I1.282 J2.5 E.03875
G1 X136.048 Y125.789 E.0043
G3 X134.643 Y126.125 I-.07 J2.809 E.49754
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.12926
G1 X135.216 Y125.893 E-.10637
G1 X135.49 Y125.83 E-.10672
G1 X135.908 Y125.789 E-.15938
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10652
G1 X136.582 Y125.855 E-.09851
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.607 Y131.338 Z10.4 F42000
G1 Z10
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X137.57 Y131.356 E.00127
G3 X135.898 Y125.409 I-1.6 J-2.759 E.35714
G1 X136.077 Y125.41 E.0055
G3 X137.837 Y131.184 I-.106 J3.188 E.24334
G1 X137.657 Y131.304 E.00665
; WIPE_START
G1 F3000
M204 S6000
G1 X137.57 Y131.356 E-.03847
G1 X137.143 Y131.567 E-.18104
G1 X136.842 Y131.669 E-.12084
G1 X136.532 Y131.739 E-.12085
G1 X136.216 Y131.779 E-.12087
G1 X135.898 Y131.787 E-.12081
G1 X135.748 Y131.776 E-.05713
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1752
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1752
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1752
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z10.4 F42000
G1 X118.33 Y143.172 Z10.4
G1 Z10
G1 E.8 F1800
G1 F1752
M204 S5000
G1 X118.353 Y143.235 E.00207
G3 X116.542 Y144.009 I-.946 J.293 E.08928
G2 X118.281 Y143.207 I-1.305 J-5.114 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242974
G1 F1752
M204 S6000
G1 X118.074 Y143.702 E.00355
; LINE_WIDTH: 0.272101
G1 X117.613 Y144.299 E.01408
M204 S10000
G1 X117.859 Y144.186 F42000
; LINE_WIDTH: 0.274783
G1 F1752
M204 S6000
G3 X116.899 Y144.14 I1.578 J-43.001 E.01817
M204 S10000
G1 X117.006 Y144.215 F42000
; LINE_WIDTH: 0.429596
G1 F1752
M204 S6000
G1 X117.459 Y144.121 E.01459
; LINE_WIDTH: 0.472246
G2 X117.821 Y143.953 I-.244 J-1.002 E.01404
; LINE_WIDTH: 0.417442
G1 X118.195 Y143.633 E.01503
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9612.274
G1 X117.821 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/76
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G2 X119.056 Y110.462 I-3.697 J3.769 E.06103
G3 X119.979 Y110.081 I.788 J.603 E.03214
G3 X120.728 Y111.504 I-.141 J.982 E.05754
; WIPE_START
G1 F3000
M204 S6000
G1 X120.335 Y111.229 E-.18188
G1 X119.938 Y110.935 E-.18793
G1 X119.515 Y110.68 E-.18777
G1 X119.056 Y110.462 E-.19289
G1 X119.074 Y110.444 E-.00953
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274618
G1 F1749
M204 S6000
G3 X120.377 Y110.475 I-2.923 J37.185 E.01809
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328229
G1 F1749
M204 S6000
G1 X120.489 Y110.93 E.01731
; LINE_WIDTH: 0.295768
G1 X120.511 Y110.968 E.0009
; LINE_WIDTH: 0.255699
G1 X120.626 Y111.19 E.00435
M204 S10000
G1 X120.636 Y111.082 F42000
; LINE_WIDTH: 0.423333
G1 F1749
M204 S6000
M73 P85 R4
G2 X120.322 Y110.717 I-3.353 J2.568 E.01493
; LINE_WIDTH: 0.472719
G2 X120.011 Y110.502 I-.74 J.736 E.01334
; LINE_WIDTH: 0.431585
G1 X119.934 Y110.471 E.0026
G2 X119.513 Y110.341 I-.999 J2.489 E.01398
; WIPE_START
G1 F9262.48
G1 X119.934 Y110.471 E-.64055
G1 X120.011 Y110.502 E-.11945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.269 Y114.87 Z10.6 F42000
G1 X147.135 Y129.434 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X146.808 Y129.585 E.01196
G3 X146.771 Y129.217 I-.061 J-.18 E.02258
G3 X146.844 Y129.242 I-.01 J.15 E.00262
G1 X147.085 Y129.401 E.00957
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1749
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.962 Y129.963 E.03176
G3 X146.829 Y128.814 I-.214 J-.557 E.07219
G3 X147.048 Y128.889 I-.091 J.62 E.00774
G1 X147.792 Y129.379 E.02954
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G3 X147.046 Y130.348 I-1.628 J-2.867 E.01906
G3 X147.244 Y128.549 I-.297 J-.943 E.12066
G1 X147.704 Y128.852 E.01692
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.388 J4.834 E.04721
G1 X146.291 Y120.556 E.00148
G1 X146.89 Y120.601 E.01845
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1749
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1749
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z10.6 F42000
G1 X133.007 Y123.954 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1749
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.705 Y126.096 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X134.822 Y126.036 E.00405
G3 X135.908 Y125.789 I1.156 J2.561 E.03444
G1 X136.048 Y125.789 E.0043
G3 X134.573 Y126.164 I-.07 J2.809 E.49508
G1 X134.651 Y126.124 E.00272
; WIPE_START
G1 F3000
M204 S6000
G1 X134.822 Y126.036 E-.07283
G1 X135.083 Y125.934 E-.10645
G1 X135.352 Y125.858 E-.10642
G1 X135.628 Y125.81 E-.1064
G1 X135.908 Y125.789 E-.10652
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10652
G1 X136.591 Y125.856 E-.10165
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.605 Y131.337 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X137.431 Y131.433 E.00611
G3 X135.898 Y125.409 I-1.46 J-2.836 E.3522
G1 X136.073 Y125.41 E.00538
G3 X137.706 Y131.274 I-.101 J3.188 E.2484
G1 X137.656 Y131.305 E.00181
; WIPE_START
G1 F3000
M204 S6000
G1 X137.431 Y131.433 E-.09838
G1 X137.143 Y131.567 E-.1207
G1 X136.842 Y131.669 E-.1209
G1 X136.532 Y131.739 E-.12081
G1 X136.216 Y131.779 E-.12089
G1 X135.898 Y131.787 E-.12079
G1 X135.747 Y131.775 E-.05753
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z10.6 F42000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1749
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1749
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1749
M204 S5000
G1 X133.205 Y132.01 E.07313
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.825 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y136.653 Z10.6 F42000
G1 X118.33 Y143.172 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F1749
M204 S5000
G1 X118.353 Y143.235 E.00207
G3 X116.542 Y144.009 I-.946 J.293 E.08928
G2 X118.281 Y143.207 I-1.306 J-5.115 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.24308
G1 F1749
M204 S6000
G1 X118.074 Y143.703 E.00356
; LINE_WIDTH: 0.272025
G1 X117.614 Y144.299 E.01406
M204 S10000
G1 X117.859 Y144.186 F42000
; LINE_WIDTH: 0.274432
G1 F1749
M204 S6000
G3 X116.898 Y144.14 I1.471 J-40.908 E.01815
M204 S10000
G1 X117.006 Y144.215 F42000
; LINE_WIDTH: 0.429609
G1 F1749
M204 S6000
G1 X117.459 Y144.121 E.01459
; LINE_WIDTH: 0.472224
G2 X117.821 Y143.953 I-.245 J-1.003 E.01405
; LINE_WIDTH: 0.417397
G1 X118.195 Y143.633 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9613.406
G1 X117.821 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/76
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G2 X119.056 Y110.462 I-3.697 J3.769 E.06103
G3 X119.98 Y110.082 I.788 J.603 E.03215
G3 X120.728 Y111.504 I-.142 J.982 E.05753
; WIPE_START
G1 F3000
M204 S6000
G1 X120.335 Y111.229 E-.18198
G1 X119.938 Y110.935 E-.18797
G1 X119.514 Y110.68 E-.18783
G1 X119.056 Y110.462 E-.19268
G1 X119.074 Y110.444 E-.00955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.27455
G1 F1753
M204 S6000
G1 X119.718 Y110.415 E.00558
; LINE_WIDTH: 0.329066
G1 X120.447 Y110.55 E.01729
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.328093
G1 F1753
M204 S6000
G1 X120.489 Y110.931 E.01732
; LINE_WIDTH: 0.295696
G1 X120.511 Y110.967 E.00086
; LINE_WIDTH: 0.255849
G1 X120.626 Y111.191 E.00437
M204 S10000
G1 X120.636 Y111.082 F42000
; LINE_WIDTH: 0.42353
G1 F1753
M204 S6000
G1 X120.322 Y110.717 E.01495
; LINE_WIDTH: 0.472767
G2 X120.011 Y110.502 I-.738 J.735 E.01331
; LINE_WIDTH: 0.431535
G1 X119.934 Y110.47 E.00263
G2 X119.514 Y110.34 I-1.007 J2.5 E.01393
; WIPE_START
G1 F9263.674
G1 X119.934 Y110.47 E-.63915
G1 X120.011 Y110.502 E-.12085
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.27 Y114.87 Z10.8 F42000
G1 X147.135 Y129.434 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X146.808 Y129.585 E.01196
G3 X146.77 Y129.217 I-.061 J-.18 E.02256
G3 X146.844 Y129.242 I-.009 J.149 E.00262
G1 X147.085 Y129.401 E.00958
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1753
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.961 Y129.963 E.03176
G3 X146.828 Y128.814 I-.213 J-.557 E.07206
G3 X147.048 Y128.889 I-.09 J.62 E.00776
G1 X147.792 Y129.379 E.02955
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G3 X147.047 Y130.348 I-1.633 J-2.879 E.01903
G3 X147.244 Y128.549 I-.299 J-.943 E.12083
G1 X147.704 Y128.852 E.01693
G2 X146.773 Y121.994 I-20.836 J-.662 E.21364
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.268 Y120.554 E.00076
G1 X146.89 Y120.601 E.01916
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228906
G1 F1753
M204 S6000
G3 X145.362 Y137.919 I-20.51 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.228899
G1 F1753
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z10.8 F42000
G1 X133.007 Y123.954 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1753
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.696 Y126.097 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F1753
M204 S5000
G3 X135.908 Y125.789 I1.282 J2.5 E.03875
G1 X136.048 Y125.789 E.0043
G3 X134.643 Y126.125 I-.07 J2.809 E.49754
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.12916
G1 X135.217 Y125.893 E-.1065
G1 X135.49 Y125.83 E-.10647
G1 X135.908 Y125.789 E-.1596
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.1065
G1 X136.582 Y125.855 E-.09853
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.596 Y131.345 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X137.571 Y131.357 E.00084
G3 X135.898 Y125.409 I-1.598 J-2.76 E.35701
G1 X136.069 Y125.409 E.00525
G3 X137.838 Y131.185 I-.096 J3.188 E.24373
G1 X137.646 Y131.312 E.00708
; WIPE_START
G1 F3000
M204 S6000
G1 X137.571 Y131.357 E-.03317
G1 X137.132 Y131.571 E-.18551
G1 X136.842 Y131.669 E-.11643
G1 X136.532 Y131.739 E-.1208
G1 X136.216 Y131.779 E-.12092
G1 X135.898 Y131.787 E-.1208
G1 X135.734 Y131.775 E-.06238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z10.8 F42000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1753
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.835 Y131.833 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X133.205 Y132.01 E.07302
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.831 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.828 Y131.991 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.784 Y136.652 Z10.8 F42000
G1 X118.33 Y143.172 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X118.354 Y143.236 E.00208
G3 X116.542 Y144.009 I-.946 J.293 E.08927
G2 X118.281 Y143.207 I-1.306 J-5.115 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243153
G1 F1753
M204 S6000
G1 X118.074 Y143.703 E.00357
; LINE_WIDTH: 0.271999
G1 X117.614 Y144.299 E.01405
M204 S10000
G1 X117.861 Y144.185 F42000
; LINE_WIDTH: 0.274091
G1 F1753
M204 S6000
G3 X116.898 Y144.14 I1.228 J-36.554 E.01815
M204 S10000
G1 X117.006 Y144.216 F42000
; LINE_WIDTH: 0.429622
G1 F1753
M204 S6000
G1 X117.459 Y144.121 E.01459
; LINE_WIDTH: 0.472235
G2 X117.821 Y143.953 I-.245 J-1.003 E.01405
; LINE_WIDTH: 0.417414
G1 X118.195 Y143.633 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9612.98
G1 X117.821 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/76
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z10.8 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z10.8
G1 Z10.6
M73 P86 R4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G2 X119.056 Y110.462 I-3.698 J3.77 E.06103
G3 X119.98 Y110.082 I.788 J.603 E.03216
G3 X120.728 Y111.504 I-.142 J.982 E.05752
; WIPE_START
G1 F3000
M204 S6000
G1 X120.335 Y111.229 E-.1821
G1 X119.937 Y110.935 E-.18798
G1 X119.514 Y110.68 E-.18788
G1 X119.056 Y110.462 E-.19247
G1 X119.074 Y110.444 E-.00957
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
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


G1 X119.423 Y110.388 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.274127
G1 F1753
M204 S6000
G1 X119.717 Y110.415 E.00556
; LINE_WIDTH: 0.328997
G1 X120.447 Y110.55 E.01729
M204 S10000
G1 X120.083 Y110.306 F42000
; LINE_WIDTH: 0.327882
G1 F1753
M204 S6000
G1 X120.49 Y110.932 E.01733
; LINE_WIDTH: 0.295514
G1 X120.511 Y110.967 E.00084
; LINE_WIDTH: 0.256317
G1 X120.626 Y111.191 E.00438
M204 S10000
G1 X120.636 Y111.082 F42000
; LINE_WIDTH: 0.423716
G1 F1753
M204 S6000
G1 X120.322 Y110.717 E.01496
; LINE_WIDTH: 0.472795
G2 X120.011 Y110.502 I-.737 J.734 E.01329
; LINE_WIDTH: 0.4315
G1 X119.933 Y110.47 E.00267
G2 X119.514 Y110.34 I-.987 J2.441 E.01392
; WIPE_START
G1 F9264.514
G1 X119.933 Y110.47 E-.63762
G1 X120.011 Y110.502 E-.12238
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.27 Y114.871 Z11 F42000
G1 X147.135 Y129.434 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X146.808 Y129.585 E.01196
G3 X146.77 Y129.217 I-.061 J-.18 E.02254
G3 X146.844 Y129.242 I-.009 J.15 E.00263
G1 X147.085 Y129.401 E.00959
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1753
M204 S6000
G1 X147.831 Y129.561 E.00497
M73 P86 R3
G1 X146.961 Y129.963 E.03176
G3 X146.827 Y128.814 I-.214 J-.557 E.07211
G3 X147.048 Y128.889 I-.09 J.621 E.00777
G1 X147.792 Y129.379 E.02956
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G3 X147.048 Y130.348 I-1.638 J-2.889 E.019
G3 X147.244 Y128.549 I-.299 J-.943 E.12072
G1 X147.704 Y128.852 E.01693
G2 X146.773 Y121.994 I-20.835 J-.662 E.21365
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.245 Y120.553 E.00004
G1 X146.89 Y120.601 E.01988
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1753
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.228901
G1 F1753
M204 S6000
G2 X146.647 Y120.779 I-20.572 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.045 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z11 F42000
G1 X133.007 Y123.954 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1753
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.696 Y126.097 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F1753
M204 S5000
G3 X135.908 Y125.789 I1.282 J2.5 E.03875
G1 X136.048 Y125.789 E.0043
G3 X134.643 Y126.125 I-.07 J2.809 E.49754
; WIPE_START
G1 F3000
M204 S6000
G1 X134.951 Y125.982 E-.12917
G1 X135.216 Y125.893 E-.1065
G1 X135.49 Y125.83 E-.10651
G1 X135.908 Y125.789 E-.15957
G1 X136.048 Y125.789 E-.05322
G1 X136.327 Y125.81 E-.10652
G1 X136.582 Y125.855 E-.0985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.59 Y131.349 Z11 F42000
G1 Z10.6
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X137.571 Y131.358 E.00064
G3 X135.898 Y125.409 I-1.597 J-2.761 E.35694
G1 X136.065 Y125.409 E.00513
G3 X137.838 Y131.185 I-.091 J3.188 E.24393
G1 X137.64 Y131.316 E.00728
; WIPE_START
G1 F3000
M204 S6000
G1 X137.571 Y131.358 E-.03069
G1 X137.29 Y131.506 E-.12082
G1 X136.994 Y131.622 E-.12081
G1 X136.687 Y131.708 E-.12087
G1 X136.374 Y131.763 E-.12082
G1 X135.898 Y131.787 E-.18115
G1 X135.728 Y131.77 E-.06484
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z11 F42000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1753
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1753
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1753
M204 S5000
G1 X130.844 Y131.833 E.00039
G1 X133.205 Y132.01 E.07274
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.844 Y131.833 E-.02331
G1 X132.777 Y131.978 E-.73669
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.744 Y136.653 Z11 F42000
G1 X118.33 Y143.172 Z11
G1 Z10.6
G1 E.8 F1800
G1 F1753
M204 S5000
G1 X118.354 Y143.236 E.00208
G3 X116.542 Y144.009 I-.946 J.293 E.08927
G2 X118.281 Y143.207 I-1.307 J-5.116 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242899
G1 F1753
M204 S6000
G1 X118.073 Y143.703 E.00357
; LINE_WIDTH: 0.271951
G1 X117.614 Y144.299 E.01404
M204 S10000
G1 X117.861 Y144.185 F42000
; LINE_WIDTH: 0.274024
G1 F1753
M204 S6000
G3 X116.898 Y144.14 I1.197 J-36.016 E.01815
M204 S10000
G1 X117.003 Y144.214 F42000
; LINE_WIDTH: 0.429501
G1 F1753
M204 S6000
G1 X117.459 Y144.121 E.01468
; LINE_WIDTH: 0.472231
G2 X117.822 Y143.953 I-.245 J-1.004 E.01405
; LINE_WIDTH: 0.417339
G1 X118.195 Y143.633 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9614.917
G1 X117.822 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/76
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G2 X119.057 Y110.462 I-3.698 J3.771 E.06102
G3 X119.98 Y110.082 I.788 J.604 E.03217
G3 X120.728 Y111.503 I-.142 J.982 E.05751
; WIPE_START
G1 F3000
M204 S6000
G1 X120.335 Y111.229 E-.18217
G1 X119.937 Y110.935 E-.18803
G1 X119.513 Y110.68 E-.18792
G1 X119.057 Y110.462 E-.19228
G1 X119.074 Y110.444 E-.00959
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
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
            G0 Z11.2 F4000
            G39.3 S1
            G0 Z11.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.423 Y110.388 F42000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.273646
G1 F1750
M204 S6000
G1 X119.717 Y110.415 E.00555
; LINE_WIDTH: 0.328966
G1 X120.447 Y110.55 E.01731
M204 S10000
G1 X120.123 Y110.319 F42000
; LINE_WIDTH: 0.295432
G1 F1750
M204 S6000
G1 X120.511 Y110.966 E.01552
; LINE_WIDTH: 0.256489
G1 X120.626 Y111.19 E.00439
M204 S10000
G1 X120.636 Y111.083 F42000
; LINE_WIDTH: 0.42382
G1 F1750
M204 S6000
G1 X120.321 Y110.716 E.01499
; LINE_WIDTH: 0.472848
G2 X120.012 Y110.502 I-.737 J.734 E.01325
; LINE_WIDTH: 0.431544
G1 X119.933 Y110.47 E.0027
G2 X119.515 Y110.34 I-.991 J2.449 E.0139
; WIPE_START
G1 F9263.45
G1 X119.933 Y110.47 E-.63639
G1 X120.012 Y110.502 E-.12361
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.271 Y114.871 Z11.2 F42000
G1 X147.135 Y129.434 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X146.808 Y129.585 E.01195
G3 X146.769 Y129.217 I-.059 J-.18 E.02239
G3 X146.844 Y129.242 I-.009 J.15 E.00263
G1 X147.085 Y129.401 E.0096
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1750
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.961 Y129.963 E.03177
G3 X146.827 Y128.814 I-.213 J-.558 E.07202
G3 X147.048 Y128.889 I-.089 J.622 E.00778
G1 X147.792 Y129.379 E.02956
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G3 X147.049 Y130.348 I-1.642 J-2.899 E.01898
G3 X147.244 Y128.549 I-.301 J-.943 E.1209
G1 X147.704 Y128.852 E.01693
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.863 J7.401 E.55875
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228906
G1 F1750
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.228901
G1 F1750
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.045 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z11.2 F42000
G1 X133.007 Y123.954 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1750
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.69 Y126.1 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X134.696 Y126.097 E.00019
G3 X135.908 Y125.789 I1.282 J2.5 E.03875
G1 X136.048 Y125.789 E.00431
G3 X134.453 Y126.237 I-.07 J2.809 E.49076
G1 X134.638 Y126.13 E.00658
; WIPE_START
G1 F3000
M204 S6000
G1 X134.696 Y126.097 E-.0252
G1 X134.951 Y125.982 E-.10638
G1 X135.352 Y125.858 E-.15963
G1 X135.628 Y125.81 E-.10646
G1 X135.908 Y125.789 E-.10646
G1 X136.048 Y125.789 E-.05325
G1 X136.327 Y125.81 E-.10644
G1 X136.576 Y125.854 E-.09618
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.591 Y131.345 Z11.2 F42000
G1 Z10.8
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X137.432 Y131.435 E.00559
G3 X135.898 Y125.409 I-1.456 J-2.838 E.35195
G1 X136.061 Y125.409 E.00501
G3 X137.704 Y131.278 I-.085 J3.188 E.24915
G1 X137.642 Y131.315 E.00221
; WIPE_START
G1 F3000
M204 S6000
G1 X137.432 Y131.435 E-.09198
G1 X137.143 Y131.567 E-.12082
G1 X136.842 Y131.669 E-.12078
G1 X136.532 Y131.739 E-.12085
G1 X136.216 Y131.779 E-.12089
G1 X135.898 Y131.787 E-.12083
G1 X135.731 Y131.774 E-.06386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z11.2 F42000
G1 Z10.8
M73 P87 R3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1750
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1750
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1750
M204 S5000
G1 X130.853 Y131.834 E.00067
G1 X133.205 Y132.01 E.07246
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.853 Y131.834 E-.02426
G1 X132.784 Y131.979 E-.73574
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.75 Y136.652 Z11.2 F42000
G1 X118.33 Y143.172 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F1750
M204 S5000
G1 X118.354 Y143.236 E.00208
G3 X116.542 Y144.009 I-.946 J.293 E.08927
G2 X118.281 Y143.207 I-1.307 J-5.117 E.05917
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242766
G1 F1750
M204 S6000
G1 X118.073 Y143.704 E.00357
; LINE_WIDTH: 0.271868
G1 X117.615 Y144.299 E.01402
M204 S10000
G1 X117.86 Y144.185 F42000
; LINE_WIDTH: 0.273748
G1 F1750
M204 S6000
G3 X116.898 Y144.14 I1.323 J-38.112 E.01811
M204 S10000
G1 X116.968 Y144.192 F42000
; LINE_WIDTH: 0.429341
G1 F1750
M204 S6000
G2 X117.41 Y144.132 I-.139 J-2.702 E.01408
G1 X117.46 Y144.121 E.0016
; LINE_WIDTH: 0.47224
G2 X117.822 Y143.953 I-.246 J-1.003 E.01405
; LINE_WIDTH: 0.417443
G1 X118.195 Y143.633 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9612.238
G1 X117.822 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/76
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.2 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1760
M204 S5000
G2 X119.057 Y110.462 I-3.844 J3.99 E.06099
G3 X119.981 Y110.082 I.788 J.604 E.03217
G3 X120.728 Y111.503 I-.143 J.982 E.0575
; WIPE_START
G1 F3000
M204 S6000
G1 X120.335 Y111.229 E-.18226
G1 X119.937 Y110.934 E-.18809
G1 X119.445 Y110.644 E-.21705
G1 X119.057 Y110.462 E-.16296
G1 X119.075 Y110.444 E-.00964
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.4
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
            G0 Z11.4 F4000
            G39.3 S1
            G0 Z11.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.200191
G1 F1760
M204 S6000
G3 X120.364 Y110.464 I-3.126 J46.173 E.01215
M204 S10000
G1 X120.444 Y110.547 F42000
; LINE_WIDTH: 0.330802
G1 F1760
M204 S6000
G1 X119.716 Y110.416 E.01735
; LINE_WIDTH: 0.298908
G1 X119.443 Y110.377 E.00576
M204 S10000
G1 X119.515 Y110.34 F42000
; LINE_WIDTH: 0.430684
G1 F1760
M204 S6000
G1 X120.012 Y110.503 E.01652
; LINE_WIDTH: 0.472888
G3 X120.321 Y110.716 I-.427 J.947 E.01323
; LINE_WIDTH: 0.423906
G1 X120.636 Y111.083 E.015
M204 S10000
G1 X120.626 Y111.19 F42000
; LINE_WIDTH: 0.256653
G1 F1760
M204 S6000
G1 X120.511 Y110.966 E.00439
; LINE_WIDTH: 0.295402
G1 X120.123 Y110.32 E.01551
; WIPE_START
G1 F14258.463
G1 X120.511 Y110.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.782 Y115.316 Z11.4 F42000
G1 X147.135 Y129.434 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1760
M204 S6000
G1 X146.808 Y129.585 E.01195
G3 X146.769 Y129.217 I-.059 J-.18 E.02238
G3 X146.843 Y129.242 I-.008 J.15 E.00264
G1 X147.085 Y129.401 E.00961
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1760
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.961 Y129.963 E.03179
G3 X146.826 Y128.813 I-.212 J-.558 E.07198
G3 X147.047 Y128.889 I-.089 J.623 E.0078
G1 X147.792 Y129.379 E.02956
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1760
M204 S5000
G3 X147.05 Y130.347 I-1.642 J-2.898 E.01896
G3 X147.244 Y128.549 I-.302 J-.942 E.12092
G1 X147.704 Y128.852 E.01694
G2 X146.773 Y121.994 I-20.75 J-.673 E.21365
G2 X146.243 Y120.552 I-15.39 J4.834 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1760
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.228903
G1 F1760
M204 S6000
G2 X146.647 Y120.779 I-20.572 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z11.4 F42000
G1 X133.007 Y123.954 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1760
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1760
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1760
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.642 Y126.129 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F1760
M204 S5000
G1 X134.822 Y126.036 E.00621
G3 X135.908 Y125.789 I1.156 J2.561 E.03444
G1 X136.048 Y125.789 E.0043
G3 X134.573 Y126.164 I-.07 J2.809 E.49508
G1 X134.589 Y126.156 E.00055
; WIPE_START
G1 F3000
M204 S6000
G1 X134.822 Y126.036 E-.09964
G1 X135.083 Y125.934 E-.1064
G1 X135.352 Y125.858 E-.1064
G1 X135.628 Y125.81 E-.10646
G1 X135.908 Y125.789 E-.10651
G1 X136.048 Y125.789 E-.05323
G1 X136.327 Y125.81 E-.10651
G1 X136.521 Y125.844 E-.07485
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.572 Y131.36 Z11.4 F42000
G1 Z11
G1 E.8 F1800
G1 F1760
M204 S5000
G3 X136.374 Y131.763 I-1.596 J-2.762 E.03909
G3 X136.216 Y125.417 I-.396 J-3.165 E.32742
G3 X137.624 Y131.33 I-.239 J3.181 E.24739
; WIPE_START
G1 F3000
M204 S6000
G1 X137.29 Y131.506 E-.14357
G1 X136.993 Y131.622 E-.12091
G1 X136.688 Y131.708 E-.1207
G1 X136.374 Y131.763 E-.12084
G1 X136.057 Y131.787 E-.1209
G1 X135.739 Y131.779 E-.12078
G1 X135.707 Y131.775 E-.0123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.569 Y132.689 Z11.4 F42000
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1760
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1760
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1760
M204 S5000
G1 X130.862 Y131.835 E.00095
G1 X133.205 Y132.01 E.07218
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.862 Y131.835 E-.02565
G1 X132.789 Y131.979 E-.73435
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.754 Y136.651 Z11.4 F42000
G1 X118.33 Y143.172 Z11.4
G1 Z11
G1 E.8 F1800
G1 F1760
M204 S5000
G1 X118.354 Y143.236 E.00209
G3 X116.543 Y144.009 I-.946 J.293 E.08926
G2 X118.281 Y143.207 I-1.418 J-5.355 E.05913
M204 S10000
G1 X118.203 Y143.527 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242651
G1 F1760
M204 S6000
G1 X118.073 Y143.704 E.00357
; LINE_WIDTH: 0.271686
G1 X117.615 Y144.299 E.014
M204 S10000
G1 X117.802 Y144.222 F42000
; LINE_WIDTH: 0.212244
G1 F1760
M204 S6000
G1 X117.043 Y144.146 E.01053
; LINE_WIDTH: 0.177181
G1 X116.881 Y144.127 E.00178
M204 S10000
G1 X116.98 Y144.199 F42000
; LINE_WIDTH: 0.428568
G1 F1760
M204 S6000
G2 X117.408 Y144.132 I-.313 J-3.404 E.01363
G1 X117.46 Y144.121 E.00167
; LINE_WIDTH: 0.472241
G2 X117.822 Y143.953 I-.246 J-1.004 E.01404
; LINE_WIDTH: 0.41734
G1 X118.195 Y143.633 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9614.875
G1 X117.822 Y143.953 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/76
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.4 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G2 X119.057 Y110.462 I-3.844 J3.99 E.06099
G3 X119.981 Y110.082 I.788 J.604 E.03219
G3 X120.728 Y111.503 I-.143 J.982 E.05748
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.229 E-.18233
G1 X119.936 Y110.934 E-.18814
G1 X119.448 Y110.646 E-.21567
G1 X119.057 Y110.462 E-.16419
G1 X119.075 Y110.444 E-.00967
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.6
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
            G0 Z11.6 F4000
            G39.3 S1
            G0 Z11.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.202989
G1 F1307
M204 S6000
G3 X120.365 Y110.465 I-2.902 J43.083 E.01237
M204 S10000
G1 X120.444 Y110.547 F42000
; LINE_WIDTH: 0.330556
G1 F1307
M204 S6000
G1 X119.715 Y110.416 E.01735
; LINE_WIDTH: 0.298657
G1 X119.443 Y110.377 E.00573
M204 S10000
G1 X119.516 Y110.339 F42000
; LINE_WIDTH: 0.430682
G1 F1307
M204 S6000
G1 X120.012 Y110.503 E.01651
; LINE_WIDTH: 0.472906
G3 X120.321 Y110.716 I-.426 J.946 E.01321
; LINE_WIDTH: 0.424069
G1 X120.636 Y111.083 E.01502
M204 S10000
G1 X120.626 Y111.19 F42000
; LINE_WIDTH: 0.256882
G1 F1307
M204 S6000
G1 X120.51 Y110.966 E.0044
; LINE_WIDTH: 0.295288
G1 X120.123 Y110.32 E.0155
; WIPE_START
G1 F14264.909
G1 X120.51 Y110.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.782 Y115.316 Z11.6 F42000
G1 X147.135 Y129.434 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1307
M204 S6000
G1 X146.808 Y129.585 E.01195
G3 X146.768 Y129.217 I-.059 J-.18 E.02235
G3 X146.843 Y129.242 I-.008 J.151 E.00266
G1 X147.085 Y129.401 E.00961
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1307
M204 S6000
G1 X147.831 Y129.561 E.00497
G1 X146.961 Y129.963 E.03179
G3 X146.826 Y128.813 I-.212 J-.558 E.07195
G3 X147.047 Y128.889 I-.088 J.623 E.00781
G1 X147.792 Y129.379 E.02957
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G3 X147.05 Y130.347 I-1.643 J-2.9 E.01894
G3 X147.244 Y128.549 I-.302 J-.942 E.12094
G1 X147.704 Y128.852 E.01694
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G1 X146.698 Y121.779 E.00699
G2 X146.243 Y120.552 I-13.095 J4.16 E.04021
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.914 J7.397 E.55865
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1307
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z11.6 F42000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.2289
G1 F1307
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z11.6 F42000
G1 X133.007 Y123.954 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1307
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1307
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z11.6 F42000
G1 X131.569 Y132.689 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P88 R3
G1 F1307
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1307
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G1 X130.871 Y131.835 E.00123
G1 X133.205 Y132.01 E.0719
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.871 Y131.835 E-.0274
G1 X132.794 Y131.979 E-.7326
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.758 Y136.65 Z11.6 F42000
G1 X118.33 Y143.172 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F1307
M204 S5000
G1 X118.354 Y143.236 E.00209
G3 X116.543 Y144.009 I-.946 J.293 E.08926
G2 X118.281 Y143.207 I-1.418 J-5.355 E.05913
M204 S10000
G1 X118.203 Y143.526 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.242546
G1 F1307
M204 S6000
G1 X118.073 Y143.704 E.00358
; LINE_WIDTH: 0.271791
G1 X117.615 Y144.299 E.014
M204 S10000
G1 X117.803 Y144.221 F42000
; LINE_WIDTH: 0.212157
G1 F1307
M204 S6000
G3 X116.884 Y144.129 I4.629 J-50.692 E.01273
M204 S10000
G1 X116.98 Y144.2 F42000
; LINE_WIDTH: 0.428528
G1 F1307
M204 S6000
G2 X117.408 Y144.133 I-.315 J-3.404 E.0136
G1 X117.46 Y144.12 E.00169
; LINE_WIDTH: 0.472235
G2 X117.822 Y143.952 I-.247 J-1.005 E.01406
; LINE_WIDTH: 0.417383
G1 X118.195 Y143.633 E.01499
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9613.781
G1 X117.822 Y143.952 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/76
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.6 I1.212 J.108 P1  F42000
G1 X120.7 Y111.556 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G2 X119.057 Y110.462 I-3.699 J3.772 E.06102
G3 X119.981 Y110.082 I.788 J.604 E.0322
G3 X120.728 Y111.503 I-.143 J.982 E.05747
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.229 E-.18233
G1 X119.936 Y110.934 E-.18832
G1 X119.45 Y110.647 E-.21436
G1 X119.057 Y110.462 E-.16531
G1 X119.075 Y110.444 E-.00969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
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
            G0 Z11.8 F4000
            G39.3 S1
            G0 Z11.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.205137
G1 F1307
M204 S6000
G3 X120.366 Y110.466 I-2.64 J39.241 E.01256
M204 S10000
G1 X120.419 Y110.517 F42000
; LINE_WIDTH: 0.298481
G1 F1307
M204 S6000
G1 X119.443 Y110.377 E.02053
M204 S10000
G1 X119.516 Y110.339 F42000
; LINE_WIDTH: 0.430697
G1 F1307
M204 S6000
G1 X120.013 Y110.503 E.01653
; LINE_WIDTH: 0.472939
G3 X120.32 Y110.716 I-.425 J.944 E.01318
; LINE_WIDTH: 0.424256
G1 X120.636 Y111.083 E.01504
M204 S10000
G1 X120.626 Y111.19 F42000
; LINE_WIDTH: 0.25702
G1 F1307
M204 S6000
G1 X120.51 Y110.965 E.00441
; LINE_WIDTH: 0.295361
G1 X120.123 Y110.32 E.01548
; WIPE_START
G1 F14260.761
G1 X120.51 Y110.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.781 Y115.316 Z11.8 F42000
G1 X147.135 Y129.434 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1307
M204 S6000
G1 X146.808 Y129.585 E.01195
G3 X146.767 Y129.217 I-.06 J-.18 E.02235
G3 X146.83 Y129.233 I-.035 J.262 E.00216
G1 X147.085 Y129.401 E.01012
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1307
M204 S6000
G1 X147.831 Y129.562 E.00499
G1 X146.96 Y129.963 E.0318
G3 X146.825 Y128.813 I-.212 J-.558 E.07192
G3 X147.041 Y128.885 I-.144 J.799 E.00758
G1 X147.792 Y129.379 E.02981
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G3 X147.051 Y130.347 I-1.653 J-2.923 E.0189
G3 X147.242 Y128.547 I-.303 J-.942 E.1209
G1 X147.704 Y128.852 E.01702
G2 X146.773 Y121.994 I-20.835 J-.662 E.21365
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.904 J7.398 E.55867
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1307
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.265 Z11.8 F42000
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1307
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z11.8 F42000
G1 X133.007 Y123.954 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1307
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1307
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z11.8 F42000
G1 X131.569 Y132.689 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1307
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1307
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1307
M204 S5000
G1 X130.88 Y131.836 E.00151
G1 X133.205 Y132.01 E.07162
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.88 Y131.836 E-.02946
G1 X132.798 Y131.98 E-.73054
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.76 Y136.649 Z11.8 F42000
G1 X118.329 Y143.17 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F1307
M204 S5000
G1 X118.354 Y143.236 E.00216
G3 X116.543 Y144.009 I-.946 J.293 E.08926
G2 X118.28 Y143.205 I-1.395 J-5.289 E.05915
M204 S10000
G1 X118.203 Y143.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.237931
G1 F1307
M204 S6000
G1 X118.073 Y143.704 E.00354
; LINE_WIDTH: 0.2681
G1 X117.623 Y144.297 E.01365
M204 S10000
G1 X117.803 Y144.221 F42000
; LINE_WIDTH: 0.214047
G1 F1307
M204 S6000
G3 X116.884 Y144.129 I4.544 J-49.847 E.01287
M204 S10000
G1 X116.981 Y144.2 F42000
; LINE_WIDTH: 0.428433
G1 F1307
M204 S6000
G2 X117.407 Y144.133 I-.315 J-3.367 E.01355
G1 X117.46 Y144.12 E.00171
; LINE_WIDTH: 0.474185
G2 X117.774 Y143.985 I-.249 J-1.009 E.01205
; LINE_WIDTH: 0.449487
G2 X117.878 Y143.91 I-.661 J-1.026 E.00428
; LINE_WIDTH: 0.411636
G1 X118.197 Y143.628 E.01278
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9763.627
G1 X117.878 Y143.91 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/76
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z11.8 I1.212 J.106 P1  F42000
G1 X120.7 Y111.556 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G2 X119.057 Y110.462 I-3.699 J3.772 E.06102
G3 X119.928 Y110.076 I.789 J.604 E.03055
G3 X120.728 Y111.503 I-.09 J.988 E.05911
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.228 E-.18248
G1 X119.936 Y110.934 E-.18833
G1 X119.453 Y110.649 E-.21294
G1 X119.057 Y110.462 E-.16655
G1 X119.075 Y110.444 E-.00969
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12
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
            G0 Z12 F4000
            G39.3 S1
            G0 Z12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.207808
G1 F1297
M204 S6000
G3 X120.364 Y110.464 I-3.359 J49.281 E.01273
M204 S10000
G1 X120.125 Y110.322 F42000
; LINE_WIDTH: 0.295134
G1 F1297
M204 S6000
G1 X120.51 Y110.965 E.01541
; LINE_WIDTH: 0.25726
G1 X120.626 Y111.19 E.00441
M204 S10000
G1 X120.636 Y111.083 F42000
; LINE_WIDTH: 0.424456
G1 F1297
M204 S6000
G1 X120.32 Y110.715 E.01507
; LINE_WIDTH: 0.470634
G2 X119.966 Y110.483 I-.732 J.728 E.01487
; LINE_WIDTH: 0.429256
G1 X119.892 Y110.456 E.00246
; LINE_WIDTH: 0.404429
G1 X119.503 Y110.346 E.01193
; WIPE_START
G1 F9958.268
G1 X119.892 Y110.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.155 Y114.819 Z12 F42000
G1 X147.135 Y129.434 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X146.808 Y129.585 E.01194
G3 X146.786 Y129.219 I-.059 J-.18 E.02297
G1 X147.084 Y129.403 E.01163
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1297
M204 S6000
G1 X147.831 Y129.561 E.00499
G1 X146.96 Y129.963 E.0318
G3 X146.832 Y128.814 I-.212 J-.558 E.07216
G1 X146.897 Y128.826 E.00219
G3 X147.041 Y128.885 I-.188 J.671 E.00516
G1 X147.792 Y129.379 E.02982
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G3 X147.052 Y130.347 I-1.651 J-2.917 E.01887
G3 X147.241 Y128.547 I-.304 J-.942 E.12084
G1 X147.704 Y128.852 E.01703
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1297
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z12 F42000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1297
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
M73 P89 R3
G1 X147.273 Y122.678 E-.30632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z12 F42000
G1 X133.007 Y123.954 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1297
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z12 F42000
G1 X131.569 Y132.689 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1297
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X130.89 Y131.837 E.00179
G1 X133.205 Y132.01 E.07134
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.89 Y131.837 E-.03176
G1 X132.801 Y131.98 E-.72824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.763 Y136.649 Z12 F42000
G1 X118.329 Y143.17 Z12
G1 Z11.6
G1 E.8 F1800
G1 F1297
M204 S5000
G1 X118.354 Y143.236 E.00216
G3 X116.543 Y144.009 I-.946 J.292 E.08925
G1 X116.55 Y144.008 E.00024
G2 X118.281 Y143.205 I-1.294 J-5.055 E.05894
M204 S10000
G1 X118.203 Y143.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238113
G1 F1297
M204 S6000
G1 X118.073 Y143.704 E.00354
; LINE_WIDTH: 0.268238
G1 X117.623 Y144.297 E.01365
M204 S10000
G1 X117.803 Y144.221 F42000
; LINE_WIDTH: 0.216049
G1 F1297
M204 S6000
G3 X116.884 Y144.129 I3.804 J-42.477 E.01303
M204 S10000
G1 X116.982 Y144.2 F42000
; LINE_WIDTH: 0.428459
G1 F1297
M204 S6000
G2 X117.407 Y144.133 I-.318 J-3.372 E.01354
G1 X117.46 Y144.12 E.00173
; LINE_WIDTH: 0.474204
G2 X117.774 Y143.985 I-.249 J-1.008 E.01205
; LINE_WIDTH: 0.449624
G2 X117.878 Y143.91 I-.656 J-1.018 E.00424
; LINE_WIDTH: 0.411714
G1 X118.197 Y143.628 E.0128
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9761.557
G1 X117.878 Y143.91 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/76
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12 I1.212 J.106 P1  F42000
G1 X120.7 Y111.556 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G2 X119.057 Y110.462 I-3.7 J3.773 E.06102
G3 X119.929 Y110.076 I.789 J.604 E.03057
G3 X120.728 Y111.503 I-.091 J.988 E.05909
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.228 E-.1825
G1 X119.935 Y110.934 E-.18837
G1 X119.456 Y110.65 E-.2115
G1 X119.057 Y110.462 E-.16792
G1 X119.075 Y110.444 E-.00971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.2
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
            G0 Z12.2 F4000
            G39.3 S1
            G0 Z12.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.210698
G1 F1297
M204 S6000
G3 X120.364 Y110.464 I-3.26 J47.737 E.01296
M204 S10000
G1 X120.125 Y110.322 F42000
; LINE_WIDTH: 0.295227
G1 F1297
M204 S6000
G1 X120.51 Y110.965 E.0154
; LINE_WIDTH: 0.257328
G1 X120.626 Y111.19 E.00443
M204 S10000
G1 X120.636 Y111.083 F42000
; LINE_WIDTH: 0.424524
G1 F1297
M204 S6000
G1 X120.32 Y110.715 E.01508
; LINE_WIDTH: 0.470586
G2 X119.965 Y110.482 I-.732 J.728 E.0149
; LINE_WIDTH: 0.429274
G1 X119.893 Y110.456 E.00242
; LINE_WIDTH: 0.40433
G1 X119.503 Y110.346 E.01194
; WIPE_START
G1 F9960.993
G1 X119.893 Y110.456 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.155 Y114.819 Z12.2 F42000
G1 X147.135 Y129.434 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X146.809 Y129.585 E.01194
G3 X146.786 Y129.218 I-.061 J-.18 E.02313
G1 X147.084 Y129.403 E.01163
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F1297
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.96 Y129.963 E.03182
G3 X146.831 Y128.814 I-.211 J-.558 E.07213
G1 X146.897 Y128.826 E.00223
G3 X147.041 Y128.885 I-.191 J.679 E.00516
G1 X147.792 Y129.379 E.02982
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G3 X147.053 Y130.346 I-1.661 J-2.94 E.01885
G3 X147.242 Y128.547 I-.304 J-.941 E.12088
G1 X147.704 Y128.852 E.01702
G2 X146.773 Y121.994 I-20.836 J-.661 E.21364
G2 X146.243 Y120.552 I-15.383 J4.832 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.897 J7.399 E.55868
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1297
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z12.2 F42000
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.228898
G1 F1297
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z12.2 F42000
G1 X133.007 Y123.954 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1297
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z12.2 F42000
G1 X131.569 Y132.689 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1297
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
M73 P89 R2
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X130.899 Y131.837 E.00207
G1 X133.205 Y132.01 E.07106
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.899 Y131.837 E-.03425
G1 X132.803 Y131.98 E-.72575
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.765 Y136.648 Z12.2 F42000
G1 X118.329 Y143.17 Z12.2
G1 Z11.8
G1 E.8 F1800
G1 F1297
M204 S5000
G1 X118.354 Y143.236 E.00216
G3 X116.543 Y144.009 I-.946 J.292 E.08925
G1 X116.55 Y144.008 E.00022
G2 X118.281 Y143.205 I-1.294 J-5.059 E.05896
M204 S10000
G1 X118.203 Y143.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238086
G1 F1297
M204 S6000
G1 X118.073 Y143.704 E.00354
; LINE_WIDTH: 0.268265
G1 X117.624 Y144.297 E.01365
M204 S10000
G1 X117.802 Y144.222 F42000
; LINE_WIDTH: 0.217644
G1 F1297
M204 S6000
G3 X116.884 Y144.129 I5.241 J-56.767 E.01314
M204 S10000
G1 X116.982 Y144.201 F42000
; LINE_WIDTH: 0.428428
G1 F1297
M204 S6000
G2 X117.406 Y144.133 I-.318 J-3.355 E.01352
G1 X117.461 Y144.12 E.00174
; LINE_WIDTH: 0.474212
G2 X117.774 Y143.985 I-.249 J-1.007 E.01205
; LINE_WIDTH: 0.449579
G2 X117.878 Y143.91 I-.66 J-1.024 E.00424
; LINE_WIDTH: 0.411865
G1 X118.197 Y143.628 E.0128
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9757.572
G1 X117.878 Y143.91 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/76
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.2 I1.212 J.106 P1  F42000
G1 X120.7 Y111.556 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G2 X119.057 Y110.462 I-3.7 J3.773 E.06101
G3 X119.929 Y110.076 I.789 J.604 E.03057
G3 X120.728 Y111.503 I-.091 J.988 E.05909
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.228 E-.18256
G1 X119.935 Y110.933 E-.18844
G1 X119.459 Y110.652 E-.21023
G1 X119.057 Y110.462 E-.16904
G1 X119.075 Y110.444 E-.00973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
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
            G0 Z12.4 F4000
            G39.3 S1
            G0 Z12.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.213041
G1 F1297
M204 S6000
G3 X120.365 Y110.465 I-2.995 J43.819 E.01316
M204 S10000
G1 X120.124 Y110.322 F42000
; LINE_WIDTH: 0.294988
G1 F1297
M204 S6000
G1 X120.51 Y110.965 E.01539
; LINE_WIDTH: 0.257389
G1 X120.626 Y111.19 E.00444
M204 S10000
G1 X120.636 Y111.083 F42000
; LINE_WIDTH: 0.424893
G1 F1297
M204 S6000
G1 X120.32 Y110.715 E.01511
; LINE_WIDTH: 0.470582
G2 X119.965 Y110.482 I-.731 J.728 E.01489
; LINE_WIDTH: 0.429233
G1 X119.893 Y110.457 E.00241
; LINE_WIDTH: 0.404136
G1 X119.503 Y110.346 E.01194
; WIPE_START
G1 F9966.352
G1 X119.893 Y110.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.156 Y114.819 Z12.4 F42000
G1 X147.135 Y129.434 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X146.809 Y129.585 E.01194
G3 X146.786 Y129.218 I-.061 J-.18 E.02315
G1 X147.084 Y129.402 E.01163
M204 S10000
G1 X147.842 Y129.411 F42000
G1 F1297
M204 S6000
G1 X147.831 Y129.561 E.00499
G1 X146.96 Y129.963 E.03181
G3 X146.831 Y128.814 I-.211 J-.558 E.07211
M73 P90 R2
G1 X146.898 Y128.827 E.00227
G3 X147.041 Y128.884 I-.194 J.685 E.00512
G1 X147.792 Y129.378 E.02983
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G3 X147.053 Y130.346 I-1.662 J-2.941 E.01883
G3 X147.241 Y128.547 I-.305 J-.941 E.12088
G1 X147.704 Y128.852 E.01703
G2 X146.773 Y121.994 I-20.835 J-.661 E.21364
G1 X146.724 Y121.852 E.00461
G2 X146.243 Y120.552 I-13.871 J4.387 E.04259
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.893 J7.399 E.55869
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F1297
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z12.4 F42000
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.228902
G1 F1297
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z12.4 F42000
G1 X133.007 Y123.954 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1297
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z12.4 F42000
G1 X131.569 Y132.689 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1297
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X130.908 Y131.838 E.00235
G1 X133.205 Y132.01 E.07078
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.908 Y131.838 E-.0369
G1 X132.805 Y131.98 E-.7231
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.767 Y136.648 Z12.4 F42000
G1 X118.329 Y143.17 Z12.4
G1 Z12
G1 E.8 F1800
G1 F1297
M204 S5000
G1 X118.354 Y143.236 E.00215
G3 X116.543 Y144.009 I-.946 J.293 E.08925
G1 X116.549 Y144.008 E.0002
G2 X118.281 Y143.205 I-1.295 J-5.062 E.05898
M204 S10000
G1 X118.203 Y143.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238341
G1 F1297
M204 S6000
G1 X118.073 Y143.705 E.00355
; LINE_WIDTH: 0.268445
G1 X117.623 Y144.297 E.01366
M204 S10000
G1 X117.805 Y144.22 F42000
; LINE_WIDTH: 0.219681
G1 F1297
M204 S6000
G3 X116.884 Y144.129 I3.151 J-36.46 E.01333
M204 S10000
G1 X116.977 Y144.198 F42000
; LINE_WIDTH: 0.417377
G1 F1297
M204 S6000
G1 X117.461 Y144.12 E.01494
; LINE_WIDTH: 0.471738
G2 X117.83 Y143.947 I-.248 J-1.006 E.01435
; LINE_WIDTH: 0.415275
G1 X118.197 Y143.628 E.01474
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9668.203
G1 X117.83 Y143.947 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/76
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.4 I1.212 J.107 P1  F42000
G1 X120.7 Y111.556 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G2 X119.057 Y110.462 I-3.7 J3.774 E.06101
G3 X119.929 Y110.076 I.789 J.604 E.03058
G3 X120.728 Y111.503 I-.091 J.988 E.05908
; WIPE_START
G1 F3000
M204 S6000
G1 X120.334 Y111.228 E-.18265
G1 X119.935 Y110.933 E-.18848
G1 X119.462 Y110.653 E-.20872
G1 X119.057 Y110.462 E-.1704
G1 X119.075 Y110.444 E-.00975
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.6
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
            G0 Z12.6 F4000
            G39.3 S1
            G0 Z12.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X119.419 Y110.39 F42000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.215922
G1 F1297
M204 S6000
G3 X120.365 Y110.465 I-2.965 J43.326 E.01338
M204 S10000
G1 X120.124 Y110.322 F42000
; LINE_WIDTH: 0.295059
G1 F1297
M204 S6000
G1 X120.509 Y110.964 E.01539
; LINE_WIDTH: 0.257616
G1 X120.626 Y111.19 E.00445
M204 S10000
G1 X120.636 Y111.083 F42000
; LINE_WIDTH: 0.425088
G1 F1297
M204 S6000
G1 X120.319 Y110.715 E.01513
; LINE_WIDTH: 0.470581
G2 X119.964 Y110.482 I-.73 J.727 E.01489
; LINE_WIDTH: 0.429261
G1 X119.893 Y110.457 E.00238
; LINE_WIDTH: 0.404034
G1 X119.503 Y110.346 E.01194
; WIPE_START
G1 F9969.159
G1 X119.893 Y110.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.156 Y114.819 Z12.6 F42000
G1 X147.135 Y129.434 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X146.809 Y129.585 E.01194
G3 X146.786 Y129.218 I-.061 J-.18 E.02314
G1 X147.084 Y129.402 E.01163
M204 S10000
G1 X147.842 Y129.411 F42000
G1 F1297
M204 S6000
G1 X147.831 Y129.561 E.00499
G1 X146.96 Y129.963 E.03182
G3 X146.83 Y128.814 I-.211 J-.558 E.07208
G1 X146.898 Y128.827 E.00229
G3 X147.041 Y128.884 I-.196 J.688 E.00513
G1 X147.792 Y129.378 E.02982
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G3 X147.054 Y130.346 I-1.664 J-2.946 E.01881
G3 X147.241 Y128.547 I-.306 J-.941 E.12091
G1 X147.704 Y128.852 E.01703
G2 X146.773 Y121.994 I-20.835 J-.661 E.21364
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F1297
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z12.6 F42000
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F1297
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.671 Y123.358 Z12.6 F42000
G1 X133.007 Y123.954 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
M204 S10000
G1 X133.383 Y124.39 F42000
G1 F1297
M204 S6000
G1 X131.791 Y124.271 E.05294
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.387 Y124.33 E.05095
M204 S250
G1 X133.744 Y124.81 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X131.371 Y124.632 E.07313
G1 X131.549 Y122.259 E.07313
G1 X133.922 Y122.437 E.07313
G1 X133.749 Y124.751 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X131.751 Y124.651 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.578 Y132.282 Z12.6 F42000
G1 X131.569 Y132.689 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1297
M204 S6000
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.564 Y132.749 E.02394
M204 S10000
G1 X131.193 Y132.253 F42000
G1 F1297
M204 S6000
G1 X132.785 Y132.372 E.05294
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.189 Y132.312 E.05095
M204 S250
G1 X130.832 Y131.832 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1297
M204 S5000
G1 X130.917 Y131.839 E.00263
G1 X133.205 Y132.01 E.0705
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.827 Y131.892 E.07129
; WIPE_START
G1 F3000
M204 S6000
G1 X130.917 Y131.839 E-.03968
G1 X132.807 Y131.98 E-.72032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.768 Y136.648 Z12.6 F42000
G1 X118.329 Y143.17 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F1297
M204 S5000
G1 X118.354 Y143.236 E.00215
G3 X116.543 Y144.009 I-.946 J.292 E.08925
G1 X116.548 Y144.008 E.00018
G2 X118.281 Y143.205 I-1.295 J-5.066 E.059
M204 S10000
G1 X118.203 Y143.524 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238394
G1 F1297
M204 S6000
G1 X118.072 Y143.705 E.00356
; LINE_WIDTH: 0.268618
G1 X117.623 Y144.297 E.01368
M204 S10000
G1 X117.843 Y144.198 F42000
; LINE_WIDTH: 0.22146
G1 F1297
M204 S6000
G3 X116.884 Y144.129 I.266 J-10.484 E.01399
M204 S10000
G1 X116.978 Y144.198 F42000
; LINE_WIDTH: 0.417289
G1 F1297
M204 S6000
G1 X117.461 Y144.12 E.01493
; LINE_WIDTH: 0.471837
G2 X117.828 Y143.948 I-.248 J-1.007 E.01429
; LINE_WIDTH: 0.415481
G1 X118.197 Y143.628 E.0148
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9662.865
G1 X117.828 Y143.948 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/76
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 15
M204 S250
M204 S10000
G17
G3 Z12.6 I1.023 J.659 P1  F42000
G1 X118.329 Y143.171 Z12.6
M204 S10000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X118.354 Y143.236 E.00216
G3 X116.543 Y144.009 I-.946 J.292 E.08924
G1 X116.548 Y144.008 E.00016
G2 X118.281 Y143.205 I-1.296 J-5.07 E.05902
; WIPE_START
M204 S6000
G1 X118.354 Y143.236 E-.03012
G1 X118.394 Y143.427 E-.0742
G1 X118.395 Y143.622 E-.0741
G1 X118.359 Y143.814 E-.07415
G1 X118.285 Y143.995 E-.07403
G1 X118.105 Y144.238 E-.11501
G1 X117.953 Y144.36 E-.07407
G1 X117.781 Y144.451 E-.07412
G1 X117.496 Y144.519 E-.11117
G1 X117.341 Y144.517 E-.05904
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.8
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
            G0 Z12.8 F4000
            G39.3 S1
            G0 Z12.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.623 Y144.297 F42000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.268949
G1 F3698
M204 S6000
G1 X118.072 Y143.705 E.01368
; LINE_WIDTH: 0.238612
G1 X118.203 Y143.524 E.00357
M204 S10000
G1 X118.197 Y143.628 F42000
; LINE_WIDTH: 0.41222
G1 F3698
M204 S6000
G1 X117.877 Y143.911 E.01283
; LINE_WIDTH: 0.449631
G3 X117.775 Y143.985 I-.765 J-.952 E.00419
; LINE_WIDTH: 0.474234
G3 X117.461 Y144.12 I-.563 J-.87 E.01206
; LINE_WIDTH: 0.41726
G1 X116.978 Y144.198 E.01494
M204 S10000
G1 X116.879 Y144.125 F42000
; LINE_WIDTH: 0.223115
G1 F3698
M204 S6000
G2 X117.848 Y144.194 I.997 J-7.206 E.01428
; WIPE_START
G1 F15000
G1 X116.879 Y144.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.769 Y136.545 Z12.8 F42000
G1 X120.699 Y111.556 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
M73 P91 R2
G2 X119.057 Y110.462 I-3.701 J3.775 E.06101
G3 X119.93 Y110.076 I.789 J.604 E.0306
G3 X120.728 Y111.503 I-.092 J.988 E.05906
M204 S10000
G1 X120.626 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.257896
G1 F3698
M204 S6000
G1 X120.509 Y110.964 E.00446
; LINE_WIDTH: 0.294888
G1 X120.125 Y110.322 E.01536
M204 S10000
G1 X120.366 Y110.466 F42000
; LINE_WIDTH: 0.218212
G1 F3698
M204 S6000
G2 X119.419 Y110.39 I-3.827 J42.109 E.01356
M204 S10000
G1 X119.503 Y110.346 F42000
; LINE_WIDTH: 0.403984
G1 F3698
M204 S6000
G1 X119.894 Y110.457 E.01195
; LINE_WIDTH: 0.429251
G1 X119.964 Y110.482 E.00234
; LINE_WIDTH: 0.470563
G3 X120.113 Y110.554 I-.684 J1.589 E.00577
G1 X120.319 Y110.714 E.0091
; LINE_WIDTH: 0.425263
G1 X120.636 Y111.084 E.01517
; WIPE_START
G1 F9415.635
G1 X120.319 Y110.714 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.698 Y117.558 Z12.8 F42000
G1 X131.516 Y133.393 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3698
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29111
G1 X132.348 Y132.747 E-.29704
G1 X132.314 Y133.198 E-.17185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I1.214 J.091 P1  F42000
G1 X133.007 Y123.954 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3698
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29793
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16502
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I-1.201 J-.193 P1  F42000
G1 X131.141 Y132.951 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3698
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X131.524 Y131.857 E.01392
M106 S255
G1 F1800
G1 X131.552 Y131.475 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X132.031 Y125.093 E.2123
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X132.059 Y124.712 E.01269
M106 S201.45
G1 F3698
G1 X132.09 Y124.293 E.01392
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X133.084 Y124.368 E.00995
G1 X132.685 Y124.338 E.01327
G1 X132.653 Y124.756 E.01392
M106 S255
G1 F1800
G1 X132.625 Y125.138 E.01269
M106 S201.45
; FEATURE: Overhang wall
M106 S255
G1 F3000
M204 S5000
G1 X132.146 Y131.52 E.2123
M106 S201.45
; FEATURE: Inner wall
M106 S255
G1 F1800
M204 S6000
G1 X132.118 Y131.901 E.01269
M106 S201.45
G1 F3698
G1 X132.087 Y132.32 E.01392
G1 X132.485 Y132.349 E.01327
G1 X132.785 Y132.372 E.00995
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 F2048.938
G1 X131.134 Y131.814 E.00126
M106 S255
G1 F1800
G1 X131.161 Y131.446 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X131.64 Y125.064 E.2123
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.667 Y124.696 E.01134
M106 S201.45
G1 F2049.068
G1 X131.67 Y124.655 E.00126
G1 F3000
G1 X131.371 Y124.633 E.00922
G1 X131.393 Y124.333 E.00922
G1 X131.423 Y123.934 E.01229
G1 F2049.001
G1 X131.382 Y123.931 E.00126
M106 S255
G1 F1800
G1 X131.015 Y123.904 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X125.54 Y123.494 E.18211
G1 X125.613 Y122.516 E.03251
G1 X131.088 Y122.927 E.18211
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X131.456 Y122.954 E.01134
M106 S201.45
G1 F2049.376
G1 X131.497 Y122.957 E.00126
G1 F3000
G1 X131.527 Y122.558 E.01229
G1 X131.549 Y122.259 E.00922
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.445 Y124.788 E.00922
G1 X133.046 Y124.758 E.01229
G1 F2048.88
G1 X133.043 Y124.799 E.00126
M106 S255
G1 F1800
G1 X133.016 Y125.167 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X132.537 Y131.549 E.2123
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X132.51 Y131.917 E.01134
M106 S201.45
G1 F2049.376
G1 X132.507 Y131.958 E.00126
G1 F3000
G1 X132.906 Y131.988 E.01229
G1 X133.205 Y132.01 E.00922
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.676 Y133.907 E.00922
G1 X130.706 Y133.508 E.01229
G1 F2049.068
G1 X130.665 Y133.505 E.00126
M106 S255
G1 F1800
G1 X130.297 Y133.477 E.01134
M106 S201.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
G1 X124.822 Y133.067 E.18211
G1 X124.896 Y132.089 E.03251
G1 X130.37 Y132.5 E.18211
M106 S201.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G1 X130.719 Y132.526 E.01076
M106 S201.45
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630859
G1 F3698
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.091
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I.062 J1.215 P1  F42000
G1 X131.774 Y132.5 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.23172
G1 F3698
M204 S6000
G1 X132.403 Y124.113 E.1294
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.63086
G1 F3698
M204 S6000
G1 X125.772 Y123.02 E.28266
; WIPE_START
G1 F6123.081
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z12.8 I-.375 J1.158 P1  F42000
G1 X147.135 Y129.434 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3698
M204 S6000
G1 X146.809 Y129.585 E.01193
G3 X146.786 Y129.218 I-.061 J-.18 E.02314
G1 X147.084 Y129.403 E.01164
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F3698
M204 S6000
G1 X147.831 Y129.562 E.00499
G1 X146.96 Y129.963 E.03183
G3 X146.829 Y128.813 I-.211 J-.558 E.07205
G1 X146.898 Y128.827 E.00232
G3 X147.04 Y128.884 I-.199 J.696 E.0051
G1 X147.792 Y129.379 E.02984
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
M204 S5000
G3 X147.055 Y130.346 I-1.674 J-2.968 E.01877
G3 X147.241 Y128.547 I-.307 J-.941 E.12094
G1 X147.704 Y128.852 E.01704
G2 X146.773 Y121.994 I-20.835 J-.661 E.21364
G2 X146.243 Y120.552 I-15.386 J4.833 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.885 J7.399 E.55871
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F3698
M204 S6000
G3 X145.362 Y137.919 I-20.51 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z12.8 F42000
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.228901
G1 F3698
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13112
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45372
G1 X147.273 Y122.678 E-.30628
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/76
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z12.8 I-.703 J-.993 P1  F42000
G1 X118.329 Y143.171 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2101
M204 S5000
G1 X118.354 Y143.236 E.00216
G3 X116.543 Y144.01 I-.946 J.292 E.08923
G1 X116.547 Y144.009 E.00013
G2 X118.281 Y143.206 I-1.297 J-5.074 E.05904
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.236 E-.03013
G1 X118.394 Y143.428 E-.07418
G1 X118.395 Y143.623 E-.07408
G1 X118.359 Y143.814 E-.07405
G1 X118.285 Y143.995 E-.07421
G1 X118.113 Y144.23 E-.11083
G1 X117.954 Y144.36 E-.0781
G1 X117.781 Y144.451 E-.07412
G1 X117.496 Y144.519 E-.11117
G1 X117.341 Y144.518 E-.05913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
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
            G0 Z13 F4000
            G39.3 S1
            G0 Z13 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.623 Y144.297 F42000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.268934
G1 F2101
M204 S6000
G1 X118.072 Y143.705 E.01368
; LINE_WIDTH: 0.238823
G1 X118.203 Y143.524 E.00357
M204 S10000
G1 X118.196 Y143.628 F42000
; LINE_WIDTH: 0.415639
G1 F2101
M204 S6000
G1 X117.829 Y143.947 E.01478
; LINE_WIDTH: 0.471832
G3 X117.461 Y144.12 I-.616 J-.833 E.0143
; LINE_WIDTH: 0.417247
G1 X116.978 Y144.198 E.01493
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.22562
G1 F2101
M204 S6000
G2 X117.849 Y144.194 I2.753 J-38.157 E.01423
; WIPE_START
G1 F15000
G1 X116.895 Y144.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.78 Y136.556 Z13 F42000
G1 X120.699 Y111.556 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2101
M204 S5000
G2 X119.057 Y110.462 I-3.701 J3.775 E.06101
G3 X119.93 Y110.076 I.789 J.604 E.03061
G3 X120.728 Y111.503 I-.092 J.988 E.05905
M204 S10000
G1 X120.626 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.258199
G1 F2101
M204 S6000
G1 X120.509 Y110.964 E.00447
; LINE_WIDTH: 0.294729
G1 X120.125 Y110.322 E.01534
M204 S10000
G1 X120.365 Y110.465 F42000
; LINE_WIDTH: 0.220994
G1 F2101
M204 S6000
G2 X119.419 Y110.39 I-3.919 J43.335 E.01377
M204 S10000
G1 X119.503 Y110.346 F42000
; LINE_WIDTH: 0.403878
G1 F2101
M204 S6000
G1 X119.894 Y110.457 E.01195
; LINE_WIDTH: 0.429264
G1 X119.963 Y110.482 E.00231
; LINE_WIDTH: 0.470549
G3 X120.112 Y110.554 I-.695 J1.614 E.00576
G1 X120.319 Y110.714 E.00912
; LINE_WIDTH: 0.425297
G1 X120.636 Y111.084 E.01518
; WIPE_START
G1 F9414.809
G1 X120.319 Y110.714 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.698 Y117.558 Z13 F42000
G1 X131.516 Y133.393 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2101
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X132.348 Y132.747 E.02593
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29113
G1 X132.348 Y132.747 E-.29704
G1 X132.314 Y133.198 E-.17183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I1.214 J.091 P1  F42000
G1 X133.007 Y123.954 Z13
G1 Z12.6
G1 E.8 F1800
G1 F2101
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29792
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I-1.201 J-.193 P1  F42000
G1 X131.141 Y132.951 Z13
G1 Z12.6
G1 E.8 F1800
G1 F2101
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X132.09 Y124.293 E.26551
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X132.685 Y124.338 E.02322
G1 X132.087 Y132.32 E.26551
G1 X132.785 Y132.372 E.02322
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2101
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.67 Y124.655 E.22185
G1 X131.371 Y124.633 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.507 Y131.958 E.22185
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F2101
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.099
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I.062 J1.215 P1  F42000
G1 X131.774 Y132.5 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.231728
G1 F2101
M204 S6000
G1 X132.403 Y124.113 E.12941
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.630868
G1 F2101
M204 S6000
G1 X125.772 Y123.02 E.28267
; WIPE_START
G1 F6122.998
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13 I-.375 J1.158 P1  F42000
G1 X147.136 Y129.434 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2101
M204 S6000
G1 X146.809 Y129.584 E.01192
G3 X146.786 Y129.218 I-.061 J-.18 E.02314
G1 X147.085 Y129.403 E.01165
M204 S10000
G1 X147.842 Y129.411 F42000
G1 F2101
M204 S6000
G1 X147.831 Y129.562 E.005
G1 X146.959 Y129.963 E.03183
G3 X146.829 Y128.813 I-.211 J-.559 E.07203
G1 X146.899 Y128.827 E.00236
G3 X147.04 Y128.884 I-.203 J.705 E.00507
G1 X147.792 Y129.378 E.02985
M204 S250
M73 P92 R2
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2101
M204 S5000
G3 X147.056 Y130.345 I-1.675 J-2.97 E.01874
G3 X147.241 Y128.547 I-.308 J-.94 E.12096
G1 X147.704 Y128.852 E.01705
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.388 J4.833 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.877 J7.4 E.55872
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228905
G1 F2101
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z13 F42000
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.228904
G1 F2101
M204 S6000
G2 X146.647 Y120.779 I-20.572 J-1.126 E.13112
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/76
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13 I-.703 J-.993 P1  F42000
G1 X118.329 Y143.171 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X118.354 Y143.236 E.00215
G3 X116.543 Y144.01 I-.946 J.292 E.08923
G1 X116.546 Y144.009 E.00012
G2 X118.281 Y143.206 I-1.298 J-5.078 E.05906
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.236 E-.03009
G1 X118.394 Y143.428 E-.07425
G1 X118.395 Y143.623 E-.07413
G1 X118.359 Y143.814 E-.07414
G1 X118.285 Y143.995 E-.07415
G1 X118.106 Y144.237 E-.11444
G1 X117.954 Y144.36 E-.07415
G1 X117.781 Y144.451 E-.0742
G1 X117.497 Y144.519 E-.11115
G1 X117.341 Y144.518 E-.05929
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.2
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
            G0 Z13.2 F4000
            G39.3 S1
            G0 Z13.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.623 Y144.297 F42000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269237
G1 F2084
M204 S6000
G1 X118.072 Y143.706 E.0137
; LINE_WIDTH: 0.239076
G1 X118.203 Y143.524 E.00358
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.412476
G1 F2084
M204 S6000
G1 X117.876 Y143.911 E.01286
; LINE_WIDTH: 0.457093
G3 X117.726 Y144.014 I-.817 J-1.032 E.00614
; LINE_WIDTH: 0.474495
G1 X117.625 Y144.065 E.00399
G3 X117.462 Y144.12 I-.498 J-1.207 E.00607
; LINE_WIDTH: 0.417271
G1 X116.978 Y144.198 E.01494
M204 S10000
G1 X116.894 Y144.137 F42000
; LINE_WIDTH: 0.227822
G1 F2084
M204 S6000
G2 X117.85 Y144.193 I2.554 J-35.226 E.01442
; WIPE_START
G1 F15000
G1 X116.894 Y144.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.78 Y136.556 Z13.2 F42000
G1 X120.699 Y111.556 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G2 X119.057 Y110.462 I-3.702 J3.776 E.06101
G3 X119.931 Y110.076 I.789 J.604 E.03062
G3 X120.728 Y111.503 I-.092 J.988 E.05904
M204 S10000
G1 X120.627 Y111.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.258189
G1 F2084
M204 S6000
G1 X120.509 Y110.963 E.00447
; LINE_WIDTH: 0.294862
G1 X120.125 Y110.322 E.01534
M204 S10000
G1 X120.366 Y110.466 F42000
; LINE_WIDTH: 0.223582
G1 F2084
M204 S6000
G2 X119.419 Y110.39 I-3.951 J43.527 E.01398
M204 S10000
G1 X119.503 Y110.346 F42000
; LINE_WIDTH: 0.403763
G1 F2084
M204 S6000
G1 X119.895 Y110.457 E.01196
; LINE_WIDTH: 0.429242
G1 X119.963 Y110.481 E.00228
; LINE_WIDTH: 0.470541
G3 X120.111 Y110.554 I-.691 J1.608 E.00576
G1 X120.318 Y110.713 E.00911
; LINE_WIDTH: 0.42555
G1 X120.636 Y111.084 E.01521
; WIPE_START
G1 F9408.571
G1 X120.318 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.697 Y117.557 Z13.2 F42000
G1 X131.516 Y133.393 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X131.99 Y132.72 E.014
G1 X132.348 Y132.747 E.01193
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29113
G1 X131.99 Y132.72 E-.16039
G1 X132.348 Y132.747 E-.13665
G1 X132.314 Y133.198 E-.17183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.885 Y125.587 Z13.2 F42000
G1 X133.007 Y123.954 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29793
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.506 Y130.684 Z13.2 F42000
G1 X131.141 Y132.951 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X132.091 Y124.293 E.26551
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X132.685 Y124.338 E.02322
G1 X132.087 Y132.32 E.26551
G1 X132.785 Y132.372 E.02322
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.67 Y124.655 E.22185
G1 X131.371 Y124.633 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.507 Y131.958 E.22185
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F2084
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.099
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.774 Y132.5 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.231718
G1 F2084
M204 S6000
G1 X132.403 Y124.113 E.1294
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.630869
G1 F2084
M204 S6000
G1 X125.772 Y123.02 E.28267
; WIPE_START
G1 F6122.979
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.028 Y125.518 Z13.2 F42000
G1 X147.136 Y129.434 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X146.809 Y129.585 E.01193
G3 X146.786 Y129.218 I-.06 J-.18 E.02301
G1 X147.084 Y129.402 E.01165
M204 S10000
G1 X147.842 Y129.411 F42000
G1 F2084
M204 S6000
G1 X147.831 Y129.562 E.00499
G1 X146.959 Y129.964 E.03184
G3 X146.828 Y128.813 I-.211 J-.559 E.07201
G1 X146.898 Y128.827 E.00237
G3 X147.04 Y128.884 I-.204 J.707 E.00508
G1 X147.792 Y129.378 E.02984
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G3 X147.056 Y130.345 I-1.683 J-2.986 E.01873
G3 X147.241 Y128.547 I-.308 J-.94 E.12098
G1 X147.704 Y128.852 E.01704
G2 X146.749 Y121.925 I-20.786 J-.662 E.21587
G2 X146.243 Y120.552 I-14.657 J4.619 E.04497
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228903
G1 F2084
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z13.2 F42000
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.2289
G1 F2084
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30631
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/76
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.2 I-.703 J-.993 P1  F42000
G1 X118.33 Y143.171 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X118.354 Y143.237 E.00215
G3 X116.543 Y144.01 I-.946 J.292 E.08923
G1 X116.546 Y144.009 E.00009
G2 X118.281 Y143.206 I-1.299 J-5.082 E.05908
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03009
G1 X118.394 Y143.428 E-.07414
G1 X118.395 Y143.623 E-.07423
G1 X118.358 Y143.815 E-.07419
G1 X118.285 Y143.995 E-.07419
G1 X118.177 Y144.158 E-.07415
G1 X118.04 Y144.297 E-.07416
G1 X117.781 Y144.451 E-.1143
G1 X117.594 Y144.506 E-.07411
G1 X117.399 Y144.523 E-.07435
G1 X117.342 Y144.514 E-.02209
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.4
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
            G0 Z13.4 F4000
            G39.3 S1
            G0 Z13.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.623 Y144.297 F42000
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269277
G1 F2084
M204 S6000
G1 X118.072 Y143.706 E.0137
; LINE_WIDTH: 0.239143
G1 X118.203 Y143.524 E.00358
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.41603
G1 F2084
M204 S6000
G1 X117.828 Y143.948 E.01484
; LINE_WIDTH: 0.471971
G3 X117.462 Y144.12 I-.615 J-.835 E.01422
; LINE_WIDTH: 0.417213
G1 X116.978 Y144.198 E.01494
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.230404
G1 F2084
M204 S6000
G2 X117.849 Y144.194 I3.058 J-43.57 E.0146
; WIPE_START
G1 F15000
G1 X116.895 Y144.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.78 Y136.556 Z13.4 F42000
G1 X120.699 Y111.556 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G2 X119.057 Y110.462 I-3.702 J3.777 E.06101
G3 X119.931 Y110.076 I.789 J.604 E.03062
G3 X120.728 Y111.503 I-.092 J.988 E.05903
M204 S10000
G1 X120.627 Y111.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.258349
G1 F2084
M204 S6000
G1 X120.509 Y110.963 E.00448
; LINE_WIDTH: 0.294783
G1 X120.125 Y110.322 E.01532
M204 S10000
G1 X120.364 Y110.464 F42000
; LINE_WIDTH: 0.22613
G1 F2084
M204 S6000
G2 X119.419 Y110.39 I-4.599 J52.668 E.01414
M204 S10000
G1 X119.503 Y110.345 F42000
; LINE_WIDTH: 0.40367
G1 F2084
M204 S6000
G1 X119.895 Y110.457 E.01196
; LINE_WIDTH: 0.429198
G1 X119.962 Y110.481 E.00225
; LINE_WIDTH: 0.470522
G3 X120.093 Y110.543 I-.437 J1.089 E.00504
G1 X120.318 Y110.713 E.00983
; LINE_WIDTH: 0.425708
G1 X120.636 Y111.084 E.01523
; WIPE_START
G1 F9404.698
G1 X120.318 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.697 Y117.557 Z13.4 F42000
G1 X131.516 Y133.393 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X131.99 Y132.72 E.014
G1 X132.348 Y132.747 E.01193
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29112
G1 X131.99 Y132.72 E-.16039
G1 X132.348 Y132.747 E-.13665
G1 X132.314 Y133.198 E-.17183
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.885 Y125.587 Z13.4 F42000
G1 X133.007 Y123.954 Z13.4
G1 Z13
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29793
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.506 Y130.684 Z13.4 F42000
G1 X131.141 Y132.951 Z13.4
G1 Z13
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X132.039 Y124.974 E.24286
G1 X132.09 Y124.293 E.02265
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X132.685 Y124.338 E.02322
G1 X132.405 Y128.068 E.12408
G1 X132.087 Y132.32 E.14143
G1 X132.785 Y132.372 E.02322
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.649 Y124.945 E.21292
G1 X131.67 Y124.655 E.00893
G1 X131.371 Y124.632 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
M73 P93 R2
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.796 Y128.097 E.10289
G1 X132.507 Y131.958 E.11896
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F2084
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.1
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.774 Y132.5 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.231767
G1 F2084
M204 S6000
G1 X132.403 Y124.113 E.12943
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.630869
G1 F2084
M204 S6000
G1 X125.772 Y123.02 E.28267
; WIPE_START
G1 F6122.986
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.028 Y125.518 Z13.4 F42000
G1 X147.135 Y129.434 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X146.809 Y129.585 E.01192
G3 X146.776 Y129.217 I-.06 J-.18 E.0227
G1 X146.835 Y129.236 E.00206
G1 X147.085 Y129.401 E.00994
M204 S10000
G1 X147.842 Y129.411 F42000
G1 F2084
M204 S6000
G1 X147.831 Y129.562 E.005
G1 X146.938 Y129.971 E.03257
G3 X146.828 Y128.813 I-.191 J-.566 E.07137
M73 P93 R1
G1 X146.899 Y128.827 E.00241
G3 X147.04 Y128.884 I-.208 J.716 E.00504
G1 X147.792 Y129.378 E.02987
M204 S250
G1 X147.611 Y130.095 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G3 X147.057 Y130.345 I-1.69 J-3.003 E.01871
G3 X147.241 Y128.547 I-.309 J-.94 E.12099
G1 X147.704 Y128.852 E.01706
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.841 J-10.066 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228904
G1 F2084
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45361
G1 X146.264 Y136.135 E-.30639
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z13.4 F42000
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.2289
G1 F2084
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45371
G1 X147.273 Y122.678 E-.30629
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/76
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.4 I-.703 J-.993 P1  F42000
G1 X118.33 Y143.172 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X118.354 Y143.237 E.00211
G3 X116.543 Y144.01 I-.946 J.292 E.08922
G1 X116.545 Y144.009 E.00007
G2 X118.281 Y143.207 I-1.426 J-5.364 E.05905
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.02998
G1 X118.394 Y143.428 E-.07419
G1 X118.395 Y143.623 E-.0742
G1 X118.358 Y143.815 E-.07426
G1 X118.285 Y143.996 E-.07417
G1 X118.177 Y144.159 E-.07423
G1 X118.039 Y144.297 E-.07404
G1 X117.782 Y144.45 E-.11401
G1 X117.497 Y144.519 E-.11121
G1 X117.34 Y144.518 E-.05972
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.6
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
            G0 Z13.6 F4000
            G39.3 S1
            G0 Z13.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269659
G1 F2084
M204 S6000
G1 X118.071 Y143.706 E.01371
; LINE_WIDTH: 0.239426
G1 X118.203 Y143.524 E.0036
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416078
G1 F2084
M204 S6000
G1 X117.827 Y143.949 E.01485
; LINE_WIDTH: 0.472014
G3 X117.462 Y144.12 I-.615 J-.836 E.01421
; LINE_WIDTH: 0.417186
G1 X116.978 Y144.198 E.01493
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.232845
G1 F2084
M204 S6000
G2 X117.848 Y144.194 I3.339 J-47.886 E.01478
; WIPE_START
G1 F15000
G1 X116.895 Y144.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.78 Y136.556 Z13.6 F42000
G1 X120.699 Y111.556 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G2 X119.057 Y110.462 I-3.702 J3.776 E.06101
G3 X119.931 Y110.076 I.789 J.604 E.03063
G3 X120.728 Y111.503 I-.093 J.988 E.05902
M204 S10000
G1 X120.627 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.258691
G1 F2084
M204 S6000
G1 X120.509 Y110.963 E.0045
; LINE_WIDTH: 0.29471
G1 X120.125 Y110.322 E.01531
M204 S10000
G1 X120.366 Y110.466 F42000
; LINE_WIDTH: 0.228316
G1 F2084
M204 S6000
G2 X119.419 Y110.39 I-3.776 J41.017 E.01435
M204 S10000
G1 X119.504 Y110.345 F42000
; LINE_WIDTH: 0.40357
G1 F2084
M204 S6000
G1 X119.895 Y110.457 E.01197
; LINE_WIDTH: 0.429106
G1 X119.961 Y110.481 E.00219
; LINE_WIDTH: 0.470456
G3 X120.093 Y110.543 I-.436 J1.088 E.0051
G1 X120.318 Y110.713 E.00981
; LINE_WIDTH: 0.425863
G1 X120.636 Y111.084 E.01525
; WIPE_START
G1 F9400.879
G1 X120.318 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.697 Y117.557 Z13.6 F42000
G1 X131.516 Y133.393 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X131.99 Y132.721 E.014
G1 X132.348 Y132.747 E.01193
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29111
G1 X131.99 Y132.721 E-.1604
G1 X132.348 Y132.747 E-.13665
G1 X132.314 Y133.198 E-.17184
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.885 Y125.587 Z13.6 F42000
G1 X133.007 Y123.954 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29792
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.506 Y130.684 Z13.6 F42000
G1 X131.141 Y132.951 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F2084
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X132.091 Y124.293 E.26551
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X132.685 Y124.338 E.02322
G1 X132.483 Y127.025 E.08938
G1 X132.087 Y132.32 E.17613
G1 X132.785 Y132.372 E.02322
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.67 Y124.655 E.22185
G1 X131.371 Y124.632 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.874 Y127.054 E.07074
G1 X132.507 Y131.958 E.15111
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F2084
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.1
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.774 Y132.5 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.231719
G1 F2084
M204 S6000
G1 X132.403 Y124.113 E.1294
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.630868
G1 F2084
M204 S6000
G1 X125.772 Y123.02 E.28267
; WIPE_START
G1 F6122.998
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X135.028 Y125.518 Z13.6 F42000
G1 X147.135 Y129.434 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2084
M204 S6000
G1 X146.809 Y129.584 E.01192
G3 X146.776 Y129.217 I-.062 J-.179 E.02278
G1 X146.835 Y129.237 E.00208
G1 X147.085 Y129.401 E.00992
M204 S10000
G1 X147.842 Y129.412 F42000
G1 F2084
M204 S6000
G1 X147.831 Y129.561 E.00498
G1 X146.939 Y129.971 E.03255
G3 X146.827 Y128.813 I-.192 J-.566 E.07138
G1 X146.899 Y128.827 E.00244
G3 X147.04 Y128.884 I-.211 J.724 E.00502
G1 X147.792 Y129.379 E.02987
M204 S250
G1 X147.611 Y130.094 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2084
M204 S5000
G3 X147.058 Y130.345 I-1.694 J-3.009 E.01867
G3 X147.241 Y128.547 I-.31 J-.94 E.12103
G1 X147.704 Y128.852 E.01706
G2 X146.773 Y121.994 I-20.834 J-.662 E.21364
G2 X146.243 Y120.552 I-15.381 J4.831 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.876 J-10.079 E.22032
G1 X147.602 Y130.154 E.03872
M204 S10000
G1 X147.94 Y129.727 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.228896
G1 F2084
M204 S6000
G3 X145.362 Y137.919 I-20.511 J-1.953 E.13112
; WIPE_START
G1 F15000
G1 X145.924 Y136.866 E-.45368
G1 X146.264 Y136.135 E-.30632
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.975 Y129.264 Z13.6 F42000
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.228897
G1 F2084
M204 S6000
G2 X146.647 Y120.779 I-20.573 J-1.126 E.13111
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X147.046 Y121.905 E-.45369
G1 X147.273 Y122.678 E-.30632
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/76
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.6 I-.703 J-.993 P1  F42000
G1 X118.33 Y143.172 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2108
M204 S5000
G1 X118.354 Y143.237 E.00212
G3 X116.543 Y144.01 I-.946 J.292 E.08922
G1 X116.545 Y144.009 E.00005
G2 X118.281 Y143.207 I-1.426 J-5.365 E.05907
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03
G1 X118.394 Y143.428 E-.07426
G1 X118.395 Y143.623 E-.07419
G1 X118.358 Y143.815 E-.0742
G1 X118.284 Y143.996 E-.07427
G1 X118.177 Y144.159 E-.07415
G1 X118.033 Y144.302 E-.07688
G1 X117.782 Y144.45 E-.11103
G1 X117.498 Y144.519 E-.11116
G1 X117.34 Y144.518 E-.05985
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z13.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.8
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
            G0 Z13.8 F4000
            G39.3 S1
            G0 Z13.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269659
G1 F2108
M204 S6000
G1 X118.071 Y143.706 E.01372
; LINE_WIDTH: 0.239399
G1 X118.203 Y143.524 E.0036
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416224
G1 F2108
M204 S6000
G1 X117.828 Y143.948 E.01483
; LINE_WIDTH: 0.471982
G3 X117.462 Y144.12 I-.615 J-.835 E.01423
; LINE_WIDTH: 0.417224
G1 X116.979 Y144.199 E.01494
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.228945
G1 F2108
M204 S6000
G1 X117.086 Y144.15 E.00291
; LINE_WIDTH: 0.259472
G1 X117.859 Y144.186 E.01366
; WIPE_START
G1 F15000
G1 X117.086 Y144.15 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.927 Y136.564 Z13.8 F42000
G1 X120.699 Y111.556 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2108
M204 S5000
G2 X119.057 Y110.462 I-3.703 J3.777 E.061
G3 X119.932 Y110.076 I.789 J.604 E.03064
G3 X120.728 Y111.503 I-.093 J.987 E.05901
M204 S10000
G1 X120.627 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.285397
G1 F2108
M204 S6000
G1 X120.523 Y110.99 E.00444
G2 X120.125 Y110.322 I-6.993 J3.714 E.01536
M204 S10000
G1 X120.367 Y110.466 F42000
; LINE_WIDTH: 0.231165
G1 F2108
M204 S6000
G2 X119.419 Y110.39 I-3.814 J41.406 E.01458
M204 S10000
G1 X119.504 Y110.345 F42000
; LINE_WIDTH: 0.403353
G1 F2108
M204 S6000
G1 X119.896 Y110.457 E.01197
; LINE_WIDTH: 0.42918
G1 X119.961 Y110.481 E.00219
; LINE_WIDTH: 0.470467
G3 X120.094 Y110.544 I-.436 J1.088 E.00511
G1 X120.318 Y110.713 E.00979
; LINE_WIDTH: 0.425953
G1 X120.636 Y111.085 E.01526
; WIPE_START
G1 F9398.669
G1 X120.318 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.697 Y117.557 Z13.8 F42000
G1 X131.516 Y133.393 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2108
M204 S6000
G1 X131.569 Y132.689 E.02342
G1 X131.99 Y132.721 E.014
G1 X132.348 Y132.747 E.01193
G1 X132.29 Y133.527 E.02593
G1 X131.51 Y133.468 E.02593
G1 X131.511 Y133.453 E.00052
; WIPE_START
G1 F5400
G1 X131.569 Y132.689 E-.29111
M73 P94 R1
G1 X131.99 Y132.721 E-.1604
G1 X132.348 Y132.747 E-.13665
G1 X132.314 Y133.198 E-.17185
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.885 Y125.587 Z13.8 F42000
G1 X133.007 Y123.954 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2108
M204 S6000
G1 X132.228 Y123.895 E.02593
G1 X132.286 Y123.116 E.02593
G1 X133.066 Y123.174 E.02593
G1 X133.012 Y123.894 E.02394
; WIPE_START
G1 F5400
G1 X132.228 Y123.895 E-.29792
G1 X132.286 Y123.116 E-.29705
G1 X132.719 Y123.148 E-.16503
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.506 Y130.684 Z13.8 F42000
G1 X131.141 Y132.951 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2108
M204 S6000
G1 X131.193 Y132.253 E.02322
G1 X131.492 Y132.275 E.00995
G1 X132.091 Y124.293 E.26551
G1 X131.791 Y124.271 E.00995
G1 X131.911 Y122.679 E.05294
G1 X133.502 Y122.799 E.05294
G1 X133.383 Y124.39 E.05294
G1 X132.685 Y124.338 E.02322
G1 X132.087 Y132.32 E.26551
G1 X132.785 Y132.372 E.02322
G1 X132.665 Y133.963 E.05294
G1 X131.074 Y133.844 E.05294
G1 X131.136 Y133.01 E.02773
M204 S250
G1 X130.779 Y132.53 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2108
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.67 Y124.655 E.22185
G1 X131.371 Y124.633 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.507 Y131.958 E.22185
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
M204 S10000
G1 X130.938 Y133.034 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630858
G1 F2108
M204 S6000
G1 X125.055 Y132.593 E.28266
; WIPE_START
G1 F6123.1
G1 X127.049 Y132.742 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.774 Y132.5 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.231719
G1 F2108
M204 S6000
G1 X132.403 Y124.113 E.1294
M204 S10000
G1 X131.655 Y123.46 F42000
; LINE_WIDTH: 0.630867
G1 F2108
M204 S6000
G1 X125.772 Y123.02 E.28267
; WIPE_START
G1 F6123
G1 X127.766 Y123.169 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X134.973 Y125.684 Z13.8 F42000
G1 X147.611 Y130.095 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2108
M204 S5000
G3 X147.059 Y130.344 I-1.698 J-3.02 E.01865
G3 X147.24 Y128.547 I-.311 J-.939 E.12104
G1 X147.704 Y128.852 E.01706
G2 X146.773 Y121.994 I-20.835 J-.661 E.21363
G2 X146.243 Y120.552 I-15.392 J4.835 E.04721
G1 X146.89 Y120.601 E.01992
G3 X145.576 Y138.132 I-18.921 J7.397 E.55864
G1 X144.93 Y138.083 E.01992
G2 X147.415 Y131.4 I-16.87 J-10.076 E.22033
G1 X147.602 Y130.154 E.03871
M204 S10000
G1 X148.012 Y129.615 F42000
; FEATURE: Top surface
G1 F2108
M204 S2000
G1 X147.108 Y128.711 E.03927
G1 X146.521 Y128.657
G1 X147.693 Y129.829 E.05091
G1 X147.328 Y129.997
G1 X146.811 Y129.481 E.02244
G1 X146.461 Y129.663
G1 X146.956 Y130.158 E.02151
M204 S10000
G1 X146.486 Y128.666 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110744
G1 F2108
M204 S6000
G2 X146.356 Y128.759 I.889 J1.38 E.00089
; LINE_WIDTH: 0.157084
G1 X146.339 Y128.797 E.00039
; LINE_WIDTH: 0.206286
G1 X146.321 Y128.836 E.00056
; LINE_WIDTH: 0.255488
G1 X146.304 Y128.874 E.00073
; LINE_WIDTH: 0.283013
G1 X146.303 Y128.878 E.00007
; LINE_WIDTH: 0.262442
G1 X146.476 Y129.018 E.00398
; LINE_WIDTH: 0.215448
G1 X146.649 Y129.157 E.00313
; LINE_WIDTH: 0.160895
G1 X146.839 Y129.313 E.00236
G1 X146.899 Y129.393 E.00096
M204 S10000
G1 X146.405 Y129.692 F42000
; LINE_WIDTH: 0.104874
G1 F2108
M204 S6000
G1 X146.299 Y129.769 E.00066
; LINE_WIDTH: 0.145411
G1 X146.283 Y129.804 E.00033
; LINE_WIDTH: 0.193047
G1 X146.266 Y129.839 E.00048
; LINE_WIDTH: 0.240684
G1 X146.249 Y129.875 E.00063
; LINE_WIDTH: 0.260634
G1 X146.248 Y129.883 E.00015
G2 X146.428 Y130.033 I1.69 J-1.848 E.00416
; LINE_WIDTH: 0.230468
G1 X146.666 Y130.202 E.00445
; WIPE_START
G1 F15000
G1 X146.428 Y130.033 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.632 Y131.273 Z13.8 F42000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.110913
G1 F2108
M204 S6000
G2 X147.888 Y130.86 I-9.864 J-6.395 E.00269
M204 S10000
G1 X147.781 Y130.934 F42000
; LINE_WIDTH: 0.230321
G1 F2108
M204 S6000
G1 X147.697 Y131.451 E.00801
G3 X145.362 Y137.919 I-19.763 J-3.479 E.10553
; WIPE_START
G1 F15000
G1 X145.724 Y137.26 E-.28562
G1 X146.142 Y136.411 E-.35969
G1 X146.262 Y136.134 E-.11469
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.962 Y128.693 Z13.8 F42000
G1 X148.092 Y128.124 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.229316
G1 F2108
M204 S6000
G2 X147.996 Y127.919 I-4.287 J1.894 E.00344
G1 X147.991 Y127.523 E.00602
G2 X146.647 Y120.779 I-20.061 J.495 E.10496
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X146.906 Y121.485 E-.28564
G1 X147.196 Y122.396 E-.36353
G1 X147.271 Y122.678 E-.11083
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/76
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z13.8 I-.703 J-.993 P1  F42000
G1 X118.33 Y143.172 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
M204 S5000
G1 X118.354 Y143.237 E.00211
G3 X116.543 Y144.01 I-.946 J.292 E.08922
G1 X116.544 Y144.009 E.00003
G2 X118.281 Y143.207 I-1.425 J-5.365 E.05909
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.02997
G1 X118.394 Y143.428 E-.07424
G1 X118.395 Y143.624 E-.07432
G1 X118.358 Y143.815 E-.07417
G1 X118.284 Y143.996 E-.07423
G1 X118.177 Y144.159 E-.07426
G1 X118.034 Y144.301 E-.07653
G1 X117.782 Y144.45 E-.11114
G1 X117.595 Y144.505 E-.0742
G1 X117.4 Y144.523 E-.07439
G1 X117.341 Y144.514 E-.02256
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14
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
            G0 Z14 F4000
            G39.3 S1
            G0 Z14 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.269815
G1 F1860
M204 S6000
G1 X118.071 Y143.706 E.01372
; LINE_WIDTH: 0.239679
G1 X118.203 Y143.524 E.00361
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416273
G1 F1860
M204 S6000
G1 X117.828 Y143.948 E.01484
; LINE_WIDTH: 0.472003
G3 X117.462 Y144.12 I-.615 J-.835 E.01422
; LINE_WIDTH: 0.417138
G1 X116.979 Y144.199 E.01493
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.230357
G1 F1860
M204 S6000
G1 X117.09 Y144.151 E.00299
; LINE_WIDTH: 0.261069
G1 X117.86 Y144.186 E.0137
; WIPE_START
G1 F15000
G1 X117.09 Y144.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.942 Y140.788 Z14 F42000
G1 X146.89 Y129.525 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1860
M204 S6000
G1 X146.873 Y129.547 E.00093
G1 X146.808 Y129.585 E.00249
G1 X146.734 Y129.594 E.00248
G1 X146.661 Y129.574 E.00249
G1 X146.603 Y129.527 E.00249
G1 X146.569 Y129.469 E.00222
G1 X146.558 Y129.395 E.00249
G1 X146.577 Y129.322 E.00249
G1 X146.622 Y129.263 E.00248
G1 X146.687 Y129.225 E.00249
G1 X146.766 Y129.216 E.00263
G1 X146.826 Y129.232 E.00206
G1 X146.886 Y129.276 E.00249
G1 X146.926 Y129.34 E.00249
G1 X146.937 Y129.414 E.00249
G1 X146.921 Y129.475 E.00207
M204 S10000
G1 X147.208 Y129.766 F42000
G1 F1860
M204 S6000
G1 X147.143 Y129.854 E.00363
G3 X146.733 Y128.808 I-.393 J-.449 E.0759
G1 X146.794 Y128.809 E.00202
G3 X147.286 Y129.665 I-.044 J.595 E.03856
G1 X147.245 Y129.719 E.00225
M204 S250
G1 X147.534 Y130.006 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
M204 S5000
G1 X147.401 Y130.147 E.00595
G3 X146.723 Y128.415 I-.654 J-.742 E.11668
G1 X146.818 Y128.418 E.00291
G3 X147.568 Y129.956 I-.071 J.987 E.06357
; WIPE_START
G1 F3000
M204 S6000
G1 X147.401 Y130.147 E-.09616
G1 X147.241 Y130.263 E-.07498
G1 X147.063 Y130.343 E-.07418
G1 X146.872 Y130.387 E-.07462
G1 X146.675 Y130.392 E-.07485
G1 X146.481 Y130.358 E-.07482
G1 X146.298 Y130.287 E-.07474
G1 X146.132 Y130.18 E-.07481
G1 X145.991 Y130.043 E-.07482
G1 X145.903 Y129.921 E-.05736
G1 X145.893 Y129.9 E-.00866
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X138.373 Y131.209 Z14 F42000
G1 X130.779 Y132.53 Z14
G1 Z13.6
G1 E.8 F1800
G1 F1860
M204 S5000
G1 X130.832 Y131.832 E.02151
G1 X131.131 Y131.855 E.00922
G1 X131.67 Y124.655 E.22185
G1 X131.371 Y124.633 E.00922
G1 X131.423 Y123.934 E.02151
G1 X125.54 Y123.494 E.18129
G1 X125.613 Y122.516 E.03011
G1 X131.497 Y122.957 E.18129
G1 X131.549 Y122.259 E.02151
G1 X133.922 Y122.437 E.07313
G1 X133.744 Y124.81 E.07313
G1 X133.046 Y124.758 E.02151
G1 X132.507 Y131.958 E.22185
G1 X133.205 Y132.01 E.02151
G1 X133.027 Y134.384 E.07313
G1 X130.654 Y134.206 E.07313
G1 X130.706 Y133.508 E.02151
G1 X124.822 Y133.067 E.18129
G1 X124.896 Y132.089 E.03011
G1 X130.719 Y132.526 E.17945
; WIPE_START
G1 F3000
M204 S6000
G1 X130.832 Y131.832 E-.26698
G1 X131.131 Y131.855 E-.114
G1 X131.205 Y130.86 E-.37903
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.279 Y134.119 Z14 F42000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F1860
M204 S2000
G1 X132.884 Y133.514 E.0263
G1 X132.927 Y132.938
G1 X131.783 Y134.082 E.04973
G1 X131.287 Y134.045
G1 X132.971 Y132.361 E.07317
G1 X132.624 Y132.175
G1 X130.883 Y133.915 E.07564
G1 X130.927 Y133.339
G1 X132.298 Y131.967 E.0596
G1 X132.341 Y131.391
G1 X130.452 Y133.281 E.08212
G1 X130.483 Y132.716
G1 X129.956 Y133.243 E.02291
G1 X129.459 Y133.206
G1 X129.987 Y132.679 E.02291
G1 X129.491 Y132.642
G1 X128.963 Y133.169 E.02291
G1 X128.467 Y133.132
G1 X128.995 Y132.605 E.02291
G1 X128.498 Y132.567
G1 X127.971 Y133.095 E.02291
G1 X127.475 Y133.058
G1 X128.002 Y132.53 E.02291
G1 X127.506 Y132.493
G1 X126.979 Y133.02 E.02291
G1 X126.483 Y132.983
G1 X127.01 Y132.456 E.02291
G1 X126.514 Y132.419
G1 X125.987 Y132.946 E.02291
G1 X125.491 Y132.909
G1 X126.018 Y132.382 E.02291
G1 X125.522 Y132.344
G1 X125.049 Y132.817 E.02055
; WIPE_START
G1 F3000
M204 S6000
G1 X125.522 Y132.344 E-.2541
G1 X126.018 Y132.382 E-.18904
G1 X125.491 Y132.909 E-.28337
G1 X125.579 Y132.915 E-.0335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.338 Y131.861 Z14 F42000
G1 Z13.6
G1 E.8 F1800
G1 F1860
M204 S2000
G1 X132.385 Y130.814 E.04547
G1 X132.428 Y130.238
G1 X131.381 Y131.284 E.04547
G1 X131.425 Y130.708
G1 X132.471 Y129.661 E.04547
G1 X132.514 Y129.085
G1 X131.468 Y130.131 E.04547
G1 X131.511 Y129.555
G1 X132.557 Y128.509 E.04547
G1 X132.601 Y127.932
G1 X131.554 Y128.978 E.04547
G1 X131.597 Y128.402
G1 X132.644 Y127.356 E.04547
G1 X132.687 Y126.779
G1 X131.641 Y127.826 E.04547
G1 X131.684 Y127.249
G1 X132.73 Y126.203 E.04547
G1 X132.773 Y125.626
G1 X131.727 Y126.673 E.04547
G1 X131.77 Y126.096
G1 X132.817 Y125.05 E.04547
; WIPE_START
G1 F3000
M204 S6000
G1 X131.77 Y126.096 E-.5623
G1 X131.731 Y126.615 E-.1977
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X133.619 Y123.715 Z14 F42000
G1 Z13.6
G1 E.8 F1800
G1 F1860
M204 S2000
G1 X131.813 Y125.52 E.07844
G1 X131.857 Y124.943
G1 X133.662 Y123.138 E.07844
G1 X133.643 Y122.624
G1 X131.809 Y124.457 E.07967
G1 X131.618 Y124.116
G1 X133.146 Y122.587 E.06643
G1 X132.65 Y122.55
G1 X131.47 Y123.73 E.05129
; WIPE_START
G1 F3000
M204 S6000
G1 X132.65 Y122.55 E-.63429
G1 X132.98 Y122.574 E-.12571
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.154 Y122.513 Z14 F42000
G1 Z13.6
G1 E.8 F1800
G1 F1860
M204 S2000
G1 X131.704 Y122.963 E.01956
G1 X131.501 Y123.166
G1 X130.974 Y123.693 E.02291
G1 X130.478 Y123.656
G1 X131.005 Y123.128 E.02291
G1 X130.509 Y123.091
G1 X129.982 Y123.618 E.02291
G1 X129.486 Y123.581
G1 X130.013 Y123.054 E.02291
G1 X129.517 Y123.017
G1 X128.99 Y123.544 E.02291
G1 X128.494 Y123.507
G1 X129.021 Y122.98 E.02291
G1 X128.525 Y122.942
G1 X127.997 Y123.47 E.02291
G1 X127.501 Y123.433
G1 X128.029 Y122.905 E.02291
G1 X127.533 Y122.868
G1 X127.005 Y123.395 E.02291
G1 X126.509 Y123.358
M73 P95 R1
G1 X127.037 Y122.831 E.02291
G1 X126.54 Y122.794
G1 X126.013 Y123.321 E.02291
M204 S10000
G1 X125.841 Y122.722 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193652
G1 F1860
M204 S6000
G1 X125.825 Y123.242 E.00639
G1 X125.857 Y123.328 E.00113
; WIPE_START
G1 F15000
G1 X125.825 Y123.242 E-.11401
G1 X125.841 Y122.722 E-.64599
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.798 Y129.249 Z14 F42000
G1 X131.446 Y131.969 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.129221
G1 F1860
M204 S6000
G1 X130.978 Y132.397 E.00446
; WIPE_START
G1 F15000
G1 X131.446 Y131.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y125.215 Z14 F42000
G1 X120.699 Y111.556 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1860
M204 S5000
G2 X119.057 Y110.462 I-3.703 J3.777 E.061
G3 X119.932 Y110.076 I.789 J.604 E.03065
G3 X120.728 Y111.503 I-.093 J.987 E.059
M204 S10000
G1 X120.627 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.285395
G1 F1860
M204 S6000
G1 X120.523 Y110.989 E.00445
G2 X120.126 Y110.323 I-7.12 J3.786 E.01534
M204 S10000
G1 X120.378 Y110.476 F42000
; LINE_WIDTH: 0.256764
G1 F1860
M204 S6000
G2 X119.423 Y110.388 I-4.52 J44.027 E.01671
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421213
G1 F1860
M204 S6000
G1 X119.96 Y110.48 E.01403
; LINE_WIDTH: 0.470421
G3 X120.094 Y110.544 I-.437 J1.093 E.00516
G1 X120.317 Y110.713 E.00975
; LINE_WIDTH: 0.426133
G1 X120.636 Y111.085 E.01529
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9394.271
G1 X120.317 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/76
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
M106 S204
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14 I-.703 J.993 P1  F42000
G1 X146.892 Y129.521 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00107
G1 X146.808 Y129.585 E.00248
G1 X146.733 Y129.594 E.00249
G1 X146.661 Y129.574 E.00249
G1 X146.602 Y129.527 E.00249
G1 X146.569 Y129.469 E.00221
G1 X146.558 Y129.395 E.00249
G1 X146.577 Y129.322 E.00249
G1 X146.622 Y129.263 E.00249
G1 X146.687 Y129.225 E.00249
G1 X146.766 Y129.216 E.00263
G1 X146.826 Y129.232 E.00205
G1 X146.886 Y129.276 E.00248
G1 X146.926 Y129.34 E.00249
G1 X146.937 Y129.414 E.0025
G1 X146.922 Y129.471 E.00193
M204 S10000
G1 X147.211 Y129.763 F42000
G1 F1200
M204 S6000
G1 X147.143 Y129.854 E.00377
G3 X146.733 Y128.808 I-.393 J-.449 E.07588
G1 X146.795 Y128.809 E.00205
G3 X147.287 Y129.665 I-.045 J.595 E.03854
G1 X147.248 Y129.715 E.00211
M204 S250
G1 X147.535 Y130.002 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X146.723 Y128.415 I-.788 J-.598 E.12274
G1 X146.819 Y128.418 E.00295
G3 X147.57 Y129.953 I-.071 J.987 E.06344
; WIPE_START
G1 F3000
M204 S6000
G1 X147.402 Y130.148 E-.09761
G1 X147.241 Y130.263 E-.07499
G1 X147.063 Y130.343 E-.07426
G1 X146.872 Y130.387 E-.07471
G1 X146.675 Y130.392 E-.07483
G1 X146.481 Y130.358 E-.07476
G1 X146.297 Y130.286 E-.07487
G1 X146.132 Y130.18 E-.07479
G1 X145.991 Y130.043 E-.07485
G1 X145.903 Y129.921 E-.05699
G1 X145.894 Y129.904 E-.00734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.017 Y133.214 Z14.2 F42000
G1 X118.33 Y143.172 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00211
G3 X116.543 Y144.01 I-.946 J.292 E.08922
G1 X116.543 Y144.01 E0
G2 X118.281 Y143.207 I-1.424 J-5.365 E.05912
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.02997
G1 X118.394 Y143.428 E-.07433
G1 X118.395 Y143.624 E-.07429
G1 X118.358 Y143.815 E-.07423
G1 X118.284 Y143.996 E-.0743
G1 X118.107 Y144.235 E-.11286
G1 X117.956 Y144.359 E-.07445
G1 X117.783 Y144.45 E-.07426
G1 X117.498 Y144.519 E-.11123
G1 X117.34 Y144.518 E-.06007
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.2
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
            G0 Z14.2 F4000
            G39.3 S1
            G0 Z14.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270046
G1 F1200
M204 S6000
G1 X118.071 Y143.707 E.01373
; LINE_WIDTH: 0.23992
G1 X118.203 Y143.524 E.00362
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416641
G1 F1200
M204 S6000
G1 X117.824 Y143.951 E.01498
; LINE_WIDTH: 0.472267
G3 X117.462 Y144.12 I-.611 J-.837 E.01406
; LINE_WIDTH: 0.41714
G1 X116.979 Y144.199 E.01494
M204 S10000
G1 X116.895 Y144.137 F42000
; LINE_WIDTH: 0.231645
G1 F1200
M204 S6000
G1 X117.093 Y144.151 E.00306
; LINE_WIDTH: 0.262377
G1 X117.86 Y144.186 E.01372
; WIPE_START
G1 F15000
G1 X117.093 Y144.151 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.933 Y137.554 Z14.2 F42000
G1 X124.298 Y131.774 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F600
M204 S5000
G1 X123.669 Y131.727 E.0209
G1 X124.273 Y123.669 E.26803
G1 X124.901 Y123.716 E.0209
G1 X124.858 Y124.295 E.01925
G1 X124.808 Y124.291 E.00166
G1 X124.291 Y131.192 E.22954
G1 X124.341 Y131.195 E.00166
G1 X124.302 Y131.714 E.01725
M106 S204
; WIPE_START
M204 S6000
G1 X123.669 Y131.727 E-.24049
G1 X123.772 Y130.363 E-.51951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-.308 J1.177 P1  F42000
G1 X131.099 Y132.284 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21263
G1 X131.659 Y124.805 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231373
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11229
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.227702
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193795
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159888
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I.087 J-1.214 P1  F42000
G1 X124.678 Y124.072 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.160105
G1 F1200
M204 S6000
G1 X124.646 Y124.045 E.0004
; LINE_WIDTH: 0.194173
G1 X124.615 Y124.018 E.00051
; LINE_WIDTH: 0.228241
G1 X124.583 Y123.991 E.00063
; LINE_WIDTH: 0.231384
G1 X124.556 Y123.998 E.00043
G1 X124.534 Y124.074 E.00123
G1 X123.987 Y131.365 E.11228
G1 X123.998 Y131.444 E.00122
G1 X124.024 Y131.455 E.00043
; LINE_WIDTH: 0.227896
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193919
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159941
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.2 I-.087 J1.214 P1  F42000
G1 X131.322 Y131.929 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.159848
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193744
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227639
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z14.2 F42000
G1 X120.699 Y111.556 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.703 J3.778 E.061
G3 X119.932 Y110.076 I.789 J.605 E.03066
G3 X120.728 Y111.503 I-.094 J.987 E.05899
M204 S10000
G1 X120.627 Y111.19 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.285451
G1 F1200
M204 S6000
G1 X120.523 Y110.989 E.00446
G2 X120.126 Y110.323 I-7.158 J3.809 E.01534
M204 S10000
G1 X120.378 Y110.476 F42000
; LINE_WIDTH: 0.258546
G1 F1200
M204 S6000
G2 X119.423 Y110.388 I-4.355 J42.128 E.01686
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421324
G1 F1200
M204 S6000
G1 X119.96 Y110.48 E.01401
; LINE_WIDTH: 0.470401
G3 X120.094 Y110.544 I-.436 J1.094 E.0052
G1 X120.317 Y110.712 E.00971
; LINE_WIDTH: 0.426303
G1 X120.636 Y111.085 E.01532
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9390.095
G1 X120.317 Y110.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/76
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.2 I-.703 J.993 P1  F42000
G1 X146.895 Y129.518 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00121
G1 X146.808 Y129.585 E.00249
G1 X146.734 Y129.594 E.00249
G1 X146.661 Y129.574 E.00249
G1 X146.603 Y129.527 E.00248
G1 X146.569 Y129.47 E.00221
G1 X146.558 Y129.395 E.00249
G1 X146.577 Y129.322 E.00249
G1 X146.622 Y129.263 E.0025
G1 X146.687 Y129.225 E.00248
G1 X146.766 Y129.216 E.00264
G1 X146.826 Y129.232 E.00205
G1 X146.886 Y129.276 E.00248
G1 X146.926 Y129.34 E.0025
G1 X146.937 Y129.414 E.00249
G1 X146.924 Y129.466 E.00179
M204 S10000
G1 X147.213 Y129.759 F42000
G1 F1200
M204 S6000
G1 X147.143 Y129.854 E.00391
G3 X146.733 Y128.808 I-.393 J-.449 E.07588
G1 X146.795 Y128.809 E.00207
G3 X147.287 Y129.665 I-.045 J.595 E.03853
G1 X147.25 Y129.712 E.00197
M204 S250
G1 X147.535 Y130.002 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X146.723 Y128.415 I-.788 J-.598 E.12274
G1 X146.819 Y128.418 E.00296
G3 X147.57 Y129.953 I-.072 J.987 E.06342
; WIPE_START
G1 F3000
M204 S6000
G1 X147.402 Y130.147 E-.0976
G1 X147.241 Y130.263 E-.07505
G1 X147.063 Y130.343 E-.07433
G1 X146.871 Y130.387 E-.0747
G1 X146.675 Y130.392 E-.07485
G1 X146.48 Y130.358 E-.0749
G1 X146.297 Y130.286 E-.07475
G1 X146.132 Y130.18 E-.07486
G1 X145.991 Y130.043 E-.07468
G1 X145.903 Y129.921 E-.05691
G1 X145.895 Y129.904 E-.00736
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.017 Y133.214 Z14.4 F42000
G1 X118.33 Y143.172 Z14.4
G1 Z14
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00212
G3 X116.543 Y144.01 I-.944 J.295 E.08943
G2 X118.281 Y143.207 I-1.424 J-5.365 E.05913
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03001
G1 X118.399 Y143.526 E-.11129
G1 X118.381 Y143.721 E-.07421
G1 X118.326 Y143.908 E-.0743
G1 X118.234 Y144.081 E-.07431
G1 X118.11 Y144.232 E-.07431
G1 X117.958 Y144.357 E-.075
G1 X117.828 Y144.43 E-.05658
G1 X117.644 Y144.495 E-.07427
G1 X117.45 Y144.522 E-.07445
G1 X117.341 Y144.516 E-.04128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.4
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
            G0 Z14.4 F4000
            G39.3 S1
            G0 Z14.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270032
G1 F1200
M204 S6000
G1 X118.071 Y143.707 E.01372
; LINE_WIDTH: 0.239874
G1 X118.203 Y143.524 E.00362
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416533
G1 F1200
M204 S6000
G1 X117.827 Y143.949 E.01489
; LINE_WIDTH: 0.470181
G3 X117.434 Y144.127 I-.612 J-.831 E.01513
; LINE_WIDTH: 0.421432
G1 X116.991 Y144.207 E.01387
M204 S10000
G1 X116.894 Y144.135 F42000
; LINE_WIDTH: 0.249235
G1 F1200
M204 S6000
G2 X117.832 Y144.204 I4.482 J-54.796 E.01582
; WIPE_START
G1 F15000
G1 X116.894 Y144.135 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.68 Y137.029 Z14.4 F42000
G1 X124.901 Y123.716 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.291 Y131.192 E.21263
G1 X124.341 Y131.196 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.842 Y123.712 E.01751
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22161
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.5194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-.876 J.845 P1  F42000
G1 X131.099 Y132.284 Z14.4
G1 Z14
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21263
G1 X131.659 Y124.804 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231363
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11228
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.227575
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193716
G1 X131.905 Y124.588 E.00051
; LINE_WIDTH: 0.159858
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.905 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I.087 J-1.214 P1  F42000
G1 X124.678 Y124.071 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.159933
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193885
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227837
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231374
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11229
G1 X123.997 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227388
G1 X124.059 Y131.434 E.00062
; LINE_WIDTH: 0.193581
G1 X124.095 Y131.412 E.00051
; LINE_WIDTH: 0.159774
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.095 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.4 I-.087 J1.214 P1  F42000
G1 X131.322 Y131.929 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.159917
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193833
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227748
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z14.4 F42000
G1 X120.699 Y111.556 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.85 J3.998 E.06097
G3 X119.933 Y110.076 I.789 J.604 E.03067
G3 X120.728 Y111.503 I-.094 J.987 E.05898
M204 S10000
G1 X120.627 Y111.189 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.240212
G1 F1200
M204 S6000
G1 X120.523 Y110.989 E.00363
; LINE_WIDTH: 0.271333
G1 X120.166 Y110.338 E.01381
M204 S10000
G1 X120.378 Y110.476 F42000
; LINE_WIDTH: 0.260309
G1 F1200
M204 S6000
G2 X119.423 Y110.388 I-4.214 J40.519 E.017
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421289
G1 F1200
M204 S6000
G1 X119.959 Y110.48 E.01399
; LINE_WIDTH: 0.472049
G3 X120.094 Y110.544 I-.436 J1.095 E.00524
G1 X120.229 Y110.635 E.00569
; LINE_WIDTH: 0.45688
G3 X120.358 Y110.755 I-.782 J.971 E.00596
; LINE_WIDTH: 0.413515
G1 X120.634 Y111.082 E.01293
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9714.108
G1 X120.358 Y110.755 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/76
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.4 I-.702 J.994 P1  F42000
G1 X146.898 Y129.514 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00136
G1 X146.808 Y129.585 E.00248
G1 X146.733 Y129.594 E.0025
G1 X146.661 Y129.574 E.00249
G1 X146.599 Y129.523 E.00265
G1 X146.558 Y129.395 E.00446
G1 X146.577 Y129.322 E.0025
G1 X146.622 Y129.262 E.0025
G1 X146.687 Y129.225 E.00248
G1 X146.766 Y129.216 E.00263
G1 X146.886 Y129.276 E.00446
G1 X146.926 Y129.34 E.00249
G1 X146.937 Y129.414 E.0025
G1 X146.925 Y129.462 E.00164
M204 S10000
G1 X147.216 Y129.756 F42000
G1 F1200
M204 S6000
G1 X147.143 Y129.854 E.00405
G3 X146.733 Y128.808 I-.393 J-.449 E.07587
G1 X146.796 Y128.809 E.0021
G3 X147.287 Y129.665 I-.046 J.595 E.0385
M73 P96 R1
G1 X147.253 Y129.708 E.00184
M204 S250
G1 X147.536 Y130.002 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G3 X146.723 Y128.415 I-.788 J-.598 E.12272
G1 X146.82 Y128.418 E.003
G3 X147.57 Y129.954 I-.073 J.986 E.06341
; WIPE_START
G1 F3000
M204 S6000
G1 X147.402 Y130.147 E-.09755
G1 X147.242 Y130.262 E-.07506
G1 X147.063 Y130.343 E-.07433
G1 X146.871 Y130.387 E-.07484
G1 X146.674 Y130.392 E-.07486
G1 X146.481 Y130.358 E-.07475
G1 X146.297 Y130.286 E-.07495
G1 X146.132 Y130.18 E-.07471
G1 X145.989 Y130.04 E-.07587
G1 X145.902 Y129.92 E-.05626
G1 X145.895 Y129.904 E-.00682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.017 Y133.214 Z14.6 F42000
G1 X118.33 Y143.172 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00212
G3 X116.543 Y144.01 I-.944 J.295 E.08943
G2 X118.281 Y143.207 I-1.424 J-5.365 E.05912
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03005
G1 X118.399 Y143.526 E-.11126
G1 X118.381 Y143.721 E-.07433
G1 X118.326 Y143.908 E-.07414
G1 X118.234 Y144.081 E-.0744
G1 X118.11 Y144.232 E-.07435
G1 X117.957 Y144.358 E-.07517
G1 X117.828 Y144.43 E-.05618
G1 X117.644 Y144.495 E-.07428
G1 X117.45 Y144.522 E-.07441
G1 X117.341 Y144.516 E-.04144
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.6
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
            G0 Z14.6 F4000
            G39.3 S1
            G0 Z14.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270318
G1 F1200
M204 S6000
G1 X118.071 Y143.707 E.01374
; LINE_WIDTH: 0.240234
G1 X118.203 Y143.524 E.00363
M204 S10000
G1 X118.196 Y143.629 F42000
; LINE_WIDTH: 0.416608
G1 F1200
M204 S6000
G1 X117.826 Y143.949 E.0149
; LINE_WIDTH: 0.470228
G3 X117.434 Y144.127 I-.612 J-.83 E.01512
; LINE_WIDTH: 0.421459
G1 X116.991 Y144.207 E.01387
M204 S10000
G1 X116.893 Y144.135 F42000
; LINE_WIDTH: 0.250963
G1 F1200
M204 S6000
G2 X117.834 Y144.203 I3.411 J-40.424 E.01598
; WIPE_START
G1 F15000
G1 X116.893 Y144.135 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.68 Y137.029 Z14.6 F42000
G1 X124.901 Y123.716 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.291 Y131.192 E.21263
G1 X124.341 Y131.196 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.842 Y123.712 E.01751
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22159
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.51941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z14.6 F42000
G1 X131.099 Y132.284 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.39 Y129.069 E.08135
G1 X131.709 Y124.808 E.13128
G1 X131.659 Y124.805 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231365
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11228
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.227692
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193789
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159886
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.159914
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193823
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227732
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231363
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11228
G1 X123.997 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227575
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193716
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159858
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.322 Y131.929 Z14.6 F42000
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.159932
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193837
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227743
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z14.6 F42000
G1 X120.699 Y111.556 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.85 J3.998 E.06097
G3 X119.933 Y110.076 I.789 J.604 E.03068
G3 X120.728 Y111.503 I-.094 J.987 E.05897
M204 S10000
G1 X120.625 Y111.201 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.207963
G1 F1200
M204 S6000
G1 X120.548 Y111.037 E.00244
; LINE_WIDTH: 0.256208
G2 X120.168 Y110.339 I-31.445 J16.671 E.01382
M204 S10000
G1 X120.379 Y110.476 F42000
; LINE_WIDTH: 0.261974
G1 F1200
M204 S6000
G2 X119.424 Y110.388 I-4.852 J47.035 E.01713
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421374
G1 F1200
M204 S6000
G1 X119.958 Y110.48 E.01396
; LINE_WIDTH: 0.470376
G3 X120.095 Y110.544 I-.438 J1.101 E.00527
G1 X120.316 Y110.711 E.00965
; LINE_WIDTH: 0.426831
G1 X120.635 Y111.085 E.01538
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9377.177
G1 X120.316 Y110.711 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/76
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.6 I-.703 J.994 P1  F42000
G1 X146.901 Y129.511 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00152
G1 X146.808 Y129.585 E.00248
G1 X146.734 Y129.594 E.00249
G1 X146.661 Y129.574 E.00249
G1 X146.602 Y129.527 E.0025
G1 X146.565 Y129.457 E.00265
G1 X146.558 Y129.395 E.00204
G1 X146.577 Y129.322 E.0025
G1 X146.622 Y129.263 E.00249
G1 X146.687 Y129.225 E.00249
G1 X146.766 Y129.216 E.00264
G1 X146.826 Y129.232 E.00204
G1 X146.886 Y129.276 E.00249
G1 X146.926 Y129.34 E.0025
G1 X146.937 Y129.414 E.00248
G1 X146.926 Y129.457 E.00148
M204 S10000
G1 X147.219 Y129.752 F42000
G1 F1200
M204 S6000
G1 X147.142 Y129.852 E.00419
G3 X146.797 Y128.809 I-.395 J-.448 E.07816
G1 X146.816 Y128.811 E.00064
G3 X147.285 Y129.664 I-.069 J.593 E.03772
G1 X147.255 Y129.704 E.00167
M204 S250
G1 X147.538 Y130 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X147.536 Y130.002 E.00009
G3 X146.723 Y128.415 I-.788 J-.598 E.12272
G1 X146.821 Y128.418 E.00302
G3 X147.639 Y129.834 I-.073 J.986 E.05916
G1 X147.569 Y129.949 E.00413
; WIPE_START
G1 F3000
M204 S6000
G1 X147.536 Y130.002 E-.02386
G1 X147.402 Y130.147 E-.07496
G1 X147.242 Y130.262 E-.07491
G1 X147.063 Y130.343 E-.07448
G1 X146.871 Y130.387 E-.07489
G1 X146.674 Y130.392 E-.07481
G1 X146.48 Y130.358 E-.07489
G1 X146.297 Y130.286 E-.0749
G1 X146.131 Y130.179 E-.07486
G1 X145.99 Y130.042 E-.07484
G1 X145.897 Y129.906 E-.06259
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P96 R0
G1 X139.019 Y133.216 Z14.8 F42000
G1 X118.33 Y143.172 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00212
G3 X116.542 Y144.01 I-.945 J.295 E.08944
G2 X118.281 Y143.207 I-1.423 J-5.365 E.05914
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03007
G1 X118.399 Y143.526 E-.1113
G1 X118.381 Y143.721 E-.07433
G1 X118.325 Y143.909 E-.0743
G1 X118.234 Y144.081 E-.07432
G1 X118.11 Y144.233 E-.07425
G1 X117.959 Y144.357 E-.07437
G1 X117.831 Y144.429 E-.05597
G1 X117.644 Y144.495 E-.07515
G1 X117.45 Y144.522 E-.07437
G1 X117.341 Y144.516 E-.04157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z14.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z14.8
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
            G0 Z14.8 F4000
            G39.3 S1
            G0 Z14.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270623
G1 F1200
M204 S6000
G1 X118.07 Y143.708 E.01375
; LINE_WIDTH: 0.240521
G1 X118.203 Y143.524 E.00364
M204 S10000
G1 X118.196 Y143.63 F42000
; LINE_WIDTH: 0.416738
G1 F1200
M204 S6000
G1 X117.826 Y143.949 E.0149
; LINE_WIDTH: 0.470252
G3 X117.434 Y144.127 I-.611 J-.828 E.01511
; LINE_WIDTH: 0.421421
G1 X116.991 Y144.207 E.01388
M204 S10000
G1 X116.893 Y144.134 F42000
; LINE_WIDTH: 0.25268
G1 F1200
M204 S6000
G2 X117.88 Y144.171 I.802 J-8.189 E.0169
; WIPE_START
G1 F15000
G1 X116.893 Y144.134 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.68 Y137.029 Z14.8 F42000
G1 X124.901 Y123.716 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.291 Y131.192 E.21263
G1 X124.341 Y131.195 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.687 Y123.7 E.01275
G1 X124.842 Y123.712 E.00476
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.2216
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.5194
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z14.8 F42000
G1 X131.099 Y132.284 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21263
G1 X131.659 Y124.805 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231374
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11229
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.227702
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193795
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159888
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.159947
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193885
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227824
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231374
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11229
G1 X123.998 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227702
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193795
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159888
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.322 Y131.929 Z14.8 F42000
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.159933
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193885
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227837
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z14.8 F42000
G1 X120.699 Y111.556 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.85 J3.998 E.06096
G3 X119.933 Y110.076 I.789 J.604 E.03069
G3 X120.728 Y111.503 I-.095 J.987 E.05895
M204 S10000
G1 X120.627 Y111.187 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.255945
G1 F1200
M204 S6000
G1 X120.179 Y110.345 E.01655
M204 S10000
G1 X120.379 Y110.477 F42000
; LINE_WIDTH: 0.26389
G1 F1200
M204 S6000
G2 X119.424 Y110.388 I-4.48 J42.847 E.01728
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.4213
G1 F1200
M204 S6000
G1 X119.958 Y110.479 E.01394
; LINE_WIDTH: 0.46956
G3 X120.317 Y110.713 I-.367 J.96 E.01501
; LINE_WIDTH: 0.426821
G1 X120.635 Y111.085 E.01532
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9377.424
G1 X120.317 Y110.713 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/76
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z14.8 I-.703 J.994 P1  F42000
G1 X146.903 Y129.508 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00163
G1 X146.808 Y129.585 E.00249
G1 X146.734 Y129.594 E.00249
G1 X146.661 Y129.574 E.0025
G1 X146.612 Y129.538 E.00203
G1 X146.569 Y129.47 E.00263
G1 X146.558 Y129.395 E.00252
G1 X146.577 Y129.323 E.00248
G1 X146.622 Y129.263 E.0025
G1 X146.687 Y129.225 E.00249
G1 X146.761 Y129.216 E.00247
G1 X146.834 Y129.236 E.00252
G1 X146.885 Y129.274 E.0021
G1 X146.926 Y129.34 E.00259
G1 X146.937 Y129.414 E.00249
G1 X146.927 Y129.454 E.00136
M204 S10000
G1 X147.221 Y129.749 F42000
G1 F1200
M204 S6000
G1 X147.142 Y129.852 E.00431
G3 X146.733 Y128.808 I-.395 J-.448 E.07602
G1 X146.791 Y128.809 E.00193
G3 X147.285 Y129.664 I-.044 J.595 E.03854
G1 X147.257 Y129.701 E.00154
M204 S250
G1 X147.54 Y129.997 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X147.535 Y130.002 E.00021
G3 X146.723 Y128.415 I-.788 J-.598 E.12276
G1 X146.82 Y128.418 E.00298
G3 X147.638 Y129.834 I-.073 J.986 E.05916
G1 X147.571 Y129.945 E.004
; WIPE_START
G1 F3000
M204 S6000
G1 X147.535 Y130.002 E-.02541
G1 X147.402 Y130.147 E-.0749
G1 X147.242 Y130.262 E-.07497
G1 X147.063 Y130.343 E-.07463
G1 X146.871 Y130.387 E-.07486
G1 X146.674 Y130.392 E-.07478
G1 X146.48 Y130.358 E-.07498
G1 X146.296 Y130.286 E-.07486
G1 X146.131 Y130.179 E-.07479
G1 X146.023 Y130.079 E-.05595
G1 X145.902 Y129.92 E-.07582
G1 X145.898 Y129.911 E-.00406
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.02 Y133.219 Z15 F42000
G1 X118.33 Y143.172 Z15
M73 P97 R0
G1 Z14.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00213
G3 X116.543 Y144.01 I-.944 J.295 E.08941
G2 X118.281 Y143.207 I-1.424 J-5.365 E.05913
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03013
G1 X118.399 Y143.527 E-.11127
G1 X118.381 Y143.721 E-.07426
G1 X118.325 Y143.909 E-.07446
G1 X118.233 Y144.082 E-.07434
G1 X118.11 Y144.233 E-.07427
G1 X117.957 Y144.358 E-.07522
G1 X117.829 Y144.43 E-.05565
G1 X117.644 Y144.495 E-.07428
G1 X117.45 Y144.522 E-.07444
G1 X117.341 Y144.516 E-.04168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15
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
            G0 Z15 F4000
            G39.3 S1
            G0 Z15 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.621 Y144.297 F42000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270677
G1 F1200
M204 S6000
G1 X118.07 Y143.708 E.01375
; LINE_WIDTH: 0.240507
G1 X118.203 Y143.524 E.00364
M204 S10000
G1 X118.196 Y143.63 F42000
; LINE_WIDTH: 0.416858
G1 F1200
M204 S6000
G1 X117.826 Y143.949 E.01491
; LINE_WIDTH: 0.47028
G3 X117.434 Y144.127 I-.612 J-.83 E.0151
; LINE_WIDTH: 0.421419
G1 X116.991 Y144.208 E.01387
M204 S10000
G1 X116.905 Y144.144 F42000
; LINE_WIDTH: 0.254301
G1 F1200
M204 S6000
G2 X117.872 Y144.177 I2.726 J-66.87 E.01668
; WIPE_START
G1 F15000
G1 X116.905 Y144.144 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.687 Y137.037 Z15 F42000
G1 X124.901 Y123.716 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.61 Y126.931 E.08135
G1 X124.291 Y131.192 E.13128
G1 X124.341 Y131.195 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.531 Y123.689 E.00795
G1 X124.842 Y123.712 E.00956
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22159
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.51941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z15 F42000
G1 X131.099 Y132.284 Z15
G1 Z14.6
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21263
G1 X131.659 Y124.804 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231363
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11228
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.227575
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193716
G1 X131.905 Y124.588 E.00051
; LINE_WIDTH: 0.159858
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.905 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.159932
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193837
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227743
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231365
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11228
G1 X123.998 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227692
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193789
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159886
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.322 Y131.929 Z15 F42000
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.159917
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193833
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227748
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z15 F42000
G1 X120.699 Y111.556 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.85 J3.998 E.06097
G1 X119.07 Y110.443 E.00071
G3 X119.934 Y110.076 I.777 J.629 E.03
G3 X120.728 Y111.503 I-.095 J.987 E.05895
M204 S10000
G1 X120.627 Y111.187 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.256209
G1 F1200
M204 S6000
G1 X120.179 Y110.345 E.01657
M204 S10000
G1 X120.38 Y110.477 F42000
; LINE_WIDTH: 0.265724
G1 F1200
M204 S6000
G2 X119.424 Y110.387 I-4.791 J45.799 E.01743
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421383
G1 F1200
M204 S6000
G1 X119.957 Y110.479 E.01391
; LINE_WIDTH: 0.469544
G3 X120.317 Y110.712 I-.384 J.987 E.01502
; LINE_WIDTH: 0.426773
G1 X120.636 Y111.083 E.01528
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9378.608
G1 X120.317 Y110.712 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/76
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z15 I-.703 J.993 P1  F42000
G1 X146.895 Y129.518 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M204 S6000
G1 X146.873 Y129.547 E.00119
G1 X146.808 Y129.585 E.00248
G1 X146.733 Y129.594 E.0025
G1 X146.661 Y129.574 E.00248
G1 X146.602 Y129.527 E.00249
G1 X146.566 Y129.461 E.00249
G1 X146.558 Y129.4 E.00204
G1 X146.577 Y129.323 E.00265
G1 X146.622 Y129.263 E.0025
G1 X146.687 Y129.225 E.00249
G1 X146.761 Y129.216 E.00247
G1 X146.834 Y129.236 E.0025
G1 X146.884 Y129.273 E.00207
G1 X146.926 Y129.34 E.00262
G1 X146.937 Y129.414 E.00249
G1 X146.923 Y129.467 E.0018
M204 S10000
G1 X147.192 Y129.8 F42000
G1 F1200
M204 S6000
G1 X147.185 Y129.811 E.00043
G3 X146.733 Y128.808 I-.437 J-.406 E.078
G1 X146.791 Y128.809 E.00194
G3 X147.308 Y129.609 I-.044 J.595 E.03656
G1 X147.223 Y129.749 E.00542
M204 S250
G1 X147.526 Y130 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X147.472 Y130.077 E.00289
G3 X146.723 Y128.415 I-.725 J-.673 E.11973
G1 X146.82 Y128.418 E.003
G3 X147.638 Y129.834 I-.073 J.986 E.05915
G1 X147.559 Y129.951 E.00432
; WIPE_START
G1 F3000
M204 S6000
G1 X147.472 Y130.077 E-.05852
G1 X147.325 Y130.209 E-.07484
G1 X147.155 Y130.307 E-.07483
G1 X146.968 Y130.37 E-.0748
G1 X146.772 Y130.394 E-.07493
G1 X146.576 Y130.38 E-.07482
G1 X146.386 Y130.326 E-.07498
G1 X146.21 Y130.236 E-.07496
G1 X146.057 Y130.114 E-.07478
G1 X145.929 Y129.962 E-.0752
G1 X145.895 Y129.899 E-.02734
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X139.018 Y133.21 Z15.2 F42000
G1 X118.33 Y143.172 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X118.354 Y143.237 E.00213
G3 X116.543 Y144.01 I-.944 J.295 E.08942
G2 X118.281 Y143.207 I-1.423 J-5.363 E.05912
; WIPE_START
G1 F3000
M204 S6000
G1 X118.354 Y143.237 E-.03011
G1 X118.394 Y143.429 E-.07432
G1 X118.395 Y143.624 E-.07437
G1 X118.325 Y143.909 E-.11141
G1 X118.234 Y144.082 E-.07424
G1 X118.109 Y144.234 E-.07477
G1 X117.956 Y144.359 E-.075
G1 X117.829 Y144.43 E-.05523
G1 X117.644 Y144.495 E-.07437
G1 X117.451 Y144.522 E-.07435
G1 X117.341 Y144.516 E-.04182
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.2
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
            G0 Z15.2 F4000
            G39.3 S1
            G0 Z15.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X117.622 Y144.297 F42000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.270903
G1 F1200
M204 S6000
G1 X118.07 Y143.708 E.01376
; LINE_WIDTH: 0.240697
G1 X118.203 Y143.524 E.00365
M204 S10000
G1 X118.196 Y143.63 F42000
; LINE_WIDTH: 0.41696
G1 F1200
M204 S6000
G1 X117.825 Y143.95 E.01494
; LINE_WIDTH: 0.470346
G3 X117.434 Y144.127 I-.611 J-.831 E.01506
; LINE_WIDTH: 0.421445
G1 X116.992 Y144.208 E.01387
M204 S10000
G1 X116.904 Y144.143 F42000
; LINE_WIDTH: 0.25643
G1 F1200
M204 S6000
G2 X117.873 Y144.176 I1.905 J-41.955 E.01687
; WIPE_START
G1 F15000
G1 X116.904 Y144.143 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.686 Y137.036 Z15.2 F42000
G1 X124.901 Y123.716 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.291 Y131.192 E.21263
G1 X124.341 Y131.196 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.375 Y123.677 E.00315
G1 X124.842 Y123.712 E.01437
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22159
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.51941
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z15.2 F42000
G1 X131.099 Y132.284 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.572 Y126.638 E.15625
G1 X131.709 Y124.808 E.05638
G1 X131.659 Y124.805 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.01 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231379
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.635 E.11229
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.545 E.00043
; LINE_WIDTH: 0.227896
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193919
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159941
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z15.2 F42000
G1 Z14.8
G1 E.8 F1800
; LINE_WIDTH: 0.159928
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193828
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227727
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231363
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11228
G1 X123.997 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227567
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193705
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159842
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.322 Y131.929 Z15.2 F42000
G1 Z14.8
G1 E.8 F1800
; LINE_WIDTH: 0.159933
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193885
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227837
G1 X131.417 Y132.01 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.983 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.22 Z15.2 F42000
G1 X120.699 Y111.556 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.849 J3.998 E.06096
G3 X119.934 Y110.076 I.789 J.605 E.03071
G3 X120.728 Y111.503 I-.09 J.985 E.05904
M204 S10000
G1 X120.628 Y111.176 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.258375
G1 F1200
M204 S6000
G2 X120.141 Y110.328 I-35.445 J19.81 E.01718
M204 S10000
G1 X120.379 Y110.478 F42000
; LINE_WIDTH: 0.26735
G1 F1200
M204 S6000
G2 X119.423 Y110.388 I-3.928 J36.658 E.01756
M204 S10000
G1 X119.53 Y110.333 F42000
; LINE_WIDTH: 0.421323
G1 F1200
M204 S6000
G1 X119.956 Y110.479 E.01389
; LINE_WIDTH: 0.47134
G3 X120.294 Y110.691 I-.376 J.975 E.014
; LINE_WIDTH: 0.443037
G3 X120.361 Y110.759 I-.495 J.551 E.00312
G1 X120.367 Y110.766 E.0003
; LINE_WIDTH: 0.389999
G3 X120.634 Y111.111 I-2.794 J2.432 E.01235
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10372.304
G1 X120.367 Y110.766 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/76
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z15.2 I-.704 J.993 P1  F42000
G1 X147.525 Y130.01 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X147.472 Y130.077 E.00263
G3 X146.723 Y128.415 I-.725 J-.673 E.11972
G1 X146.821 Y128.418 E.00303
G3 X147.591 Y129.92 I-.074 J.986 E.06215
G1 X147.56 Y129.962 E.00158
; WIPE_START
G1 F3000
M204 S6000
G1 X147.472 Y130.077 E-.05535
G1 X147.325 Y130.209 E-.07487
G1 X147.154 Y130.307 E-.07489
G1 X146.968 Y130.37 E-.07481
G1 X146.772 Y130.394 E-.07495
G1 X146.576 Y130.38 E-.07488
G1 X146.386 Y130.326 E-.07488
G1 X146.21 Y130.236 E-.07492
G1 X146.056 Y130.113 E-.07488
G1 X145.93 Y129.962 E-.07488
G1 X145.891 Y129.892 E-.0307
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.4
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
            G0 Z15.4 F4000
            G39.3 S1
            G0 Z15.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X146.521 Y128.657 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X147.495 Y129.631 E.04232
G1 X147.294 Y129.963
G1 X146.189 Y128.858 E.04801
G1 X145.994 Y129.197
G1 X146.955 Y130.158 E.04177
M204 S10000
G1 X146.672 Y130.202 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.22712
G1 F1200
M204 S6000
G3 X146.37 Y129.989 I1.975 J-3.122 E.00554
; LINE_WIDTH: 0.261463
G3 X146.131 Y129.74 I.909 J-1.115 E.00616
; LINE_WIDTH: 0.229154
G1 X145.951 Y129.486 E.00473
; WIPE_START
G1 F15000
G1 X146.131 Y129.74 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.545 Y129.339 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.253972
G1 F1200
M204 S6000
G2 X147.269 Y128.968 I-2.512 J1.579 E.00797
; LINE_WIDTH: 0.276769
G2 X147.065 Y128.786 I-1.311 J1.263 E.00521
; LINE_WIDTH: 0.240034
G1 X146.805 Y128.606 E.00507
; WIPE_START
G1 F15000
G1 X147.065 Y128.786 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X147.549 Y129.385 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.193754
G1 F1200
M204 S6000
G1 X147.159 Y128.719 E.00949
; WIPE_START
G1 F15000
G1 X147.549 Y129.385 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X140.647 Y132.642 Z15.4 F42000
G1 X118.33 Y143.172 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X118.338 Y143.191 E.00063
M73 P98 R0
G3 X116.543 Y144.01 I-.93 J.338 E.09071
G2 X118.281 Y143.207 I-1.423 J-5.364 E.05913
; WIPE_START
G1 F3000
M204 S6000
G1 X118.338 Y143.191 E-.02251
G1 X118.387 Y143.38 E-.07436
G1 X118.398 Y143.576 E-.07436
G1 X118.371 Y143.77 E-.07444
G1 X118.305 Y143.954 E-.07441
G1 X118.205 Y144.122 E-.07439
G1 X118.111 Y144.232 E-.05477
G1 X117.958 Y144.357 E-.07542
G1 X117.785 Y144.449 E-.07439
G1 X117.5 Y144.519 E-.11137
G1 X117.369 Y144.518 E-.04958
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.497 Y143.894 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; FEATURE: Top surface
G1 F1200
M204 S2000
G1 X117.809 Y144.205 E.01352
M204 S10000
G1 X117.452 Y143.913 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110519
G1 F1200
M204 S6000
G1 X117.332 Y143.995 E.0008
; LINE_WIDTH: 0.15765
G1 X117.311 Y144.029 E.00037
; LINE_WIDTH: 0.205806
G1 X117.29 Y144.063 E.00053
; LINE_WIDTH: 0.253963
G1 X117.269 Y144.097 E.00068
; LINE_WIDTH: 0.283288
G1 X117.378 Y144.333 E.0051
; WIPE_START
G1 F14977.036
G1 X117.269 Y144.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X119.946 Y136.949 Z15.4 F42000
G1 X124.901 Y123.716 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.732 Y125.311 E.03142
G1 X124.291 Y131.192 E.18121
G1 X124.341 Y131.195 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.842 Y123.712 E.01751
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22157
G1 X124.808 Y124.291 E-.019
G1 X124.732 Y125.311 E-.38856
G1 X124.706 Y125.654 E-.13088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z15.4 F42000
G1 X131.099 Y132.284 Z15.4
G1 Z15
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01783
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21262
G1 X131.659 Y124.805 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
M204 S10000
G1 X131.417 Y132.009 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231384
G1 F1200
M204 S6000
G1 X131.444 Y132.002 E.00043
G1 X131.466 Y131.926 E.00123
G1 X132.013 Y124.635 E.11228
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.545 E.00043
; LINE_WIDTH: 0.227896
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193919
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159941
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.159845
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193734
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227623
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231373
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11229
G1 X123.998 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.227702
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193795
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159888
G1 X124.13 Y131.39 E.0004
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.322 Y131.928 Z15.4 F42000
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.160075
G1 F1200
M204 S6000
G1 X131.354 Y131.955 E.0004
; LINE_WIDTH: 0.194163
G1 X131.385 Y131.982 E.00051
; LINE_WIDTH: 0.228251
G1 X131.417 Y132.009 E.00063
; WIPE_START
G1 F15000
G1 X131.385 Y131.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.847 Y125.219 Z15.4 F42000
G1 X120.699 Y111.556 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G2 X119.057 Y110.462 I-3.85 J3.998 E.06097
G1 X119.07 Y110.443 E.00071
G3 X119.932 Y110.076 I.773 J.621 E.02997
G3 X120.728 Y111.503 I-.093 J.987 E.059
M204 S10000
G1 X120.512 Y110.945 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430462
G1 F1200
M204 S6000
G2 X120.341 Y110.736 I-1.675 J1.2 E.00853
; LINE_WIDTH: 0.483742
G1 X120.279 Y110.677 E.00308
G2 X119.956 Y110.479 I-.697 J.774 E.01371
; LINE_WIDTH: 0.426599
G1 X119.892 Y110.456 E.00213
G2 X119.69 Y110.402 I-.824 J2.711 E.00653
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9382.855
G1 X119.892 Y110.456 E-.57338
G1 X119.956 Y110.479 E-.18662
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/76
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; OBJECT_ID: 15
M204 S10000
G17
G3 Z15.4 I-1.14 J.426 P1  F42000
G1 X124.901 Y123.716 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X124.858 Y124.295 E.01782
G1 X124.808 Y124.291 E.00154
G1 X124.291 Y131.192 E.21263
G1 X124.341 Y131.196 E.00154
G1 X124.298 Y131.774 E.01782
G1 X123.669 Y131.727 E.01936
G1 X124.273 Y123.669 E.24828
G1 X124.842 Y123.712 E.01751
; WIPE_START
G1 F3000
M204 S6000
G1 X124.858 Y124.295 E-.22157
G1 X124.808 Y124.291 E-.019
G1 X124.706 Y125.654 E-.51943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.004 Y131.148 Z15.6 F42000
G1 X131.099 Y132.284 Z15.6
G1 Z15.2
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X131.142 Y131.705 E.01782
G1 X131.192 Y131.709 E.00154
G1 X131.709 Y124.808 E.21263
G1 X131.659 Y124.804 E.00154
G1 X131.702 Y124.226 E.01782
G1 X132.331 Y124.273 E.01936
G1 X131.727 Y132.331 E.24828
G1 X131.158 Y132.288 E.01751
; WIPE_START
G1 F3000
M204 S6000
G1 X131.142 Y131.705 E-.22157
G1 X131.192 Y131.709 E-.019
G1 X131.294 Y130.346 E-.51943
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z15.6
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
            G0 Z15.6 F4000
            G39.3 S1
            G0 Z15.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X131.322 Y131.929 F42000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.159878
G1 F1200
M204 S6000
G1 X131.353 Y131.956 E.0004
; LINE_WIDTH: 0.193754
G1 X131.385 Y131.983 E.00051
; LINE_WIDTH: 0.227631
G1 X131.417 Y132.01 E.00063
; LINE_WIDTH: 0.231361
G1 X131.444 Y132.002 E.00044
G1 X131.466 Y131.926 E.00122
G1 X132.013 Y124.634 E.11228
G1 X132.002 Y124.556 E.00122
G1 X131.976 Y124.544 E.00044
; LINE_WIDTH: 0.22759
G1 X131.941 Y124.566 E.00063
; LINE_WIDTH: 0.193719
G1 X131.906 Y124.588 E.00051
; LINE_WIDTH: 0.159847
G1 X131.87 Y124.61 E.0004
; WIPE_START
G1 F15000
G1 X131.906 Y124.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.678 Y124.071 Z15.6 F42000
G1 Z15.2
G1 E.8 F1800
; LINE_WIDTH: 0.159878
G1 F1200
M204 S6000
G1 X124.647 Y124.044 E.0004
; LINE_WIDTH: 0.193754
G1 X124.615 Y124.017 E.00051
; LINE_WIDTH: 0.227631
G1 X124.583 Y123.99 E.00063
; LINE_WIDTH: 0.231361
G1 X124.556 Y123.998 E.00044
G1 X124.534 Y124.074 E.00122
G1 X123.987 Y131.366 E.11228
G1 X123.998 Y131.444 E.00122
G1 X124.024 Y131.456 E.00044
; LINE_WIDTH: 0.22759
G1 X124.059 Y131.434 E.00063
; LINE_WIDTH: 0.193719
G1 X124.094 Y131.412 E.00051
; LINE_WIDTH: 0.159847
G1 X124.13 Y131.39 E.0004
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X124.094 Y131.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z15.6 I1.217 J0 P1  F42000
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
G1 Z15.6 F900 ; lower z a little
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

    G1 Z115.2 F600
    G1 Z113.2

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

