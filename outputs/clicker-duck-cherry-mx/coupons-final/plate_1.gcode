; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 10m 45s; total estimated time: 17m 19s
; total layer number: 38
; total filament length [mm] : 599.99
; total filament volume [cm^3] : 1443.15
; total filament weight [g] : 1.85
; filament_density: 1.28,1.28,1.28,1.28
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 6.12
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 0,0,0,0
; additional_fan_full_speed_layer = 0,0,0,0
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
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.2
; brim_type = no_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_additional_fan_first_x_layers = 3,3,3,3
; close_fan_the_first_x_layers = 3,3,3,3
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 0,0,0,0
; cool_plate_temp_initial_layer = 0,0,0,0
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10,10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling,uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 4000
; default_ams_type = -1
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; different_settings_to_system = brim_object_gap;brim_type;seam_position;support_on_build_plate_only;support_threshold_angle;support_top_z_distance;support_type;wall_generator;wall_loops;wall_sequence;;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70,70,70,70
; eng_plate_temp_initial_layer = 70,70,70,70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_nozzle_stats_new = Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 15,15,15,15
; fan_direction = undefine
; fan_max_speed = 50,50,50,50
; fan_min_speed = 30,30,30,30
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 300,300,300,300
; filament_bridge_speed = 25,25,25,25
; filament_change_length = 12,12,12,12
; filament_change_length_nc = 10,10,10,10
; filament_colour = #FFD00B;#000000;#F75403;#FFFFFF
; filament_colour_type = 1;1;1;1
; filament_cooling_before_tower = 0,0,0,0
; filament_cost = 19.99,19.99,19.99,19.99
; filament_density = 1.28,1.28,1.28,1.28
; filament_dev_ams_drying_ams_limitations = 1;0;1;0;1;0;1;0
; filament_dev_ams_drying_heat_distortion_temperature = 75,75,75,75
; filament_dev_ams_drying_temperature = 65,65,55,55,65,65,55,55,65,65,55,55,65,65,55,55
; filament_dev_ams_drying_time = 12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 80,80,80,80
; filament_dev_chamber_drying_time = 12,12,12,12
; filament_dev_drying_cooling_temperature = 55,55,55,55
; filament_dev_drying_softening_temperature = 60,60,60,60
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_enable_overhang_speed = 1,1,1,1
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_compatibility = 0,0,0,0
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.94,0.94,0.94,0.94
; filament_flush_temp = 0,0,0,0
; filament_flush_temp_fast = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFG02;GFG02;GFG02;GFG02
; filament_is_mixed = 0
; filament_is_support = 0,0,0,0
; filament_long_retractions_when_cut = 1,1,1,1
; filament_map = 1,1,1,1
; filament_map_2 = 0,0,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 18,18,18,18
; filament_metal_stickiness = High,High,High,High
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #FFD00B;#000000;#F75403;#FFFFFF
; filament_notes = 
; filament_nozzle_map = 0,0,0,0
; filament_overhang_1_4_speed = 0,0,0,0
; filament_overhang_2_4_speed = 50,50,50,50
; filament_overhang_3_4_speed = 30,30,30,30
; filament_overhang_4_4_speed = 10,10,10,10
; filament_overhang_totally_speed = 10,10,10,10
; filament_pre_cooling_temperature = 0,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0
; filament_preheat_temperature_delta = 0,0,0,0
; filament_prime_volume = 45,45,45,45
; filament_prime_volume_nc = 60,60,60,60
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14
; filament_retraction_distances_when_cut = 18,18,18,18
; filament_scarf_gap = 0%,0%,0%,0%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Bambu PETG HF @BBL A1";"Bambu PETG HF @BBL A1";"Bambu PETG HF @BBL A1";"Bambu PETG HF @BBL A1"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10,10,10,10
; filament_tower_interface_pre_extrusion_length = 0,0,0,0
; filament_tower_interface_print_temp = -1,-1,-1,-1
; filament_tower_interface_purge_volume = 20,20,20,20
; filament_tower_ironing_area = 4,4,4,4
; filament_type = PETG;PETG;PETG;PETG
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0,0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0
; first_x_layer_part_fan_speed = 0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,168,170,403,661,0,534,608,357,146,0,547,277,128,291,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
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
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 70,70,70,70
; hot_plate_temp_initial_layer = 70,70,70,70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10.6,10.6,10.6,10.6
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.16mm High Quality @BBL A1";;;;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 150
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
; internal_solid_infill_speed = 200
; ironing_direction = 45
; ironing_fan_speed = -1,-1,-1,-1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.16
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
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
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 240,240,240,240
; nozzle_temperature_initial_layer = 230,230,230,230
; nozzle_temperature_range_high = 270,270,270,270
; nozzle_temperature_range_low = 230,230,230,230
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 10%,10%,10%,10%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0,0,0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2,2,2,2
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
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
; print_settings_id = 0.16mm High Quality @BBL A1
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
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = nearest
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
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 7,7,7,7
; slow_down_min_speed = 10,10,10,10
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
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 200
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70,70,70,70
; supertack_plate_temp_initial_layer = 70,70,70,70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.16
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
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 1
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 20
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70,70,70,70
; template_custom_gcode = 
; textured_plate_temp = 70,70,70,70
; textured_plate_temp_initial_layer = 70,70,70,70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 150
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
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = arachne
; wall_loops = 3
; wall_sequence = inner-outer-inner wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 214.804
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
M73 P0 R17
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
M1002 set_filament_type:PETG
M104 S140
M140 S70

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
M104 S230

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
    M109 S230

    M104 S250

    M400
    T0
    G1 X-48.2 F3000
    M400


    M620.1 E F449.008 T270
    M109 S250 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG
M621 S0A


    M109 S270 H300

G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S230
G92 E0
M73 P3 R16
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P4 R16
G1 X-48.2 F3000
M73 P6 R16
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

M1002 set_filament_type:PETG

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S240
    G1 E10 F92.5593
    M983 F1.54265 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P8 R15
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F1.54265 A0.3 H0.4; cali dynamic extrusion compensation
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
    
M73 P9 R15
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F1.54265 H0.4
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
M73 P34 R11
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
M109 S180

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
M73 P35 R11
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

M190 S70; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X74.6111 Y111.381 I40 J10
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

M104 S230 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S230

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

    M109 S230
    G0 X128 E8  F222.142
    G0 X133 E.3742  F370.237
    G0 X138 E.3742  F1480.95
    G0 X143 E.3742  F370.237
    G0 X148 E.3742  F1480.95
    G0 X153 E.3742  F370.237
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
    G0 X128 E10  F222.142
    G0 X133 E.3742  F370.237
    G0 X138 E.3742  F1480.95
    G0 X143 E.3742  F370.237
    G0 X148 E.3742  F1480.95
    G0 X153 E.3742  F370.237
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
M106 P3 S180


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/38
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 300
M73 P36 R11
G1 X105.85 Y120.142 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
M73 P36 R10
G1 F3000
M204 S500
G1 X105.85 Y112.62 E.26872
G1 X113.372 Y112.62 E.26872
G1 X113.372 Y116.381 E.13436
G1 X113.372 Y120.142 E.13436
G1 X105.91 Y120.142 E.26657
M204 S6000
G1 X105.393 Y120.599 F42000
G1 F3000
M204 S500
G1 X105.393 Y112.163 E.30137
G1 X113.829 Y112.163 E.30137
G1 X113.829 Y116.381 E.15069
M73 P37 R10
G1 X113.829 Y120.599 E.15069
G1 X105.453 Y120.599 E.29923
M204 S6000
G1 X104.936 Y121.056 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X104.936 Y111.706 E.33403
G1 X114.286 Y111.706 E.33403
G1 X114.286 Y116.381 E.16702
G1 X114.286 Y121.056 E.16702
G1 X104.996 Y121.056 E.33189
; WIPE_START
G1 X104.983 Y119.056 E-.76
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X112.253 Y112.803 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50588
G1 F6300
M204 S500
G1 X112.984 Y113.534 E.0374
M73 P38 R10
G1 X112.984 Y114.189 E.02369
G1 X111.804 Y113.009 E.06038
G1 X111.149 Y113.009 E.02369
G1 X112.984 Y114.843 E.09388
G1 X112.984 Y115.498 E.02369
G1 X110.494 Y113.009 E.12739
G1 X109.84 Y113.009 E.02369
G1 X112.984 Y116.153 E.16089
G1 X112.984 Y116.808 E.02369
G1 X109.185 Y113.009 E.1944
G1 X108.53 Y113.009 E.02369
G1 X112.984 Y117.462 E.2279
G1 X112.984 Y118.117 E.02369
G1 X107.875 Y113.009 E.26141
G1 X107.221 Y113.009 E.02369
G1 X112.984 Y118.772 E.29491
G1 X112.984 Y119.426 E.02369
G1 X106.566 Y113.009 E.32842
G1 X106.239 Y113.009 E.01184
G1 X106.239 Y113.336 E.01185
G1 X112.656 Y119.754 E.32841
G1 X112.001 Y119.754 E.02369
G1 X106.239 Y113.991 E.29491
G1 X106.239 Y114.646 E.02369
G1 X111.347 Y119.754 E.2614
G1 X110.692 Y119.754 E.02369
G1 X106.239 Y115.3 E.2279
G1 X106.239 Y115.955 E.02369
G1 X110.037 Y119.754 E.19439
G1 X109.383 Y119.754 E.02369
G1 X106.239 Y116.61 E.16089
G1 X106.239 Y117.265 E.02369
G1 X108.728 Y119.754 E.12738
G1 X108.073 Y119.754 E.02369
G1 X106.239 Y117.919 E.09388
G1 X106.239 Y118.574 E.02369
G1 X107.418 Y119.754 E.06037
G1 X106.764 Y119.754 E.02369
G1 X106.033 Y119.023 E.03739
; WIPE_START
G1 X106.764 Y119.754 E-.39267
G1 X107.418 Y119.754 E-.24879
G1 X107.198 Y119.533 E-.11854
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X99.583 Y120.059 Z.6 F42000
G1 X98.372 Y120.142 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
G1 F3000
M204 S500
G1 X90.85 Y120.142 E.26872
G1 X90.85 Y112.62 E.26872
G1 X98.372 Y112.62 E.26872
G1 X98.372 Y116.381 E.13436
G1 X98.372 Y120.082 E.13221
M204 S6000
G1 X98.829 Y120.599 F42000
G1 F3000
M204 S500
G1 X90.393 Y120.599 E.30137
G1 X90.393 Y112.163 E.30137
G1 X98.829 Y112.163 E.30137
G1 X98.829 Y116.381 E.15069
G1 X98.829 Y120.539 E.14854
M204 S6000
G1 X99.286 Y121.056 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X89.936 Y121.056 E.33403
G1 X89.936 Y111.706 E.33403
G1 X99.286 Y111.706 E.33403
G1 X99.286 Y116.381 E.16702
G1 X99.286 Y120.996 E.16487
; WIPE_START
G1 X97.286 Y121.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X97.255 Y113.377 Z.6 F42000
G1 X97.253 Y112.803 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50588
G1 F6300
M204 S500
G1 X97.984 Y113.534 E.0374
G1 X97.984 Y114.189 E.02369
G1 X96.804 Y113.009 E.06038
G1 X96.149 Y113.009 E.02369
G1 X97.984 Y114.843 E.09388
G1 X97.984 Y115.498 E.02369
G1 X95.494 Y113.009 E.12739
G1 X94.84 Y113.009 E.02369
G1 X97.984 Y116.153 E.16089
G1 X97.984 Y116.808 E.02369
G1 X94.185 Y113.009 E.1944
M73 P39 R10
G1 X93.53 Y113.009 E.02369
G1 X97.984 Y117.462 E.2279
G1 X97.984 Y118.117 E.02369
G1 X92.875 Y113.009 E.26141
G1 X92.221 Y113.009 E.02369
G1 X97.984 Y118.772 E.29491
G1 X97.984 Y119.426 E.02369
G1 X91.566 Y113.009 E.32842
G1 X91.239 Y113.009 E.01184
G1 X91.239 Y113.336 E.01185
G1 X97.656 Y119.754 E.32841
G1 X97.001 Y119.754 E.02369
G1 X91.239 Y113.991 E.29491
G1 X91.239 Y114.646 E.02369
G1 X96.347 Y119.754 E.2614
G1 X95.692 Y119.754 E.02369
G1 X91.239 Y115.3 E.2279
G1 X91.239 Y115.955 E.02369
G1 X95.037 Y119.754 E.19439
G1 X94.383 Y119.754 E.02369
G1 X91.239 Y116.61 E.16089
G1 X91.239 Y117.265 E.02369
G1 X93.728 Y119.754 E.12738
G1 X93.073 Y119.754 E.02369
G1 X91.239 Y117.919 E.09388
G1 X91.239 Y118.574 E.02369
G1 X92.418 Y119.754 E.06037
G1 X91.764 Y119.754 E.02369
G1 X91.033 Y119.023 E.03739
; WIPE_START
G1 X91.764 Y119.754 E-.39267
G1 X92.418 Y119.754 E-.24879
G1 X92.198 Y119.533 E-.11854
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X84.583 Y120.059 Z.6 F42000
G1 X83.372 Y120.142 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.49999
G1 F3000
M204 S500
G1 X75.85 Y120.142 E.26872
G1 X75.85 Y112.62 E.26872
G1 X83.372 Y112.62 E.26872
G1 X83.372 Y116.381 E.13436
G1 X83.372 Y120.082 E.13221
M204 S6000
G1 X83.829 Y120.599 F42000
G1 F3000
M204 S500
G1 X75.393 Y120.599 E.30137
G1 X75.393 Y112.163 E.30137
G1 X83.829 Y112.163 E.30137
G1 X83.829 Y116.381 E.15069
G1 X83.829 Y120.539 E.14854
M204 S6000
G1 X84.286 Y121.056 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X74.936 Y121.056 E.33403
G1 X74.936 Y111.706 E.33403
G1 X84.286 Y111.706 E.33403
G1 X84.286 Y116.381 E.16702
G1 X84.286 Y120.996 E.16487
; WIPE_START
G1 X82.286 Y121.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.255 Y113.377 Z.6 F42000
G1 X82.253 Y112.803 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50588
G1 F6300
M204 S500
G1 X82.984 Y113.534 E.0374
G1 X82.984 Y114.189 E.02369
G1 X81.804 Y113.009 E.06038
G1 X81.149 Y113.009 E.02369
G1 X82.984 Y114.843 E.09388
G1 X82.984 Y115.498 E.02369
G1 X80.494 Y113.009 E.12739
G1 X79.84 Y113.009 E.02369
G1 X82.984 Y116.153 E.16089
G1 X82.984 Y116.808 E.02369
G1 X79.185 Y113.009 E.1944
G1 X78.53 Y113.009 E.02369
G1 X82.984 Y117.462 E.2279
G1 X82.984 Y118.117 E.02369
G1 X77.875 Y113.009 E.26141
G1 X77.221 Y113.009 E.02369
G1 X82.984 Y118.772 E.29491
G1 X82.984 Y119.426 E.02369
G1 X76.566 Y113.009 E.32842
G1 X76.239 Y113.009 E.01184
G1 X76.239 Y113.336 E.01185
G1 X82.656 Y119.754 E.32841
G1 X82.001 Y119.754 E.02369
G1 X76.239 Y113.991 E.29491
G1 X76.239 Y114.646 E.02369
G1 X81.347 Y119.754 E.2614
G1 X80.692 Y119.754 E.02369
G1 X76.239 Y115.3 E.2279
G1 X76.239 Y115.955 E.02369
G1 X80.037 Y119.754 E.19439
G1 X79.383 Y119.754 E.02369
G1 X76.239 Y116.61 E.16089
G1 X76.239 Y117.265 E.02369
G1 X78.728 Y119.754 E.12738
G1 X78.073 Y119.754 E.02369
G1 X76.239 Y117.919 E.09388
G1 X76.239 Y118.574 E.02369
G1 X77.418 Y119.754 E.06037
G1 X76.764 Y119.754 E.02369
G1 X76.033 Y119.023 E.03739
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X76.764 Y119.754 E-.39267
M73 P40 R10
G1 X77.418 Y119.754 E-.24879
G1 X77.198 Y119.533 E-.11854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/38
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S240 ; set nozzle temperature
; OBJECT_ID: 300
M204 S10000
G17
G3 Z.6 I-.035 J1.216 P1  F42000
G1 X105.637 Y120.355 Z.6
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.76
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
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


G1 X105.802 Y113.354 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X106.411 Y112.746 E.02081
G1 X106.957 Y112.746 E.01322
G1 X105.976 Y113.728 E.03357
G1 X105.976 Y114.274 E.01322
G1 X107.504 Y112.746 E.05227
G1 X108.051 Y112.746 E.01322
G1 X105.976 Y114.821 E.07098
G1 X105.976 Y115.368 E.01322
G1 X108.598 Y112.746 E.08968
G1 X109.145 Y112.746 E.01322
G1 X105.976 Y115.915 E.10838
G1 X105.976 Y116.462 E.01322
G1 X109.692 Y112.746 E.12708
G1 X110.239 Y112.746 E.01322
G1 X105.976 Y117.009 E.14578
G1 X105.976 Y117.556 E.01322
G1 X110.786 Y112.746 E.16449
G1 X111.333 Y112.746 E.01322
G1 X105.976 Y118.103 E.18319
G1 X105.976 Y118.65 E.01322
G1 X111.879 Y112.746 E.20189
G1 X112.426 Y112.746 E.01322
G1 X105.976 Y119.196 E.22059
G1 X105.976 Y119.743 E.01322
G1 X112.973 Y112.746 E.23929
G1 X113.247 Y112.746 E.00661
G1 X113.247 Y113.019 E.00661
G1 X106.249 Y120.017 E.23929
G1 X106.796 Y120.017 E.01322
G1 X113.247 Y113.566 E.22059
G1 X113.247 Y114.113 E.01322
G1 X107.343 Y120.017 E.20188
G1 X107.89 Y120.017 E.01322
G1 X113.247 Y114.66 E.18318
G1 X113.247 Y115.207 E.01322
G1 X108.437 Y120.017 E.16448
G1 X108.984 Y120.017 E.01322
G1 X113.247 Y115.754 E.14578
G1 X113.247 Y116.301 E.01322
G1 X109.531 Y120.017 E.12708
G1 X110.077 Y120.017 E.01322
G1 X113.247 Y116.848 E.10838
G1 X113.247 Y117.394 E.01322
G1 X110.624 Y120.017 E.08967
G1 X111.171 Y120.017 E.01322
G1 X113.247 Y117.941 E.07097
G1 X113.247 Y118.488 E.01322
G1 X111.718 Y120.017 E.05227
G1 X112.265 Y120.017 E.01322
G1 X113.247 Y119.035 E.03357
G1 X113.247 Y119.582 E.01322
G1 X112.638 Y120.19 E.0208
; WIPE_START
G1 X113.247 Y119.582 E-.3269
G1 X113.247 Y119.035 E-.20782
G1 X112.827 Y119.454 E-.22528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.21 Y119.936 Z.76 F42000
G1 X98.585 Y120.355 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.638 Y120.19 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X98.247 Y119.582 E.0208
G1 X98.247 Y119.035 E.01322
G1 X97.265 Y120.017 E.03357
G1 X96.718 Y120.017 E.01322
G1 X98.247 Y118.488 E.05227
G1 X98.247 Y117.941 E.01322
G1 X96.171 Y120.017 E.07097
G1 X95.624 Y120.017 E.01322
G1 X98.247 Y117.394 E.08967
G1 X98.247 Y116.848 E.01322
G1 X95.077 Y120.017 E.10838
G1 X94.531 Y120.017 E.01322
G1 X98.247 Y116.301 E.12708
G1 X98.247 Y115.754 E.01322
G1 X93.984 Y120.017 E.14578
G1 X93.437 Y120.017 E.01322
G1 X98.247 Y115.207 E.16448
G1 X98.247 Y114.66 E.01322
G1 X92.89 Y120.017 E.18318
G1 X92.343 Y120.017 E.01322
G1 X98.247 Y114.113 E.20188
G1 X98.247 Y113.566 E.01322
G1 X91.796 Y120.017 E.22059
G1 X91.249 Y120.017 E.01322
G1 X98.247 Y113.019 E.23929
G1 X98.247 Y112.746 E.00661
M73 P41 R10
G1 X97.973 Y112.746 E.00661
G1 X90.976 Y119.743 E.23929
G1 X90.976 Y119.197 E.01322
G1 X97.426 Y112.746 E.22059
G1 X96.879 Y112.746 E.01322
G1 X90.976 Y118.65 E.20189
G1 X90.976 Y118.103 E.01322
G1 X96.333 Y112.746 E.18319
G1 X95.786 Y112.746 E.01322
G1 X90.976 Y117.556 E.16449
G1 X90.976 Y117.009 E.01322
G1 X95.239 Y112.746 E.14579
G1 X94.692 Y112.746 E.01322
G1 X90.976 Y116.462 E.12708
G1 X90.976 Y115.915 E.01322
G1 X94.145 Y112.746 E.10838
G1 X93.598 Y112.746 E.01322
G1 X90.976 Y115.368 E.08968
G1 X90.976 Y114.821 E.01322
G1 X93.051 Y112.746 E.07098
G1 X92.504 Y112.746 E.01322
G1 X90.976 Y114.274 E.05228
G1 X90.976 Y113.728 E.01322
G1 X91.957 Y112.746 E.03357
G1 X91.411 Y112.746 E.01322
G1 X90.802 Y113.354 E.02081
; WIPE_START
G1 X91.411 Y112.746 E-.327
G1 X91.957 Y112.746 E-.20782
G1 X91.538 Y113.165 E-.22518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.94 Y112.441 Z.76 F42000
G1 X83.585 Y112.408 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z.76 F42000
G1 Z.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.359 Y113.398 Z.76 F42000
G1 X75.802 Y113.354 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X76.411 Y112.746 E.02081
G1 X76.957 Y112.746 E.01322
G1 X75.976 Y113.728 E.03357
G1 X75.976 Y114.274 E.01322
G1 X77.504 Y112.746 E.05228
G1 X78.051 Y112.746 E.01322
G1 X75.976 Y114.821 E.07098
G1 X75.976 Y115.368 E.01322
G1 X78.598 Y112.746 E.08968
G1 X79.145 Y112.746 E.01322
G1 X75.976 Y115.915 E.10838
G1 X75.976 Y116.462 E.01322
G1 X79.692 Y112.746 E.12708
G1 X80.239 Y112.746 E.01322
G1 X75.976 Y117.009 E.14578
G1 X75.976 Y117.556 E.01322
G1 X80.786 Y112.746 E.16449
G1 X81.333 Y112.746 E.01322
G1 X75.976 Y118.103 E.18319
G1 X75.976 Y118.65 E.01322
G1 X81.879 Y112.746 E.20189
G1 X82.426 Y112.746 E.01322
G1 X75.976 Y119.196 E.22059
G1 X75.976 Y119.743 E.01322
G1 X82.973 Y112.746 E.23929
G1 X83.247 Y112.746 E.00661
G1 X83.247 Y113.019 E.00661
G1 X76.249 Y120.017 E.23929
G1 X76.796 Y120.017 E.01322
G1 X83.247 Y113.566 E.22059
G1 X83.247 Y114.113 E.01322
G1 X77.343 Y120.017 E.20188
G1 X77.89 Y120.017 E.01322
G1 X83.247 Y114.66 E.18318
G1 X83.247 Y115.207 E.01322
G1 X78.437 Y120.017 E.16448
G1 X78.984 Y120.017 E.01322
G1 X83.247 Y115.754 E.14578
G1 X83.247 Y116.301 E.01322
G1 X79.531 Y120.017 E.12708
G1 X80.077 Y120.017 E.01322
G1 X83.247 Y116.848 E.10838
G1 X83.247 Y117.394 E.01322
G1 X80.624 Y120.017 E.08967
G1 X81.171 Y120.017 E.01322
G1 X83.247 Y117.941 E.07097
G1 X83.247 Y118.488 E.01322
G1 X81.718 Y120.017 E.05227
G1 X82.265 Y120.017 E.01322
G1 X83.247 Y119.035 E.03357
G1 X83.247 Y119.582 E.01322
G1 X82.638 Y120.19 E.0208
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.247 Y119.582 E-.3269
G1 X83.247 Y119.035 E-.20782
G1 X82.827 Y119.454 E-.22528
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/38
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z.76 I-.048 J1.216 P1  F42000
G1 X105.637 Y120.355 Z.76
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.92
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
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


G1 Z0.920
G1 X106.584 Y120.19 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X105.976 Y119.582 E.02081
G1 X105.976 Y119.035 E.01322
G1 X106.957 Y120.017 E.03357
G1 X107.504 Y120.017 E.01322
G1 X105.976 Y118.488 E.05227
G1 X105.976 Y117.941 E.01322
G1 X108.051 Y120.017 E.07098
G1 X108.598 Y120.017 E.01322
G1 X105.976 Y117.394 E.08968
G1 X105.976 Y116.847 E.01322
G1 X109.145 Y120.017 E.10838
G1 X109.692 Y120.017 E.01322
G1 X105.976 Y116.301 E.12708
G1 X105.976 Y115.754 E.01322
G1 X110.239 Y120.017 E.14578
G1 X110.786 Y120.017 E.01322
G1 X105.976 Y115.207 E.16449
G1 X105.976 Y114.66 E.01322
G1 X111.333 Y120.017 E.18319
G1 X111.879 Y120.017 E.01322
G1 X105.976 Y114.113 E.20189
G1 X105.976 Y113.566 E.01322
M73 P42 R10
G1 X112.426 Y120.017 E.22059
G1 X112.973 Y120.017 E.01322
G1 X105.976 Y113.019 E.23929
G1 X105.976 Y112.746 E.00661
G1 X106.249 Y112.746 E.00661
G1 X113.247 Y119.743 E.23929
G1 X113.247 Y119.196 E.01322
G1 X106.796 Y112.746 E.22059
G1 X107.343 Y112.746 E.01322
G1 X113.247 Y118.649 E.20188
G1 X113.247 Y118.103 E.01322
G1 X107.89 Y112.746 E.18318
G1 X108.437 Y112.746 E.01322
G1 X113.247 Y117.556 E.16448
G1 X113.247 Y117.009 E.01322
G1 X108.984 Y112.746 E.14578
G1 X109.531 Y112.746 E.01322
G1 X113.247 Y116.462 E.12708
G1 X113.247 Y115.915 E.01322
G1 X110.077 Y112.746 E.10838
G1 X110.624 Y112.746 E.01322
G1 X113.247 Y115.368 E.08967
G1 X113.247 Y114.821 E.01322
G1 X111.171 Y112.746 E.07097
G1 X111.718 Y112.746 E.01322
G1 X113.247 Y114.274 E.05227
G1 X113.247 Y113.727 E.01322
G1 X112.265 Y112.746 E.03357
G1 X112.812 Y112.746 E.01322
G1 X113.42 Y113.354 E.0208
; WIPE_START
G1 X112.812 Y112.746 E-.3269
G1 X112.265 Y112.746 E-.20782
G1 X112.684 Y113.165 E-.22528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.063 Y112.756 Z.92 F42000
G1 X98.585 Y112.408 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.355 E.10328
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
M73 P42 R9
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.171 E.11551
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y116.381 E.11408
G1 X99 Y120.771 E.11408
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X98.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.42 Y113.354 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X97.812 Y112.746 E.0208
G1 X97.265 Y112.746 E.01322
G1 X98.247 Y113.727 E.03357
G1 X98.247 Y114.274 E.01322
G1 X96.718 Y112.746 E.05227
G1 X96.171 Y112.746 E.01322
G1 X98.247 Y114.821 E.07097
G1 X98.247 Y115.368 E.01322
G1 X95.624 Y112.746 E.08967
G1 X95.077 Y112.746 E.01322
G1 X98.247 Y115.915 E.10838
G1 X98.247 Y116.462 E.01322
G1 X94.531 Y112.746 E.12708
G1 X93.984 Y112.746 E.01322
G1 X98.247 Y117.009 E.14578
G1 X98.247 Y117.556 E.01322
G1 X93.437 Y112.746 E.16448
G1 X92.89 Y112.746 E.01322
G1 X98.247 Y118.103 E.18318
G1 X98.247 Y118.649 E.01322
G1 X92.343 Y112.746 E.20188
G1 X91.796 Y112.746 E.01322
G1 X98.247 Y119.196 E.22059
G1 X98.247 Y119.743 E.01322
G1 X91.249 Y112.746 E.23929
G1 X90.976 Y112.746 E.00661
G1 X90.976 Y113.019 E.00661
G1 X97.973 Y120.017 E.23929
G1 X97.426 Y120.017 E.01322
G1 X90.976 Y113.566 E.22059
G1 X90.976 Y114.113 E.01322
G1 X96.879 Y120.017 E.20189
G1 X96.333 Y120.017 E.01322
G1 X90.976 Y114.66 E.18319
G1 X90.976 Y115.207 E.01322
G1 X95.786 Y120.017 E.16449
G1 X95.239 Y120.017 E.01322
G1 X90.976 Y115.754 E.14579
G1 X90.976 Y116.3 E.01322
G1 X94.692 Y120.017 E.12708
G1 X94.145 Y120.017 E.01322
G1 X90.976 Y116.847 E.10838
G1 X90.976 Y117.394 E.01322
G1 X93.598 Y120.017 E.08968
G1 X93.051 Y120.017 E.01322
G1 X90.976 Y117.941 E.07098
G1 X90.976 Y118.488 E.01322
G1 X92.504 Y120.017 E.05228
G1 X91.957 Y120.017 E.01322
G1 X90.976 Y119.035 E.03357
G1 X90.976 Y119.582 E.01322
G1 X91.584 Y120.19 E.02081
; WIPE_START
G1 X90.976 Y119.582 E-.327
G1 X90.976 Y119.035 E-.20782
G1 X91.395 Y119.454 E-.22518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.813 Y120.329 Z.92 F42000
G1 X83.585 Y120.355 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.295 E.10172
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.111 E.11406
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y116.381 E.11408
G1 X84 Y120.711 E.11252
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.42 Y113.354 Z.92 F42000
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X82.812 Y112.746 E.0208
G1 X82.265 Y112.746 E.01322
G1 X83.247 Y113.727 E.03357
G1 X83.247 Y114.274 E.01322
G1 X81.718 Y112.746 E.05227
G1 X81.171 Y112.746 E.01322
G1 X83.247 Y114.821 E.07097
G1 X83.247 Y115.368 E.01322
G1 X80.624 Y112.746 E.08967
G1 X80.077 Y112.746 E.01322
G1 X83.247 Y115.915 E.10838
G1 X83.247 Y116.462 E.01322
G1 X79.531 Y112.746 E.12708
G1 X78.984 Y112.746 E.01322
G1 X83.247 Y117.009 E.14578
G1 X83.247 Y117.556 E.01322
G1 X78.437 Y112.746 E.16448
G1 X77.89 Y112.746 E.01322
G1 X83.247 Y118.103 E.18318
G1 X83.247 Y118.649 E.01322
G1 X77.343 Y112.746 E.20188
G1 X76.796 Y112.746 E.01322
G1 X83.247 Y119.196 E.22059
G1 X83.247 Y119.743 E.01322
G1 X76.249 Y112.746 E.23929
G1 X75.976 Y112.746 E.00661
G1 X75.976 Y113.019 E.00661
G1 X82.973 Y120.017 E.23929
G1 X82.426 Y120.017 E.01322
G1 X75.976 Y113.566 E.22059
G1 X75.976 Y114.113 E.01322
G1 X81.879 Y120.017 E.20189
G1 X81.333 Y120.017 E.01322
G1 X75.976 Y114.66 E.18319
G1 X75.976 Y115.207 E.01322
G1 X80.786 Y120.017 E.16449
G1 X80.239 Y120.017 E.01322
G1 X75.976 Y115.754 E.14578
G1 X75.976 Y116.301 E.01322
G1 X79.692 Y120.017 E.12708
G1 X79.145 Y120.017 E.01322
G1 X75.976 Y116.847 E.10838
G1 X75.976 Y117.394 E.01322
G1 X78.598 Y120.017 E.08968
G1 X78.051 Y120.017 E.01322
G1 X75.976 Y117.941 E.07098
M73 P43 R9
G1 X75.976 Y118.488 E.01322
G1 X77.504 Y120.017 E.05227
G1 X76.957 Y120.017 E.01322
G1 X75.976 Y119.035 E.03357
G1 X75.976 Y119.582 E.01322
G1 X76.584 Y120.19 E.02081
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.976 Y119.582 E-.32698
G1 X75.976 Y119.035 E-.20782
G1 X76.395 Y119.454 E-.22521
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/38
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S122.4
; OBJECT_ID: 300
M204 S10000
G17
G3 Z.92 I-.037 J1.216 P1  F42000
G1 X105.637 Y120.355 Z.92
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.08
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.08 F4000
            G39.3 S1
            G0 Z1.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.802 Y113.354 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X106.411 Y112.746 E.02081
G1 X106.957 Y112.746 E.01322
G1 X105.976 Y113.728 E.03357
G1 X105.976 Y114.274 E.01322
G1 X107.504 Y112.746 E.05227
G1 X108.051 Y112.746 E.01322
G1 X105.976 Y114.821 E.07098
G1 X105.976 Y115.368 E.01322
G1 X108.598 Y112.746 E.08968
G1 X109.145 Y112.746 E.01322
G1 X105.976 Y115.915 E.10838
G1 X105.976 Y116.462 E.01322
G1 X109.692 Y112.746 E.12708
G1 X110.239 Y112.746 E.01322
G1 X105.976 Y117.009 E.14578
G1 X105.976 Y117.556 E.01322
G1 X110.786 Y112.746 E.16449
G1 X111.333 Y112.746 E.01322
G1 X105.976 Y118.103 E.18319
G1 X105.976 Y118.65 E.01322
G1 X111.879 Y112.746 E.20189
G1 X112.426 Y112.746 E.01322
G1 X105.976 Y119.196 E.22059
G1 X105.976 Y119.743 E.01322
G1 X112.973 Y112.746 E.23929
G1 X113.247 Y112.746 E.00661
G1 X113.247 Y113.019 E.00661
G1 X106.249 Y120.017 E.23929
G1 X106.796 Y120.017 E.01322
G1 X113.247 Y113.566 E.22059
G1 X113.247 Y114.113 E.01322
G1 X107.343 Y120.017 E.20188
G1 X107.89 Y120.017 E.01322
G1 X113.247 Y114.66 E.18318
G1 X113.247 Y115.207 E.01322
G1 X108.437 Y120.017 E.16448
G1 X108.984 Y120.017 E.01322
G1 X113.247 Y115.754 E.14578
G1 X113.247 Y116.301 E.01322
G1 X109.531 Y120.017 E.12708
G1 X110.077 Y120.017 E.01322
G1 X113.247 Y116.848 E.10838
G1 X113.247 Y117.394 E.01322
G1 X110.624 Y120.017 E.08967
G1 X111.171 Y120.017 E.01322
G1 X113.247 Y117.941 E.07097
G1 X113.247 Y118.488 E.01322
G1 X111.718 Y120.017 E.05227
G1 X112.265 Y120.017 E.01322
G1 X113.247 Y119.035 E.03357
G1 X113.247 Y119.582 E.01322
G1 X112.638 Y120.19 E.0208
; WIPE_START
G1 X113.247 Y119.582 E-.3269
G1 X113.247 Y119.035 E-.20782
G1 X112.827 Y119.454 E-.22528
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.21 Y119.936 Z1.08 F42000
G1 X98.585 Y120.355 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.638 Y120.19 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X98.247 Y119.582 E.0208
G1 X98.247 Y119.035 E.01322
G1 X97.265 Y120.017 E.03357
G1 X96.718 Y120.017 E.01322
G1 X98.247 Y118.488 E.05227
G1 X98.247 Y117.941 E.01322
G1 X96.171 Y120.017 E.07097
G1 X95.624 Y120.017 E.01322
G1 X98.247 Y117.394 E.08967
G1 X98.247 Y116.848 E.01322
G1 X95.077 Y120.017 E.10838
G1 X94.531 Y120.017 E.01322
G1 X98.247 Y116.301 E.12708
G1 X98.247 Y115.754 E.01322
G1 X93.984 Y120.017 E.14578
G1 X93.437 Y120.017 E.01322
G1 X98.247 Y115.207 E.16448
G1 X98.247 Y114.66 E.01322
G1 X92.89 Y120.017 E.18318
G1 X92.343 Y120.017 E.01322
G1 X98.247 Y114.113 E.20188
G1 X98.247 Y113.566 E.01322
G1 X91.796 Y120.017 E.22059
G1 X91.249 Y120.017 E.01322
G1 X98.247 Y113.019 E.23929
G1 X98.247 Y112.746 E.00661
G1 X97.973 Y112.746 E.00661
G1 X90.976 Y119.743 E.23929
G1 X90.976 Y119.197 E.01322
G1 X97.426 Y112.746 E.22059
G1 X96.879 Y112.746 E.01322
G1 X90.976 Y118.65 E.20189
G1 X90.976 Y118.103 E.01322
G1 X96.333 Y112.746 E.18319
G1 X95.786 Y112.746 E.01322
G1 X90.976 Y117.556 E.16449
G1 X90.976 Y117.009 E.01322
G1 X95.239 Y112.746 E.14579
G1 X94.692 Y112.746 E.01322
G1 X90.976 Y116.462 E.12708
G1 X90.976 Y115.915 E.01322
G1 X94.145 Y112.746 E.10838
G1 X93.598 Y112.746 E.01322
G1 X90.976 Y115.368 E.08968
G1 X90.976 Y114.821 E.01322
G1 X93.051 Y112.746 E.07098
G1 X92.504 Y112.746 E.01322
G1 X90.976 Y114.274 E.05228
G1 X90.976 Y113.728 E.01322
G1 X91.957 Y112.746 E.03357
G1 X91.411 Y112.746 E.01322
M73 P44 R9
G1 X90.802 Y113.354 E.02081
; WIPE_START
G1 X91.411 Y112.746 E-.327
G1 X91.957 Y112.746 E-.20782
G1 X91.538 Y113.165 E-.22518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.94 Y112.441 Z1.08 F42000
G1 X83.585 Y112.408 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z1.08 F42000
G1 Z.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.359 Y113.398 Z1.08 F42000
G1 X75.802 Y113.354 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421046
G1 F12000
M204 S4000
G1 X76.411 Y112.746 E.02081
G1 X76.957 Y112.746 E.01322
G1 X75.976 Y113.728 E.03357
G1 X75.976 Y114.274 E.01322
G1 X77.504 Y112.746 E.05228
G1 X78.051 Y112.746 E.01322
G1 X75.976 Y114.821 E.07098
G1 X75.976 Y115.368 E.01322
G1 X78.598 Y112.746 E.08968
G1 X79.145 Y112.746 E.01322
G1 X75.976 Y115.915 E.10838
G1 X75.976 Y116.462 E.01322
G1 X79.692 Y112.746 E.12708
G1 X80.239 Y112.746 E.01322
G1 X75.976 Y117.009 E.14578
G1 X75.976 Y117.556 E.01322
G1 X80.786 Y112.746 E.16449
G1 X81.333 Y112.746 E.01322
G1 X75.976 Y118.103 E.18319
G1 X75.976 Y118.65 E.01322
G1 X81.879 Y112.746 E.20189
G1 X82.426 Y112.746 E.01322
G1 X75.976 Y119.196 E.22059
G1 X75.976 Y119.743 E.01322
G1 X82.973 Y112.746 E.23929
G1 X83.247 Y112.746 E.00661
G1 X83.247 Y113.019 E.00661
G1 X76.249 Y120.017 E.23929
G1 X76.796 Y120.017 E.01322
G1 X83.247 Y113.566 E.22059
G1 X83.247 Y114.113 E.01322
G1 X77.343 Y120.017 E.20188
G1 X77.89 Y120.017 E.01322
G1 X83.247 Y114.66 E.18318
G1 X83.247 Y115.207 E.01322
G1 X78.437 Y120.017 E.16448
G1 X78.984 Y120.017 E.01322
G1 X83.247 Y115.754 E.14578
G1 X83.247 Y116.301 E.01322
G1 X79.531 Y120.017 E.12708
G1 X80.077 Y120.017 E.01322
G1 X83.247 Y116.848 E.10838
G1 X83.247 Y117.394 E.01322
G1 X80.624 Y120.017 E.08967
G1 X81.171 Y120.017 E.01322
G1 X83.247 Y117.941 E.07097
G1 X83.247 Y118.488 E.01322
G1 X81.718 Y120.017 E.05227
G1 X82.265 Y120.017 E.01322
G1 X83.247 Y119.035 E.03357
G1 X83.247 Y119.582 E.01322
G1 X82.638 Y120.19 E.0208
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.247 Y119.582 E-.3269
G1 X83.247 Y119.035 E-.20782
G1 X82.827 Y119.454 E-.22528
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/38
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S124.95
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.08 I-.048 J1.216 P1  F42000
G1 X105.637 Y120.355 Z1.08
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 F9000
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 F9000
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.24
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.24 F4000
            G39.3 S1
            G0 Z1.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y118.36 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6328
M204 S4000
G1 X105.991 Y116.697 E.04321
G1 X106.62 Y116.381 E.0183
G2 X106.733 Y115.489 I-.585 J-.527 E.02487
G2 X105.991 Y114.06 I-3.474 J.896 E.04221
G1 X105.991 Y112.761 E.03377
G1 X106.354 Y112.761 E.00944
; WIPE_START
G1 F12000
G1 X105.991 Y112.761 E-.13804
G1 X105.991 Y114.06 E-.49376
G1 X106.187 Y114.334 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.979 Y112.761 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F6328
M204 S4000
G1 X113.232 Y112.761 E.00657
G1 X113.219 Y114.151 E.03614
G2 X111.145 Y112.813 I-4.423 J4.578 E.06454
G1 X111.122 Y112.761 E.0015
G1 X110.083 Y112.761 E.027
G1 X110.188 Y112.813 E.00304
G1 X110.386 Y113.259 E.01269
G3 X109.651 Y115.043 I-4.802 J-.935 E.05048
G3 X107.578 Y116.381 I-4.422 J-4.578 E.06454
G1 X107.379 Y116.827 E.01269
G2 X108.114 Y118.611 I4.801 J-.935 E.05048
G2 X110.188 Y119.949 I4.422 J-4.578 E.06454
G1 X110.211 Y120.002 E.0015
G1 X111.25 Y120.002 E.027
G1 X111.145 Y119.949 E.00304
G1 X110.947 Y119.503 E.01269
G3 X111.682 Y117.719 I4.801 J.935 E.05048
G3 X113.232 Y116.645 I3.759 J3.766 E.04927
G1 X113.232 Y118.307 E.04321
; WIPE_START
G1 F12000
G1 X113.232 Y116.645 E-.63181
G1 X112.939 Y116.812 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.529 Y118.641 Z1.24 F42000
G1 X98.585 Y120.355 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 F9000
G1 X96.585 Y120.31 E-.76
; WIPE_END
M73 P45 R9
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 F9000
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y118.712 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6328
M204 S4000
G1 X98.232 Y117.049 E.04321
G2 X96.676 Y119.503 I1.812 J2.869 E.07805
G1 X96.874 Y119.949 E.01269
G1 X96.979 Y120.002 E.00304
G1 X95.94 Y120.002 E.027
G1 X95.916 Y119.949 E.0015
G3 X93.843 Y118.611 I2.349 J-5.916 E.06454
G3 X93.108 Y116.827 I4.067 J-2.719 E.05048
G1 X93.306 Y116.381 E.01269
G2 X95.379 Y115.043 I-2.349 J-5.916 E.06454
G2 X96.115 Y113.259 I-4.067 J-2.719 E.05048
G1 X95.916 Y112.813 E.01269
G1 X95.812 Y112.761 E.00305
G1 X96.851 Y112.761 E.027
G1 X96.874 Y112.813 E.0015
G3 X98.232 Y113.545 I-3.877 J8.82 E.04013
G1 X98.232 Y115.208 E.04321
; WIPE_START
G1 F12000
G1 X98.232 Y113.545 E-.63181
G1 X97.935 Y113.385 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.933 Y112.761 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F6328
M204 S4000
G1 X90.991 Y112.761 E.02449
G1 X90.991 Y113.481 E.01872
G3 X92.461 Y115.489 I-1.612 J2.723 E.06649
G3 X92.348 Y116.381 I-.697 J.365 E.02487
G2 X90.991 Y117.113 I3.876 J8.819 E.04013
G1 X90.991 Y118.776 E.04321
; WIPE_START
G1 F12000
G1 X90.991 Y117.113 E-.63181
G1 X91.288 Y116.953 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.306 Y120.037 Z1.24 F42000
G1 X83.585 Y120.355 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.295 E.10172
; WIPE_START
G1 F9000
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.111 E.11406
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F6328
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y116.381 E.11408
G1 X84 Y120.711 E.11252
; WIPE_START
G1 F9000
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.232 Y115.913 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6328
M204 S4000
G1 X83.232 Y117.575 E.04321
G2 X82.404 Y119.503 I3.01 J2.433 E.05522
G1 X82.602 Y119.949 E.01269
G1 X82.699 Y120.002 E.00287
G1 X81.668 Y120.002 E.0268
G1 X81.645 Y119.949 E.0015
G3 X79.571 Y118.611 I2.349 J-5.916 E.06454
G3 X78.836 Y116.827 I4.067 J-2.719 E.05048
G1 X79.035 Y116.381 E.01269
G2 X81.108 Y115.043 I-2.349 J-5.916 E.06454
G2 X81.843 Y113.259 I-4.066 J-2.719 E.05048
G1 X81.645 Y112.813 E.01269
G1 X81.54 Y112.761 E.00304
G1 X82.579 Y112.761 E.027
G1 X83.232 Y113.154 E.01981
G1 X83.232 Y114.817 E.04321
; WIPE_START
G1 F12000
G1 X83.232 Y113.154 E-.63181
G1 X82.943 Y112.98 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.337 Y112.761 Z1.24 F42000
G1 Z.84
G1 E.8 F1800
G1 F6328
M204 S4000
G1 X75.991 Y112.761 E.035
G1 X75.991 Y113.077 E.00821
G3 X78.19 Y115.489 I-1.173 J3.278 E.0883
G3 X78.077 Y116.381 I-.697 J.365 E.02487
G1 X77.189 Y116.827 E.02581
G2 X75.991 Y117.739 I1.84 J3.664 E.03937
G1 X75.991 Y119.401 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y117.739 E-.63181
G1 X76.229 Y117.5 E-.1282
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/38
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.24 I-.118 J1.211 P1  F42000
G1 X105.637 Y120.355 Z1.24
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 F9000
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 F9000
G1 X105.268 Y118.771 E-.76
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X107.604 Y116.381 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F8551
M204 S4000
G1 X107.604 Y116.952 E.01377
G2 X108.741 Y116.964 I.86 J-28.171 E.02743
G1 X108.877 Y117.02 E.00356
G1 X109.008 Y117.165 E.00471
G3 X109.029 Y118.377 I-19.079 J.927 E.02923
G2 X110.182 Y118.389 I.868 J-28.568 E.02782
G2 X110.194 Y117.251 I-28.171 J-.86 E.02743
G1 X110.25 Y117.115 E.00356
G1 X110.395 Y116.984 E.00471
G3 X111.607 Y116.964 I.927 J19.07 E.02923
G2 X111.619 Y115.819 I-28.363 J-.864 E.02762
G2 X110.481 Y115.799 I-.86 J16.508 E.02744
G1 X110.345 Y115.742 E.00356
G1 X110.214 Y115.597 E.00471
G3 X110.194 Y114.385 I19.07 J-.927 E.02923
G2 X109.04 Y114.374 I-.868 J28.568 E.02782
G2 X109.029 Y115.511 I28.171 J.86 E.02743
G1 X108.972 Y115.647 E.00356
G1 X108.827 Y115.778 E.00471
G3 X107.615 Y115.799 I-.927 J-19.079 E.02923
G1 X107.605 Y116.321 E.01261
; WIPE_START
G1 F9600
G1 X107.615 Y115.799 E-.19865
G1 X108.827 Y115.778 E-.4606
G1 X108.972 Y115.647 E-.07417
G1 X108.999 Y115.583 E-.02658
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.231 Y116.186 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.423178
G1 F8551
M204 S4000
G1 X110.481 Y116.186 E.01823
G1 X110.222 Y116.124 E.00648
G1 X109.978 Y115.92 E.00774
G1 X109.869 Y115.77 E.00451
G1 X109.806 Y115.511 E.00648
G1 X109.806 Y114.761 E.01823
G1 X109.416 Y114.761 E.00948
G1 X109.416 Y115.511 E.01823
G1 X109.354 Y115.77 E.00648
G1 X109.15 Y116.015 E.00774
G1 X109 Y116.123 E.00451
G1 X108.741 Y116.186 E.00648
G1 X107.991 Y116.186 E.01823
G1 X107.991 Y116.576 E.00948
G1 X108.741 Y116.576 E.01823
G1 X109 Y116.639 E.00648
G1 X109.245 Y116.842 E.00774
G1 X109.353 Y116.993 E.00451
G1 X109.416 Y117.251 E.00648
G1 X109.416 Y118.001 E.01823
G1 X109.806 Y118.001 E.00948
G1 X109.806 Y117.251 E.01823
G1 X109.869 Y116.993 E.00648
G1 X110.072 Y116.748 E.00774
G1 X110.222 Y116.639 E.00451
G1 X110.481 Y116.576 E.00648
G1 X111.231 Y116.576 E.01823
G1 X111.231 Y116.246 E.00802
; WIPE_START
G1 F9600
G1 X111.231 Y116.576 E-.12532
G1 X110.481 Y116.576 E-.2849
G1 X110.222 Y116.639 E-.10126
G1 X110.072 Y116.748 E-.07047
G1 X109.869 Y116.993 E-.12095
G1 X109.834 Y117.139 E-.05711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.924 Y116.381 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.426636
G1 F8551
M204 S4000
G3 X109.611 Y116.068 I.463 J-.775 E.01096
G3 X109.298 Y116.381 I-.775 J-.463 E.01096
G3 X109.611 Y116.694 I-.463 J.775 E.01096
G1 X109.797 Y116.473 E.0071
M73 P46 R9
G1 X109.875 Y116.416 E.00236
; WIPE_START
G1 F9600
G1 X109.797 Y116.473 E-.04247
G1 X109.611 Y116.694 E-.12766
G1 X109.52 Y116.567 E-.06896
G1 X109.298 Y116.381 E-.12766
G1 X109.425 Y116.29 E-.06896
G1 X109.611 Y116.068 E-.12766
G1 X109.702 Y116.195 E-.06896
G1 X109.924 Y116.381 E-.12766
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.767 Y115.398 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8551
M204 S4000
G1 X110.594 Y115.398 E.0045
G1 X110.594 Y114.219 E.03063
G1 X110.374 Y114 E.00808
G3 X111.113 Y113.22 I1.09 J.293 E.02909
G1 X111.559 Y113.249 E.01162
G3 X113.232 Y114.154 I-.605 J3.117 E.0502
G1 X113.232 Y116.856 E.07022
G2 X111.113 Y118.497 I.611 J2.978 E.07213
G1 X110.667 Y119.269 E.02318
G1 X110.221 Y119.543 E.01361
G1 X109.775 Y119.513 E.01162
G3 X107.545 Y117.834 I.57 J-3.077 E.07521
G1 X107.099 Y117.062 E.02318
G1 X106.653 Y116.788 E.01361
G2 X105.991 Y116.892 I-.141 J1.256 E.01763
G1 X105.991 Y114.054 E.07377
G3 X107.099 Y115.701 I-5.349 J4.795 E.05175
G1 X107.203 Y115.765 E.00318
G1 X107.203 Y115.644 E.00313
G1 X107.449 Y115.398 E.00906
G1 X108.628 Y115.383 E.03064
; WIPE_START
G1 F12000
G1 X107.449 Y115.398 E-.44791
G1 X107.203 Y115.644 E-.13242
G1 X107.203 Y115.765 E-.04576
G1 X107.099 Y115.701 E-.0465
G1 X106.978 Y115.505 E-.08742
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.817 Y112.862 Z1.4 F42000
G1 X98.585 Y112.408 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.355 E.10328
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 F9000
G1 X98.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.171 E.11551
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X99 Y116.381 E.11408
G1 X99 Y120.771 E.11408
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 F9000
G1 X98.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.645 Y115.423 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8551
M204 S4000
G1 X95.569 Y115.423 E.02795
G1 X95.569 Y114.836 E.01527
G2 X96.395 Y113.494 I-10.011 J-7.086 E.04098
G1 X96.841 Y113.22 E.01361
G1 X97.287 Y113.249 E.01162
G1 X98.232 Y113.592 E.02611
G1 X98.232 Y117.109 E.09142
G2 X96.841 Y118.497 I1.315 J2.708 E.05201
G1 X96.395 Y119.269 E.02318
G1 X95.949 Y119.543 E.01361
G1 X95.503 Y119.513 E.01162
G3 X94.02 Y118.789 I.612 J-3.135 E.04339
G1 X93.899 Y118.789 E.00314
G1 X93.653 Y118.543 E.00906
G1 X93.653 Y118.403 E.00363
G3 X92.988 Y117.339 I7.934 J-5.701 E.03264
G1 X92.449 Y117.339 E.01399
G3 X92.203 Y116.799 I.147 J-.393 E.01714
G1 X91.935 Y116.817 E.00697
G1 X90.991 Y117.16 E.02611
G1 X90.991 Y113.541 E.09405
G3 X92.381 Y114.929 I-1.315 J2.708 E.05201
G1 X92.667 Y115.423 E.01484
G1 X93.653 Y115.423 E.02563
G1 X93.653 Y114.747 E.01758
; WIPE_START
G1 F12000
G1 X93.653 Y115.423 E-.25707
G1 X92.667 Y115.423 E-.37474
G1 X92.498 Y115.131 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.061 Y115.824 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419995
G1 F8551
M204 S4000
G1 X95.456 Y115.824 E.01459
G1 X95.32 Y115.767 E.00356
G1 X95.189 Y115.622 E.00471
G3 X95.169 Y114.385 I20.982 J-.964 E.02984
G2 X94.065 Y114.374 I-.831 J26.157 E.02661
G2 X94.054 Y115.536 I27.555 J.86 E.02804
G1 X93.997 Y115.672 E.00356
G1 X93.852 Y115.803 E.00471
G3 X92.615 Y115.824 I-.964 J-20.982 E.02984
G2 X92.604 Y116.927 I26.157 J.831 E.02661
G2 X93.766 Y116.939 I.86 J-27.555 E.02804
G1 X93.902 Y116.995 E.00356
G1 X94.033 Y117.14 E.00471
G3 X94.054 Y118.377 I-20.982 J.964 E.02984
G2 X95.157 Y118.389 I.831 J-26.157 E.02661
G2 X95.169 Y117.226 I-27.555 J-.86 E.02804
G1 X95.225 Y117.09 E.00356
G1 X95.37 Y116.959 E.00471
G3 X96.607 Y116.939 I.964 J20.982 E.02984
G2 X96.619 Y115.844 I-25.96 J-.826 E.02641
G1 X96.121 Y115.826 E.01201
; WIPE_START
G1 F9600
G1 X96.619 Y115.844 E-.18924
G1 X96.607 Y116.939 E-.4162
G1 X96.2 Y116.946 E-.15456
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.846 Y115.794 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.403985
G1 F8551
M204 S4000
G1 X94.794 Y115.536 E.00608
G1 X94.794 Y114.749 E.0182
G1 X94.429 Y114.749 E.00843
G1 X94.429 Y115.536 E.0182
G1 X94.376 Y115.794 E.00608
G1 X94.175 Y116.04 E.00735
G1 X94.024 Y116.148 E.00428
G1 X93.766 Y116.199 E.00609
G1 X92.979 Y116.199 E.0182
G1 X92.979 Y116.564 E.00843
G1 X93.766 Y116.564 E.0182
G1 X94.024 Y116.615 E.00609
G1 X94.27 Y116.817 E.00735
G1 X94.378 Y116.968 E.00428
G1 X94.429 Y117.226 E.00609
G1 X94.429 Y118.014 E.0182
G1 X94.794 Y118.014 E.00843
G1 X94.794 Y117.226 E.0182
G1 X94.845 Y116.968 E.00609
G1 X95.047 Y116.723 E.00735
G1 X95.199 Y116.616 E.00428
G1 X95.456 Y116.564 E.00608
G1 X96.244 Y116.564 E.0182
G1 X96.244 Y116.199 E.00843
G1 X95.456 Y116.199 E.0182
G1 X95.199 Y116.146 E.00608
G1 X94.953 Y115.945 E.00735
G1 X94.881 Y115.843 E.00289
M204 S10000
G1 X94.894 Y116.381 F42000
; LINE_WIDTH: 0.391286
G1 F8551
M204 S4000
G3 X94.611 Y116.098 I.433 J-.716 E.00902
G3 X94.328 Y116.381 I-.716 J-.433 E.00902
G3 X94.611 Y116.664 I-.433 J.716 E.00902
G1 X94.785 Y116.46 E.00598
G1 X94.845 Y116.416 E.00167
; WIPE_START
G1 F9600
G1 X94.785 Y116.46 E-.03667
G1 X94.611 Y116.664 E-.13128
G1 X94.532 Y116.555 E-.06607
G1 X94.328 Y116.381 E-.13128
G1 X94.438 Y116.302 E-.06607
G1 X94.611 Y116.098 E-.13128
G1 X94.69 Y116.208 E-.06607
G1 X94.894 Y116.381 E-.13128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X87.693 Y118.911 Z1.4 F42000
G1 X83.585 Y120.355 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.295 E.10172
; WIPE_START
G1 F9000
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.111 E.11406
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F8551
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y116.381 E.11408
G1 X84 Y120.711 E.11252
; WIPE_START
G1 F9000
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.544 Y117.778 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8551
M204 S4000
G1 X80.544 Y118.543 E.01988
G1 X80.298 Y118.789 E.00906
G1 X79.749 Y118.789 E.01428
G2 X81.232 Y119.513 I2.095 J-2.411 E.04339
G1 X81.678 Y119.543 E.01162
G1 X82.124 Y119.269 E.01361
G3 X83.231 Y117.622 I6.457 J3.148 E.05175
G1 X83.231 Y113.324 E.1117
G2 X82.57 Y113.22 I-.521 J1.151 E.01763
G1 X82.124 Y113.494 E.01361
G3 X80.786 Y115.36 I-5.842 J-2.776 E.06
G3 X80.544 Y115.448 I-.192 J-.151 E.00703
G1 X80.544 Y114.219 E.03193
G1 X80.307 Y113.982 E.00872
; WIPE_START
G1 F12000
G1 X80.544 Y114.219 E-.12752
G1 X80.544 Y115.448 E-.46687
G1 X80.786 Y115.36 E-.09763
G1 X80.915 Y115.236 E-.06798
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.791 Y116.914 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419995
G1 F8551
M204 S4000
G1 X78.927 Y116.97 E.00356
G1 X79.058 Y117.115 E.00471
G3 X79.079 Y118.377 I-22.956 J1.002 E.03044
G2 X80.132 Y118.389 I.793 J-23.852 E.02541
G2 X80.144 Y117.201 I-26.885 J-.86 E.02864
G1 X80.2 Y117.065 E.00356
G1 X80.345 Y116.934 E.00471
G3 X81.607 Y116.914 I1.002 J22.956 E.03044
G2 X81.619 Y115.869 I-23.664 J-.789 E.02521
G2 X80.431 Y115.849 I-.86 J15.755 E.02865
G1 X80.295 Y115.792 E.00356
G1 X80.164 Y115.647 E.00471
G3 X80.144 Y114.385 I22.956 J-1.002 E.03044
G2 X79.09 Y114.374 I-.793 J23.852 E.02541
G2 X79.079 Y115.561 I26.885 J.86 E.02864
G1 X79.022 Y115.697 E.00356
G1 X78.877 Y115.828 E.00471
G3 X77.615 Y115.849 I-1.002 J-22.956 E.03044
G2 X77.604 Y116.902 I23.852 J.793 E.02541
G2 X78.731 Y116.914 I.83 J-25.526 E.02719
M204 S10000
G1 X79.2 Y116.065 F42000
; LINE_WIDTH: 0.384311
G1 F8551
M204 S4000
G1 X79.049 Y116.171 E.00405
G1 X78.791 Y116.211 E.00571
G1 X77.966 Y116.211 E.01805
G1 X77.966 Y116.551 E.00744
G1 X78.791 Y116.551 E.01805
G1 X79.049 Y116.591 E.00571
G1 X79.295 Y116.792 E.00695
G1 X79.401 Y116.944 E.00405
G1 X79.441 Y117.201 E.00571
G1 X79.441 Y118.026 E.01805
G1 X79.781 Y118.026 E.00744
G1 X79.781 Y117.201 E.01805
G1 X79.821 Y116.944 E.00571
G1 X80.022 Y116.698 E.00695
G1 X80.175 Y116.594 E.00404
G1 X80.431 Y116.551 E.00569
G1 X81.256 Y116.551 E.01805
G1 X81.256 Y116.211 E.00744
G1 X80.431 Y116.211 E.01805
G1 X80.175 Y116.168 E.00569
G1 X79.928 Y115.97 E.00694
G1 X79.824 Y115.817 E.00404
G1 X79.781 Y115.561 E.00569
G1 X79.781 Y114.736 E.01805
G1 X79.441 Y114.736 E.00744
G1 X79.441 Y115.561 E.01805
G1 X79.398 Y115.817 E.00569
G1 X79.238 Y116.018 E.00563
M204 S10000
G1 X79.611 Y116.128 F42000
; LINE_WIDTH: 0.355936
G1 F8551
M204 S4000
G1 X79.358 Y116.381 E.0072
G1 X79.611 Y116.634 E.0072
G1 X79.864 Y116.381 E.0072
G1 X79.654 Y116.171 E.00599
; WIPE_START
G1 F9600
G1 X79.864 Y116.381 E-.16507
G1 X79.611 Y116.634 E-.19831
G1 X79.358 Y116.381 E-.19831
G1 X79.611 Y116.128 E-.19831
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.127 Y112.761 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8551
M204 S4000
G1 X75.991 Y112.761 E.02952
G1 X75.991 Y113.288 E.01369
G3 X78.11 Y114.929 I-.611 J2.978 E.07214
G1 X78.41 Y115.448 E.01559
G1 X77.449 Y115.448 E.02496
G1 X77.203 Y115.694 E.00906
G1 X77.203 Y116.977 E.03334
G2 X75.991 Y117.722 I.73 J2.547 E.03743
G1 X75.991 Y119.385 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y117.722 E-.63181
G1 X76.235 Y117.489 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/38
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S122.4
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.4 I-.118 J1.211 P1  F42000
G1 X105.637 Y120.355 Z1.4
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.56
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.56 F4000
            G39.3 S1
            G0 Z1.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.687 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y114.025 E.04321
G3 X106.538 Y114.624 I-.966 J1.432 E.02129
G3 X107.486 Y114.256 I.91 J.939 E.02714
G3 X108.638 Y112.85 I1.483 J.041 E.05085
G3 X110.305 Y112.821 I.963 J7.264 E.04343
G3 X111.478 Y113.439 I-.21 J1.821 E.03527
G1 X111.559 Y113.425 E.00212
G3 X113.232 Y114.109 I-.152 J2.762 E.04785
G1 X113.232 Y115.771 E.04321
; WIPE_START
G1 X113.232 Y114.109 E-.63181
G1 X112.968 Y113.898 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.292 Y119.541 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X110.76 Y119.43 I-.168 J-1.745 E.01164
G1 X111.109 Y119.148 E.01083
G1 X111.287 Y118.826 E.00887
G1 X111.353 Y118.326 E.01217
G1 X111.514 Y118.145 E.00582
G1 X111.922 Y118.095 E.00992
G1 X112.353 Y117.899 E.01143
M73 P47 R9
G1 X112.644 Y117.559 E.01077
G1 X112.766 Y117.123 E.01093
G2 X112.771 Y115.864 I-87.099 J-1.026 E.03034
G2 X112.655 Y115.231 I-4.07 J.423 E.01554
G1 X112.377 Y114.883 E.01074
G1 X112.056 Y114.705 E.00885
G1 X111.556 Y114.639 E.01217
G1 X111.375 Y114.479 E.00583
G1 X111.296 Y113.958 E.01271
G1 X111.109 Y113.615 E.00943
G1 X110.761 Y113.338 E.01072
G1 X110.27 Y113.221 E.01217
G1 X108.931 Y113.221 E.03229
G2 X108.463 Y113.332 I.168 J1.745 E.01165
G1 X108.113 Y113.614 E.01083
G1 X107.935 Y113.936 E.00887
G1 X107.869 Y114.437 E.01217
G1 X107.709 Y114.617 E.00583
G1 X107.188 Y114.697 E.01271
G1 X106.844 Y114.883 E.00943
G1 X106.567 Y115.232 E.01074
G1 X106.454 Y115.698 E.01156
G1 X106.451 Y117.062 E.03289
G2 X106.562 Y117.53 I1.743 J-.167 E.01164
G1 X106.844 Y117.88 E.01083
G1 X107.166 Y118.058 E.00887
G1 X107.667 Y118.123 E.01217
G1 X107.847 Y118.284 E.00582
G1 X107.926 Y118.804 E.0127
G1 X108.113 Y119.148 E.00943
G1 X108.462 Y119.425 E.01074
G1 X108.928 Y119.538 E.01157
G1 X110.232 Y119.541 E.03144
M204 S10000
G1 X110.572 Y119.086 F42000
G1 F9600
M204 S4000
G1 X110.809 Y118.895 E.00731
G1 X110.914 Y118.705 E.00524
G1 X110.991 Y118.192 E.01251
G1 X111.169 Y117.939 E.00746
G1 X111.423 Y117.761 E.00746
G1 X111.954 Y117.656 E.01306
G1 X112.116 Y117.583 E.00429
G1 X112.304 Y117.362 E.007
G1 X112.385 Y117.016 E.00858
G1 X112.386 Y115.864 E.02776
G1 X112.299 Y115.404 E.01129
G1 X112.123 Y115.183 E.00682
G1 X111.935 Y115.079 E.00518
G1 X111.423 Y115.001 E.0125
G1 X111.169 Y114.823 E.00747
G1 X110.991 Y114.57 E.00746
G1 X110.865 Y113.973 E.01471
G2 X110.588 Y113.693 I-.826 J.54 E.00955
G1 X110.128 Y113.607 E.01129
G1 X108.947 Y113.607 E.02847
G1 X108.65 Y113.677 E.00737
G1 X108.414 Y113.867 E.00731
G1 X108.309 Y114.057 E.00524
G1 X108.231 Y114.57 E.0125
G1 X108.053 Y114.823 E.00747
G1 X107.8 Y115.001 E.00746
G1 X107.305 Y115.072 E.01206
G1 X107.098 Y115.185 E.00569
G1 X106.922 Y115.405 E.0068
G1 X106.839 Y115.84 E.01066
G1 X106.837 Y117.046 E.02909
G1 X106.907 Y117.343 E.00735
G1 X107.097 Y117.579 E.00731
G1 X107.287 Y117.684 E.00524
G1 X107.8 Y117.762 E.01251
G1 X108.053 Y117.939 E.00746
G1 X108.231 Y118.192 E.00746
G1 X108.302 Y118.687 E.01206
G1 X108.414 Y118.895 E.0057
G1 X108.635 Y119.07 E.0068
G1 X109.07 Y119.153 E.01066
G1 X110.276 Y119.156 E.02908
G1 X110.514 Y119.099 E.00591
; WIPE_START
G1 X110.276 Y119.156 E-.0931
G1 X109.07 Y119.153 E-.45825
G1 X108.635 Y119.07 E-.16803
G1 X108.552 Y119.004 E-.04062
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.794 Y117.305 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X111.965 Y117.165 E.00533
G1 X112 Y116.887 E.00676
G1 X112 Y115.864 E.02467
G1 X111.944 Y115.577 E.00706
G1 X111.814 Y115.453 E.00433
G1 X111.289 Y115.363 E.01284
G1 X110.94 Y115.14 E.01
G3 X110.629 Y114.703 I.684 J-.816 E.01307
G1 X110.545 Y114.192 E.01248
G1 X110.416 Y114.049 E.00467
G1 X110.04 Y113.992 E.00915
G1 X108.964 Y113.992 E.02596
G1 X108.786 Y114.062 E.00459
G1 X108.683 Y114.178 E.00376
G1 X108.593 Y114.703 E.01283
G1 X108.37 Y115.052 E.01
G3 X107.934 Y115.363 I-.817 J-.684 E.01305
G1 X107.422 Y115.447 E.0125
G1 X107.277 Y115.579 E.00473
G1 X107.225 Y115.948 E.009
G1 X107.222 Y117.03 E.02608
G1 X107.292 Y117.206 E.00457
G1 X107.408 Y117.31 E.00375
G1 X107.934 Y117.4 E.01286
G1 X108.282 Y117.623 E.00997
G3 X108.593 Y118.059 I-.684 J.817 E.01306
G1 X108.677 Y118.57 E.0125
G1 X108.809 Y118.716 E.00473
G1 X109.178 Y118.768 E.00899
G1 X110.26 Y118.77 E.02608
G1 X110.436 Y118.7 E.00457
G1 X110.54 Y118.584 E.00375
G1 X110.63 Y118.059 E.01286
G1 X110.853 Y117.711 E.00997
G3 X111.289 Y117.399 I.816 J.684 E.01308
G1 X111.735 Y117.316 E.01094
M204 S10000
G1 X111.156 Y117.037 F42000
G1 F9600
M204 S4000
G1 X111.614 Y116.953 E.01122
G1 X111.614 Y115.864 E.02626
G1 X111.604 Y115.816 E.00119
G1 X111.156 Y115.725 E.01102
G1 X110.86 Y115.572 E.00803
G3 X110.267 Y114.836 I1.015 J-1.425 E.02309
G1 X110.141 Y114.38 E.01142
G2 X109.047 Y114.378 I-.812 J193.093 E.02638
G1 X108.955 Y114.836 E.01126
G1 X108.802 Y115.132 E.00803
G3 X108.067 Y115.725 I-1.426 J-1.016 E.02306
G1 X107.611 Y115.841 E.01136
G1 X107.608 Y116.946 E.02663
G1 X108.067 Y117.038 E.01129
G1 X108.362 Y117.19 E.00801
G3 X108.955 Y117.925 I-1.016 J1.425 E.02305
G1 X109.071 Y118.382 E.01136
G1 X110.175 Y118.384 E.02663
G1 X110.268 Y117.925 E.01129
G1 X110.42 Y117.63 E.00801
G3 X111.103 Y117.065 I1.385 J.978 E.02163
M204 S10000
G1 X111.229 Y116.136 F42000
G1 F9600
M204 S4000
G1 X111.023 Y116.087 E.00509
G1 X110.643 Y115.891 E.01032
G3 X109.905 Y114.969 I1.265 J-1.768 E.02883
G1 X109.857 Y114.764 E.00508
G1 X109.366 Y114.764 E.01184
G1 X109.317 Y114.969 E.00509
G1 X109.121 Y115.35 E.01033
G3 X108.201 Y116.086 I-1.768 J-1.265 E.02878
G1 X107.996 Y116.135 E.00508
G1 X107.995 Y116.626 E.01186
G1 X108.201 Y116.676 E.00511
G1 X108.58 Y116.872 E.0103
G3 X109.316 Y117.792 I-1.266 J1.768 E.02877
G1 X109.364 Y117.997 E.00508
G1 X109.856 Y117.998 E.01186
G1 X109.906 Y117.792 E.00511
G1 X110.102 Y117.412 E.0103
G3 X111.023 Y116.676 I1.767 J1.265 E.02881
G1 X111.228 Y116.633 E.00505
G1 X111.229 Y116.196 E.01053
M204 S10000
G1 X110.759 Y116.381 F42000
G1 F9600
M204 S4000
G1 X110.425 Y116.209 E.00905
G3 X109.783 Y115.567 I1.627 J-2.269 E.02198
G1 X109.611 Y115.234 E.00906
G1 X109.439 Y115.567 E.00906
G1 X109.1 Y115.958 E.01248
G3 X108.464 Y116.381 I-1.282 J-1.238 E.01856
G1 X108.798 Y116.554 E.00907
G3 X109.439 Y117.195 I-1.63 J2.27 E.02195
G1 X109.611 Y117.529 E.00907
G1 X109.784 Y117.195 E.00907
G3 X110.425 Y116.553 I2.27 J1.629 E.02197
G1 X110.705 Y116.409 E.00761
M204 S10000
G1 X109.967 Y116.381 F42000
; LINE_WIDTH: 0.502306
G1 F9600
M204 S4000
G1 X109.611 Y116.025 E.01472
G1 X109.255 Y116.381 E.01472
G1 X109.611 Y116.737 E.01472
G1 X109.924 Y116.424 E.01297
; WIPE_START
G1 X109.611 Y116.737 E-.17248
G1 X109.255 Y116.381 E-.19582
G1 X109.611 Y116.025 E-.19585
G1 X109.967 Y116.381 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.761 Y118.897 Z1.56 F42000
G1 X98.585 Y120.355 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.917 Y118.071 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X97.349 Y117.877 E.01141
G1 X97.642 Y117.537 E.01082
G1 X97.766 Y117.098 E.01101
G2 X97.771 Y115.89 I-80.577 J-.986 E.02911
G2 X97.653 Y115.254 I-4.068 J.426 E.01563
G1 X97.373 Y114.904 E.0108
G1 X97.05 Y114.728 E.00888
G1 X96.537 Y114.666 E.01245
G1 X96.349 Y114.501 E.00602
G1 X96.273 Y113.965 E.01307
G1 X96.088 Y113.619 E.00946
G1 X95.739 Y113.339 E.01078
G1 X95.245 Y113.221 E.01224
G1 X93.956 Y113.221 E.03108
G2 X93.485 Y113.334 I.171 J1.752 E.01172
G1 X93.134 Y113.619 E.01089
G1 X92.958 Y113.943 E.0089
G1 X92.896 Y114.455 E.01245
G1 X92.731 Y114.643 E.00602
G1 X92.194 Y114.72 E.01307
G1 X91.849 Y114.905 E.00946
G1 X91.569 Y115.254 E.0108
G1 X91.454 Y115.723 E.01164
G1 X91.451 Y117.037 E.03168
G2 X91.564 Y117.508 I1.752 J-.171 E.01172
G1 X91.849 Y117.858 E.01089
G1 X92.173 Y118.035 E.0089
G1 X92.685 Y118.097 E.01246
G1 X92.873 Y118.261 E.00602
G1 X92.949 Y118.798 E.01307
G1 X93.135 Y119.144 E.00946
G1 X93.484 Y119.424 E.0108
G1 X93.953 Y119.538 E.01164
G1 X95.267 Y119.541 E.03168
G2 X95.738 Y119.429 I-.171 J-1.752 E.01172
G1 X96.088 Y119.144 E.01089
G1 X96.264 Y118.82 E.0089
G1 X96.327 Y118.307 E.01246
G1 X96.491 Y118.119 E.00602
G1 X96.857 Y118.077 E.00888
; WIPE_START
G1 X96.491 Y118.119 E-.13992
G1 X96.327 Y118.307 E-.09483
G1 X96.264 Y118.82 E-.19632
G1 X96.088 Y119.144 E-.14021
G1 X95.738 Y119.429 E-.17156
G1 X95.695 Y119.443 E-.01716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.961 Y114.578 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X95.897 Y114.079 E.01213
G1 X95.785 Y113.871 E.00571
G1 X95.565 Y113.694 E.0068
G1 X95.102 Y113.607 E.01136
G1 X93.972 Y113.607 E.02724
G1 X93.673 Y113.678 E.00742
G1 X93.437 Y113.87 E.00735
G1 X93.333 Y114.061 E.00524
G1 X93.261 Y114.578 E.01258
G1 X93.077 Y114.847 E.00787
G1 X92.808 Y115.031 E.00785
G1 X92.309 Y115.096 E.01214
G1 X92.1 Y115.207 E.00571
G1 X91.923 Y115.429 E.00684
G1 X91.839 Y115.866 E.01073
G1 X91.837 Y117.021 E.02786
G1 X91.908 Y117.319 E.0074
G1 X92.1 Y117.556 E.00735
G1 X92.291 Y117.66 E.00524
G1 X92.808 Y117.731 E.0126
G1 X93.077 Y117.915 E.00785
G1 X93.261 Y118.184 E.00785
G1 X93.326 Y118.683 E.01214
G1 X93.437 Y118.892 E.00571
G1 X93.659 Y119.069 E.00684
G1 X94.096 Y119.153 E.01073
G1 X95.251 Y119.156 E.02786
G1 X95.549 Y119.085 E.0074
G1 X95.786 Y118.892 E.00735
G1 X95.89 Y118.702 E.00524
G1 X95.961 Y118.184 E.0126
G1 X96.145 Y117.915 E.00785
G1 X96.414 Y117.731 E.00787
G1 X96.951 Y117.633 E.01316
G1 X97.113 Y117.56 E.00427
G1 X97.303 Y117.339 E.00704
G1 X97.385 Y116.991 E.00864
G1 X97.386 Y115.89 E.02653
G1 X97.298 Y115.427 E.01136
G1 X97.12 Y115.206 E.00685
G1 X96.931 Y115.103 E.00519
G1 X96.414 Y115.031 E.01259
G1 X96.145 Y114.847 E.00787
G1 X95.995 Y114.628 E.00642
M204 S10000
G1 X96.292 Y115.397 F42000
G1 F9600
M204 S4000
G1 X96.063 Y115.285 E.00615
G1 X95.708 Y114.929 E.01212
G1 X95.595 Y114.701 E.00615
G1 X95.521 Y114.194 E.01235
G1 X95.391 Y114.049 E.00468
G1 X95 Y113.992 E.00952
G1 X93.989 Y113.992 E.0244
G1 X93.811 Y114.063 E.00461
G1 X93.707 Y114.179 E.00376
G1 X93.627 Y114.701 E.01272
G1 X93.515 Y114.929 E.00615
G1 X93.16 Y115.284 E.01211
G1 X92.931 Y115.397 E.00613
G1 X92.424 Y115.472 E.01238
G1 X92.277 Y115.603 E.00474
G1 X92.225 Y115.988 E.00937
G1 X92.222 Y117.005 E.02452
G1 X92.293 Y117.182 E.00459
G1 X92.409 Y117.285 E.00376
G1 X92.931 Y117.366 E.01274
G1 X93.306 Y117.598 E.01062
G3 X93.627 Y118.061 I-.677 J.812 E.01375
G1 X93.702 Y118.569 E.01238
G1 X93.833 Y118.715 E.00474
G1 X94.218 Y118.768 E.00937
G1 X95.235 Y118.77 E.02452
G1 X95.411 Y118.7 E.00459
G1 X95.515 Y118.583 E.00376
G1 X95.596 Y118.061 E.01274
G1 X95.828 Y117.687 E.01062
G3 X96.292 Y117.366 I.812 J.677 E.01377
G1 X96.793 Y117.281 E.01226
G1 X96.965 Y117.141 E.00533
G1 X97 Y116.844 E.00722
G1 X97 Y115.89 E.023
G1 X96.943 Y115.601 E.0071
G1 X96.813 Y115.477 E.00433
G1 X96.351 Y115.406 E.01127
; WIPE_START
G1 X96.813 Y115.477 E-.17765
G1 X96.943 Y115.601 E-.06826
G1 X97 Y115.89 E-.11189
G1 X97 Y116.844 E-.36244
G1 X96.987 Y116.948 E-.03976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.169 Y117 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X96.614 Y116.927 E.01087
G1 X96.604 Y115.842 E.02618
G1 X96.169 Y115.763 E.01067
G1 X95.849 Y115.605 E.0086
G3 X95.23 Y114.823 I.992 J-1.421 E.0244
G1 X95.115 Y114.38 E.01105
G2 X94.073 Y114.378 I-.776 J174.754 E.02512
G1 X93.992 Y114.823 E.01091
G1 X93.835 Y115.144 E.00861
G3 X93.054 Y115.762 I-1.422 J-.992 E.02437
G1 X92.611 Y115.867 E.011
G1 X92.608 Y116.92 E.02537
G1 X93.054 Y117 E.01093
G1 X93.374 Y117.157 E.00859
G3 X93.992 Y117.938 I-.993 J1.421 E.02436
G1 X94.097 Y118.382 E.011
G1 X95.149 Y118.384 E.02537
G1 X95.23 Y117.938 E.01093
G1 X95.387 Y117.619 E.00859
G3 X96.115 Y117.026 I1.383 J.956 E.02293
M204 S10000
G1 X96.229 Y116.169 F42000
G1 F9600
M204 S4000
G1 X96.046 Y116.128 E.0045
G1 X95.635 Y115.926 E.01106
G3 X94.864 Y114.946 I1.238 J-1.766 E.03051
G1 X94.825 Y114.764 E.00449
G1 X94.398 Y114.764 E.01029
G1 X94.358 Y114.946 E.0045
G1 X94.156 Y115.358 E.01106
G3 X93.177 Y116.128 I-1.766 J-1.238 E.03046
G1 X92.996 Y116.167 E.00448
G1 X92.995 Y116.594 E.01031
G1 X93.177 Y116.635 E.00451
G1 X93.588 Y116.837 E.01104
G3 X94.358 Y117.815 I-1.239 J1.766 E.03045
G1 X94.397 Y117.997 E.00448
G1 X94.824 Y117.998 E.01031
G1 X94.865 Y117.815 E.00451
G1 X95.067 Y117.404 E.01104
G3 X96.046 Y116.634 I1.766 J1.239 E.03048
G1 X96.228 Y116.6 E.00447
G1 X96.229 Y116.229 E.00896
M204 S10000
G1 X95.694 Y116.381 F42000
G1 F9600
M204 S4000
G1 X95.42 Y116.247 E.00736
G1 X95.01 Y115.894 E.01306
G1 X94.745 Y115.572 E.01005
G1 X94.611 Y115.298 E.00736
G1 X94.477 Y115.572 E.00736
G1 X94.124 Y115.983 E.01306
G1 X93.802 Y116.246 E.01003
G1 X93.528 Y116.381 E.00737
G1 X93.802 Y116.516 E.00737
G1 X94.213 Y116.869 E.01304
G1 X94.476 Y117.19 E.01003
G1 X94.611 Y117.464 E.00737
G1 X94.746 Y117.19 E.00737
G1 X95.099 Y116.78 E.01304
G1 X95.42 Y116.516 E.01004
G1 X95.64 Y116.408 E.00591
M204 S10000
G1 X94.942 Y116.381 F42000
; LINE_WIDTH: 0.467946
G1 F9600
M204 S4000
G1 X94.611 Y116.051 E.01267
G1 X94.281 Y116.381 E.01267
G1 X94.611 Y116.712 E.01267
G1 X94.899 Y116.424 E.01104
; WIPE_START
G1 X94.611 Y116.712 E-.1711
G1 X94.281 Y116.381 E-.19629
G1 X94.611 Y116.051 E-.1963
G1 X94.942 Y116.381 E-.19631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.305 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.642 E.04321
G1 X97.287 Y113.425 E.02518
G2 X96.589 Y113.698 I-.093 J.792 E.02027
G2 X95.28 Y112.821 I-1.438 J.73 E.0428
G2 X93.663 Y112.85 I-.679 J7.061 E.04214
G2 X92.51 Y114.28 I.333 J1.448 E.05146
G2 X92.049 Y114.343 I-.036 J1.462 E.01215
G2 X90.991 Y113.604 I-1.541 J1.08 E.03423
G1 X90.991 Y115.267 E.04321
; WIPE_START
G1 X90.991 Y113.604 E-.63181
G1 X91.295 Y113.749 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.776 Y112.441 Z1.56 F42000
G1 X83.585 Y112.408 Z1.56
G1 Z1.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.478 Y114.664 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X81.305 Y114.466 E.00635
G1 X81.25 Y113.972 E.01199
G1 X81.066 Y113.623 E.00951
G1 X80.717 Y113.341 E.01083
G1 X80.22 Y113.221 E.01233
G1 X78.981 Y113.221 E.02987
G2 X78.507 Y113.335 I.174 J1.759 E.0118
G1 X78.157 Y113.623 E.01093
G1 X77.972 Y113.972 E.00952
G1 X77.894 Y114.514 E.01322
G1 X77.696 Y114.687 E.00634
G1 X77.202 Y114.742 E.01199
G1 X76.853 Y114.926 E.00951
G1 X76.57 Y115.276 E.01085
G1 X76.454 Y115.748 E.01172
G1 X76.451 Y117.012 E.03048
G2 X76.565 Y117.485 I1.76 J-.174 E.01179
G1 X76.853 Y117.836 E.01093
G1 X77.202 Y118.02 E.00952
G1 X77.744 Y118.098 E.01322
M73 P48 R9
G1 X77.917 Y118.296 E.00634
G1 X77.972 Y118.79 E.01199
G1 X78.156 Y119.139 E.00951
G1 X78.506 Y119.422 E.01085
G1 X78.978 Y119.538 E.01172
G1 X80.242 Y119.541 E.03048
G2 X80.715 Y119.427 I-.174 J-1.759 E.01179
G1 X81.066 Y119.14 E.01093
G1 X81.25 Y118.791 E.00952
G1 X81.328 Y118.248 E.01322
G1 X81.526 Y118.075 E.00634
M73 P48 R8
G1 X81.908 Y118.048 E.00924
G1 X82.344 Y117.855 E.01148
G1 X82.64 Y117.515 E.01088
G1 X82.765 Y117.073 E.01109
G2 X82.771 Y115.917 I-74.234 J-.947 E.02786
G2 X82.651 Y115.276 I-4.033 J.421 E.01576
G1 X82.369 Y114.926 E.01083
G1 X82.02 Y114.742 E.00951
G1 X81.537 Y114.673 E.01177
M204 S10000
G1 X81.411 Y115.055 F42000
G1 F9600
M204 S4000
G3 X80.914 Y114.468 I.295 J-.754 E.01934
G1 X80.874 Y114.086 E.00926
G1 X80.762 Y113.873 E.0058
G1 X80.542 Y113.695 E.00683
G1 X80.075 Y113.607 E.01146
G1 X78.997 Y113.607 E.02599
G1 X78.696 Y113.679 E.00747
G1 X78.461 Y113.872 E.00733
G1 X78.348 Y114.086 E.00584
G1 X78.285 Y114.581 E.01204
G3 X77.698 Y115.079 I-.754 J-.295 E.01935
G1 X77.316 Y115.118 E.00926
G1 X77.103 Y115.23 E.0058
G1 X76.924 Y115.452 E.00687
G1 X76.839 Y115.892 E.01081
G1 X76.837 Y116.996 E.02661
G1 X76.909 Y117.296 E.00745
G1 X77.101 Y117.531 E.00733
G1 X77.316 Y117.644 E.00584
G1 X77.812 Y117.707 E.01206
G3 X78.309 Y118.295 I-.296 J.754 E.01933
G1 X78.348 Y118.676 E.00926
G1 X78.46 Y118.889 E.0058
G1 X78.682 Y119.068 E.00687
G1 X79.122 Y119.153 E.01081
G1 X80.226 Y119.156 E.02661
G1 X80.526 Y119.084 E.00745
G1 X80.761 Y118.891 E.00733
G1 X80.874 Y118.677 E.00584
G1 X80.937 Y118.181 E.01206
G3 X81.551 Y117.682 I.747 J.291 E.01995
G1 X81.817 Y117.666 E.00642
G1 X82.11 Y117.537 E.00772
G1 X82.302 Y117.316 E.00707
G1 X82.385 Y117 E.00788
G1 X82.386 Y115.917 E.02611
G1 X82.297 Y115.451 E.01145
G1 X82.119 Y115.23 E.00683
G1 X81.906 Y115.118 E.00579
G1 X81.471 Y115.063 E.01059
M204 S10000
G1 X81.055 Y115.309 F42000
G1 F9600
M204 S4000
G3 X80.569 Y114.696 I.74 J-1.086 E.01915
G1 X80.498 Y114.2 E.01209
G1 X80.367 Y114.05 E.00481
G1 X79.959 Y113.992 E.00993
G1 X79.014 Y113.992 E.0228
G2 X78.724 Y114.2 I.04 J.362 E.00898
G1 X78.653 Y114.696 E.01209
G1 X78.539 Y114.938 E.00644
G3 X77.927 Y115.423 I-1.086 J-.741 E.01913
G1 X77.43 Y115.494 E.01211
G1 X77.278 Y115.628 E.00488
G1 X77.225 Y116.029 E.00977
G1 X77.222 Y116.98 E.02292
G1 X77.287 Y117.149 E.00438
G1 X77.43 Y117.268 E.00448
G1 X77.927 Y117.339 E.01212
G1 X78.168 Y117.453 E.00642
G3 X78.653 Y118.065 I-.741 J1.086 E.01912
G1 X78.724 Y118.562 E.01211
G1 X78.858 Y118.714 E.00488
G1 X79.259 Y118.768 E.00977
G1 X80.21 Y118.77 E.02292
G1 X80.379 Y118.705 E.00438
G1 X80.498 Y118.563 E.00448
G1 X80.569 Y118.065 E.01212
G1 X80.683 Y117.825 E.00642
G3 X81.296 Y117.339 I1.086 J.741 E.01914
G1 X81.81 Y117.248 E.0126
G1 X81.964 Y117.117 E.00486
G1 X82 Y116.798 E.00774
G1 X82 Y115.917 E.02124
G1 X81.942 Y115.626 E.00717
G1 X81.792 Y115.494 E.00481
G1 X81.296 Y115.423 E.0121
G1 X81.109 Y115.335 E.00499
M204 S10000
G1 X80.535 Y115.363 F42000
G1 F9600
M204 S4000
G1 X80.361 Y115.149 E.00665
G1 X80.201 Y114.812 E.00901
G1 X80.13 Y114.39 E.01031
G2 X79.093 Y114.378 I-.778 J23.214 E.02501
G1 X79.021 Y114.812 E.0106
G1 X78.862 Y115.149 E.00901
G3 X78.043 Y115.791 I-1.433 J-.984 E.02548
G1 X77.611 Y115.894 E.01071
G1 X77.608 Y116.899 E.02424
G1 X78.043 Y116.971 E.01062
G1 X78.38 Y117.131 E.00899
G3 X79.021 Y117.95 I-.985 J1.432 E.02547
G1 X79.124 Y118.382 E.01071
G1 X80.129 Y118.384 E.02424
G1 X80.201 Y117.95 E.01062
G1 X80.361 Y117.613 E.00899
G3 X81.181 Y116.971 I1.432 J.985 E.0255
G1 X81.614 Y116.906 E.01057
G1 X81.603 Y115.862 E.02516
G1 X81.181 Y115.791 E.01032
G1 X80.843 Y115.632 E.00901
G1 X80.58 Y115.402 E.00842
; WIPE_START
G1 X80.843 Y115.632 E-.13264
G1 X81.181 Y115.791 E-.14193
G1 X81.603 Y115.862 E-.16262
G1 X81.612 Y116.712 E-.32281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.228 Y116.193 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X81.065 Y116.16 E.00401
G1 X80.631 Y115.954 E.01158
G1 X80.262 Y115.636 E.01176
G1 X80.038 Y115.361 E.00854
G1 X79.833 Y114.927 E.01158
G1 X79.799 Y114.764 E.00401
G1 X79.423 Y114.764 E.00907
G1 X79.389 Y114.927 E.00401
G1 X79.184 Y115.361 E.01158
G1 X78.866 Y115.73 E.01176
G1 X78.591 Y115.954 E.00853
G1 X78.158 Y116.159 E.01156
G1 X77.996 Y116.193 E.00401
G1 X77.995 Y116.57 E.00909
G1 X78.158 Y116.604 E.00403
G1 X78.591 Y116.809 E.01156
G1 X78.96 Y117.127 E.01175
G1 X79.184 Y117.401 E.00853
G1 X79.389 Y117.834 E.01156
G1 X79.422 Y117.997 E.00401
G1 X79.8 Y117.998 E.00909
G1 X79.833 Y117.834 E.00403
G1 X80.039 Y117.401 E.01156
G1 X80.357 Y117.032 E.01175
G1 X80.631 Y116.808 E.00854
G1 X81.065 Y116.603 E.01158
G1 X81.228 Y116.573 E.00399
G1 X81.228 Y116.253 E.00772
M204 S10000
G1 X80.641 Y116.381 F42000
G1 F9600
M204 S4000
G1 X80.42 Y116.276 E.00591
G1 X79.989 Y115.908 E.01366
G1 X79.716 Y115.572 E.01044
G1 X79.611 Y115.351 E.00591
G1 X79.506 Y115.572 E.00591
G1 X79.138 Y116.003 E.01366
G1 X78.803 Y116.276 E.01042
G1 X78.581 Y116.381 E.00592
G1 X78.803 Y116.487 E.00592
G1 X79.233 Y116.854 E.01364
G1 X79.506 Y117.189 E.01042
G1 X79.611 Y117.411 E.00592
G1 X79.716 Y117.189 E.00592
G1 X80.084 Y116.759 E.01364
G1 X80.42 Y116.486 E.01044
G1 X80.587 Y116.407 E.00446
M204 S10000
G1 X79.923 Y116.381 F42000
; LINE_WIDTH: 0.443266
G1 F9600
M204 S4000
G1 X79.611 Y116.07 E.01126
G1 X79.3 Y116.381 E.01126
G1 X79.611 Y116.693 E.01126
G1 X79.88 Y116.424 E.00973
; WIPE_START
G1 X79.611 Y116.693 E-.1699
G1 X79.3 Y116.381 E-.19668
G1 X79.611 Y116.07 E-.1967
G1 X79.923 Y116.381 E-.19672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.995 Y119.942 Z1.56 F42000
G1 Z1.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X81.442 Y119.301 I.166 J-1.58 E.04307
G1 X81.678 Y119.26 E.00621
G1 X82.124 Y118.914 E.01468
G1 X83.016 Y117.765 E.0378
G1 X83.231 Y117.593 E.00718
G1 X83.231 Y113.471 E.10712
G2 X82.124 Y113.849 I-.238 J1.115 E.03195
G1 X81.774 Y114.299 E.0148
G1 X81.697 Y114.263 E.00222
G2 X80.255 Y112.821 I-1.502 J.06 E.05826
G2 X78.687 Y112.85 I-.654 J6.836 E.04084
G2 X77.539 Y114.098 I.362 J1.486 E.04671
G2 X75.991 Y113.449 I-1.738 J1.975 E.04442
G1 X75.991 Y115.112 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y113.449 E-.63181
G1 X76.321 Y113.519 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/38
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S124.95
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.56 I-.276 J1.185 P1  F42000
G1 X105.637 Y120.355 Z1.56
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.72
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.72 F4000
            G39.3 S1
            G0 Z1.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.649 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y113.987 E.04321
G3 X106.6 Y114.56 I-.841 J1.504 E.02197
G3 X107.486 Y114.256 I.867 J1.083 E.02483
G3 X108.638 Y112.85 I1.483 J.041 E.05085
G3 X110.305 Y112.821 I.963 J7.264 E.04343
G3 X111.551 Y113.576 I-.137 J1.63 E.03925
G3 X113.232 Y114.056 I.207 J2.458 E.04644
G1 X113.232 Y115.719 E.04321
M204 S10000
G1 X112.771 Y115.864 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X112.655 Y115.231 I-4.07 J.423 E.01554
G1 X112.377 Y114.883 E.01074
G1 X112.056 Y114.705 E.00885
G1 X111.556 Y114.639 E.01217
G1 X111.375 Y114.479 E.00583
G1 X111.296 Y113.958 E.01271
G1 X111.109 Y113.615 E.00943
G1 X110.761 Y113.338 E.01072
G1 X110.27 Y113.221 E.01217
G1 X108.931 Y113.221 E.03229
G2 X108.463 Y113.332 I.168 J1.745 E.01165
G1 X108.113 Y113.614 E.01083
G1 X107.935 Y113.936 E.00887
G1 X107.869 Y114.437 E.01217
G1 X107.709 Y114.617 E.00583
G1 X107.188 Y114.697 E.01271
G1 X106.844 Y114.883 E.00943
G1 X106.567 Y115.232 E.01074
G1 X106.454 Y115.698 E.01156
G1 X106.451 Y117.062 E.03289
G2 X106.562 Y117.53 I1.743 J-.167 E.01164
G1 X106.844 Y117.88 E.01083
G1 X107.166 Y118.058 E.00887
G1 X107.667 Y118.123 E.01217
G1 X107.847 Y118.284 E.00582
G1 X107.926 Y118.804 E.0127
G1 X108.113 Y119.148 E.00943
G1 X108.462 Y119.425 E.01074
G1 X108.928 Y119.538 E.01157
G1 X110.292 Y119.541 E.03289
G2 X110.76 Y119.43 I-.168 J-1.745 E.01164
G1 X111.109 Y119.148 E.01083
G1 X111.287 Y118.826 E.00887
G1 X111.353 Y118.326 E.01217
G1 X111.514 Y118.145 E.00582
G1 X111.922 Y118.095 E.00992
G1 X112.353 Y117.899 E.01143
G1 X112.644 Y117.559 E.01077
G1 X112.766 Y117.123 E.01093
G2 X112.771 Y115.924 I-82.909 J-.995 E.0289
M204 S10000
G1 X112.386 Y115.864 F42000
G1 F9600
M204 S4000
G1 X112.299 Y115.404 E.01129
G1 X112.123 Y115.183 E.00682
G1 X111.935 Y115.079 E.00518
G1 X111.423 Y115.001 E.0125
G1 X111.169 Y114.823 E.00747
G1 X110.991 Y114.57 E.00746
G1 X110.865 Y113.973 E.01471
G2 X110.588 Y113.693 I-.826 J.54 E.00955
G1 X110.128 Y113.607 E.01129
G1 X108.947 Y113.607 E.02847
G1 X108.65 Y113.677 E.00737
G1 X108.414 Y113.867 E.00731
G1 X108.309 Y114.057 E.00524
G1 X108.231 Y114.57 E.0125
G1 X108.053 Y114.823 E.00747
G1 X107.8 Y115.001 E.00746
G1 X107.305 Y115.072 E.01206
G1 X107.098 Y115.185 E.00569
G1 X106.922 Y115.405 E.0068
G1 X106.839 Y115.84 E.01066
G1 X106.837 Y117.046 E.02909
G1 X106.907 Y117.343 E.00735
G1 X107.097 Y117.579 E.00731
G1 X107.287 Y117.684 E.00524
G1 X107.8 Y117.762 E.01251
G1 X108.053 Y117.939 E.00746
G1 X108.231 Y118.192 E.00746
G1 X108.302 Y118.687 E.01206
G1 X108.414 Y118.895 E.0057
G1 X108.635 Y119.07 E.0068
G1 X109.07 Y119.153 E.01066
G1 X110.276 Y119.156 E.02908
G1 X110.572 Y119.086 E.00736
G1 X110.809 Y118.895 E.00731
G1 X110.914 Y118.705 E.00524
G1 X110.991 Y118.192 E.01251
G1 X111.169 Y117.939 E.00746
G1 X111.423 Y117.761 E.00746
G1 X111.954 Y117.656 E.01306
G1 X112.116 Y117.583 E.00429
G1 X112.304 Y117.362 E.007
G1 X112.385 Y117.016 E.00858
G1 X112.386 Y115.924 E.02632
M204 S10000
G1 X112 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.944 Y115.577 E.00706
G1 X111.814 Y115.453 E.00433
G1 X111.289 Y115.363 E.01284
G1 X110.94 Y115.14 E.01
G3 X110.629 Y114.703 I.684 J-.816 E.01307
G1 X110.545 Y114.192 E.01248
G1 X110.416 Y114.049 E.00467
G1 X110.04 Y113.992 E.00915
G1 X108.964 Y113.992 E.02596
G1 X108.786 Y114.062 E.00459
G1 X108.683 Y114.178 E.00376
G1 X108.593 Y114.703 E.01283
G1 X108.37 Y115.052 E.01
G3 X107.934 Y115.363 I-.817 J-.684 E.01305
G1 X107.422 Y115.447 E.0125
G1 X107.277 Y115.579 E.00473
G1 X107.225 Y115.948 E.009
G1 X107.222 Y117.03 E.02608
G1 X107.292 Y117.206 E.00457
G1 X107.408 Y117.31 E.00375
G1 X107.934 Y117.4 E.01286
G1 X108.282 Y117.623 E.00997
G3 X108.593 Y118.059 I-.684 J.817 E.01306
G1 X108.677 Y118.57 E.0125
G1 X108.809 Y118.716 E.00473
G1 X109.178 Y118.768 E.00899
G1 X110.26 Y118.77 E.02608
G1 X110.436 Y118.7 E.00457
G1 X110.54 Y118.584 E.00375
G1 X110.63 Y118.059 E.01286
G1 X110.853 Y117.711 E.00997
G3 X111.289 Y117.399 I.816 J.684 E.01308
G1 X111.794 Y117.305 E.01239
G1 X111.965 Y117.165 E.00533
G1 X112 Y116.887 E.00676
G1 X112 Y115.924 E.02322
M204 S10000
G1 X111.614 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.604 Y115.816 E.00119
G1 X111.156 Y115.725 E.01102
G1 X110.86 Y115.572 E.00803
G3 X110.267 Y114.836 I1.015 J-1.425 E.02309
G1 X110.141 Y114.38 E.01142
G2 X109.047 Y114.378 I-.812 J193.093 E.02638
G1 X108.955 Y114.836 E.01126
G1 X108.802 Y115.132 E.00803
G3 X108.067 Y115.725 I-1.426 J-1.016 E.02306
G1 X107.611 Y115.841 E.01136
G1 X107.608 Y116.946 E.02663
G1 X108.067 Y117.038 E.01129
G1 X108.362 Y117.19 E.00801
G3 X108.955 Y117.925 I-1.016 J1.425 E.02305
G1 X109.071 Y118.382 E.01136
G1 X110.175 Y118.384 E.02663
G1 X110.268 Y117.925 E.01129
G1 X110.42 Y117.63 E.00801
G3 X111.156 Y117.037 I1.425 J1.016 E.02308
G1 X111.614 Y116.953 E.01122
G1 X111.614 Y115.924 E.02481
M204 S10000
G1 X111.229 Y116.136 F42000
G1 F9600
M204 S4000
G1 X111.023 Y116.087 E.00509
G1 X110.643 Y115.891 E.01032
G3 X109.905 Y114.969 I1.265 J-1.768 E.02883
G1 X109.857 Y114.764 E.00508
G1 X109.366 Y114.764 E.01184
G1 X109.317 Y114.969 E.00509
G1 X109.121 Y115.35 E.01033
G3 X108.201 Y116.086 I-1.768 J-1.265 E.02878
G1 X107.996 Y116.135 E.00508
G1 X107.995 Y116.626 E.01186
G1 X108.201 Y116.676 E.00511
G1 X108.58 Y116.872 E.0103
G3 X109.316 Y117.792 I-1.266 J1.768 E.02877
G1 X109.364 Y117.997 E.00508
G1 X109.856 Y117.998 E.01186
G1 X109.906 Y117.792 E.00511
G1 X110.102 Y117.412 E.0103
G3 X111.023 Y116.676 I1.767 J1.265 E.02881
G1 X111.228 Y116.633 E.00505
G1 X111.229 Y116.196 E.01053
M204 S10000
G1 X110.759 Y116.381 F42000
G1 F9600
M204 S4000
G1 X110.425 Y116.209 E.00905
G3 X109.783 Y115.567 I1.627 J-2.269 E.02198
G1 X109.611 Y115.234 E.00906
G1 X109.439 Y115.567 E.00906
G1 X109.1 Y115.958 E.01248
G3 X108.464 Y116.381 I-1.282 J-1.238 E.01856
G1 X108.798 Y116.554 E.00907
G3 X109.439 Y117.195 I-1.63 J2.27 E.02195
G1 X109.611 Y117.529 E.00907
G1 X109.784 Y117.195 E.00907
G3 X110.425 Y116.553 I2.27 J1.629 E.02197
G1 X110.705 Y116.409 E.00761
M204 S10000
G1 X109.967 Y116.381 F42000
; LINE_WIDTH: 0.502306
G1 F9600
M204 S4000
G1 X109.611 Y116.025 E.01472
G1 X109.255 Y116.381 E.01472
G1 X109.611 Y116.737 E.01472
G1 X109.924 Y116.424 E.01297
; WIPE_START
G1 X109.611 Y116.737 E-.17248
G1 X109.255 Y116.381 E-.19582
G1 X109.611 Y116.025 E-.19585
G1 X109.967 Y116.381 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.761 Y118.897 Z1.72 F42000
G1 X98.585 Y120.355 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.771 Y115.89 Z1.72 F42000
G1 Z1.32
M73 P49 R8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X97.653 Y115.254 I-4.068 J.426 E.01563
G1 X97.373 Y114.904 E.0108
G1 X97.05 Y114.728 E.00888
G1 X96.537 Y114.666 E.01245
G1 X96.349 Y114.501 E.00602
G1 X96.273 Y113.965 E.01307
G1 X96.088 Y113.619 E.00946
G1 X95.739 Y113.339 E.01078
G1 X95.245 Y113.221 E.01224
G1 X93.956 Y113.221 E.03108
G2 X93.485 Y113.334 I.171 J1.752 E.01172
G1 X93.134 Y113.619 E.01089
G1 X92.958 Y113.943 E.0089
G1 X92.896 Y114.455 E.01245
G1 X92.731 Y114.643 E.00602
G1 X92.194 Y114.72 E.01307
G1 X91.849 Y114.905 E.00946
G1 X91.569 Y115.254 E.0108
G1 X91.454 Y115.723 E.01164
G1 X91.451 Y117.037 E.03168
G2 X91.564 Y117.508 I1.752 J-.171 E.01172
G1 X91.849 Y117.858 E.01089
G1 X92.173 Y118.035 E.0089
G1 X92.685 Y118.097 E.01246
G1 X92.873 Y118.261 E.00602
G1 X92.949 Y118.798 E.01307
G1 X93.135 Y119.144 E.00946
G1 X93.484 Y119.424 E.0108
G1 X93.953 Y119.538 E.01164
G1 X95.267 Y119.541 E.03168
G2 X95.738 Y119.429 I-.171 J-1.752 E.01172
G1 X96.088 Y119.144 E.01089
G1 X96.264 Y118.82 E.0089
G1 X96.327 Y118.307 E.01246
G1 X96.491 Y118.119 E.00602
G1 X96.917 Y118.071 E.01033
G1 X97.349 Y117.877 E.01141
G1 X97.642 Y117.537 E.01082
G1 X97.766 Y117.098 E.01101
G2 X97.771 Y115.95 I-76.532 J-.955 E.02766
M204 S10000
G1 X97.386 Y115.89 F42000
G1 F9600
M204 S4000
G1 X97.298 Y115.427 E.01136
G1 X97.12 Y115.206 E.00685
G1 X96.931 Y115.103 E.00519
G1 X96.414 Y115.031 E.01259
G1 X96.145 Y114.847 E.00787
G1 X95.961 Y114.578 E.00787
G1 X95.897 Y114.079 E.01213
G1 X95.785 Y113.871 E.00571
G1 X95.565 Y113.694 E.0068
G1 X95.102 Y113.607 E.01136
G1 X93.972 Y113.607 E.02724
G1 X93.673 Y113.678 E.00742
G1 X93.437 Y113.87 E.00735
G1 X93.333 Y114.061 E.00524
G1 X93.261 Y114.578 E.01258
G1 X93.077 Y114.847 E.00787
G1 X92.808 Y115.031 E.00785
G1 X92.309 Y115.096 E.01214
G1 X92.1 Y115.207 E.00571
G1 X91.923 Y115.429 E.00684
G1 X91.839 Y115.866 E.01073
G1 X91.837 Y117.021 E.02786
G1 X91.908 Y117.319 E.0074
G1 X92.1 Y117.556 E.00735
G1 X92.291 Y117.66 E.00524
G1 X92.808 Y117.731 E.0126
G1 X93.077 Y117.915 E.00785
G1 X93.261 Y118.184 E.00785
G1 X93.326 Y118.683 E.01214
G1 X93.437 Y118.892 E.00571
G1 X93.659 Y119.069 E.00684
G1 X94.096 Y119.153 E.01073
G1 X95.251 Y119.156 E.02786
G1 X95.549 Y119.085 E.0074
G1 X95.786 Y118.892 E.00735
G1 X95.89 Y118.702 E.00524
G1 X95.961 Y118.184 E.0126
G1 X96.145 Y117.915 E.00785
G1 X96.414 Y117.731 E.00787
G1 X96.951 Y117.633 E.01316
G1 X97.113 Y117.56 E.00427
G1 X97.303 Y117.339 E.00704
G1 X97.385 Y116.991 E.00864
G1 X97.386 Y115.95 E.02509
M204 S10000
G1 X97 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.943 Y115.601 E.0071
G1 X96.813 Y115.477 E.00433
G1 X96.292 Y115.397 E.01272
G1 X96.063 Y115.285 E.00615
G1 X95.708 Y114.929 E.01212
G1 X95.595 Y114.701 E.00615
G1 X95.521 Y114.194 E.01235
G1 X95.391 Y114.049 E.00468
G1 X95 Y113.992 E.00952
G1 X93.989 Y113.992 E.0244
G1 X93.811 Y114.063 E.00461
G1 X93.707 Y114.179 E.00376
G1 X93.627 Y114.701 E.01272
G1 X93.515 Y114.929 E.00615
G1 X93.16 Y115.284 E.01211
G1 X92.931 Y115.397 E.00613
G1 X92.424 Y115.472 E.01238
G1 X92.277 Y115.603 E.00474
G1 X92.225 Y115.988 E.00937
G1 X92.222 Y117.005 E.02452
G1 X92.293 Y117.182 E.00459
G1 X92.409 Y117.285 E.00376
G1 X92.931 Y117.366 E.01274
G1 X93.306 Y117.598 E.01062
G3 X93.627 Y118.061 I-.677 J.812 E.01375
G1 X93.702 Y118.569 E.01238
G1 X93.833 Y118.715 E.00474
G1 X94.218 Y118.768 E.00937
G1 X95.235 Y118.77 E.02452
G1 X95.411 Y118.7 E.00459
G1 X95.515 Y118.583 E.00376
G1 X95.596 Y118.061 E.01274
G1 X95.828 Y117.687 E.01062
G3 X96.292 Y117.366 I.812 J.677 E.01377
G1 X96.793 Y117.281 E.01226
G1 X96.965 Y117.141 E.00533
G1 X97 Y116.844 E.00722
G1 X97 Y115.95 E.02155
M204 S10000
G1 X96.614 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.604 Y115.842 E.00119
G1 X96.169 Y115.763 E.01067
G1 X95.849 Y115.605 E.0086
G3 X95.23 Y114.823 I.992 J-1.421 E.0244
G1 X95.115 Y114.38 E.01105
G2 X94.073 Y114.378 I-.776 J174.754 E.02512
G1 X93.992 Y114.823 E.01091
G1 X93.835 Y115.144 E.00861
G3 X93.054 Y115.762 I-1.422 J-.992 E.02437
G1 X92.611 Y115.867 E.011
G1 X92.608 Y116.92 E.02537
G1 X93.054 Y117 E.01093
G1 X93.374 Y117.157 E.00859
G3 X93.992 Y117.938 I-.993 J1.421 E.02436
G1 X94.097 Y118.382 E.011
G1 X95.149 Y118.384 E.02537
G1 X95.23 Y117.938 E.01093
G1 X95.387 Y117.619 E.00859
G3 X96.169 Y117 I1.421 J.993 E.02439
G1 X96.614 Y116.927 E.01087
G1 X96.614 Y115.95 E.02357
M204 S10000
G1 X96.229 Y116.169 F42000
G1 F9600
M204 S4000
G1 X96.046 Y116.128 E.0045
G1 X95.635 Y115.926 E.01106
G3 X94.864 Y114.946 I1.238 J-1.766 E.03051
G1 X94.825 Y114.764 E.00449
G1 X94.398 Y114.764 E.01029
G1 X94.358 Y114.946 E.0045
G1 X94.156 Y115.358 E.01106
G3 X93.177 Y116.128 I-1.766 J-1.238 E.03046
G1 X92.996 Y116.167 E.00448
G1 X92.995 Y116.594 E.01031
G1 X93.177 Y116.635 E.00451
G1 X93.588 Y116.837 E.01104
G3 X94.358 Y117.815 I-1.239 J1.766 E.03045
G1 X94.397 Y117.997 E.00448
G1 X94.824 Y117.998 E.01031
G1 X94.865 Y117.815 E.00451
G1 X95.067 Y117.404 E.01104
G3 X96.046 Y116.634 I1.766 J1.239 E.03048
G1 X96.228 Y116.6 E.00447
G1 X96.229 Y116.229 E.00896
M204 S10000
G1 X95.694 Y116.381 F42000
G1 F9600
M204 S4000
G1 X95.42 Y116.247 E.00736
G1 X95.01 Y115.894 E.01306
G1 X94.745 Y115.572 E.01005
G1 X94.611 Y115.298 E.00736
G1 X94.477 Y115.572 E.00736
G1 X94.124 Y115.983 E.01306
G1 X93.802 Y116.246 E.01003
G1 X93.528 Y116.381 E.00737
G1 X93.802 Y116.516 E.00737
G1 X94.213 Y116.869 E.01304
G1 X94.476 Y117.19 E.01003
G1 X94.611 Y117.464 E.00737
G1 X94.746 Y117.19 E.00737
G1 X95.099 Y116.78 E.01304
G1 X95.42 Y116.516 E.01004
G1 X95.64 Y116.408 E.00591
M204 S10000
G1 X94.942 Y116.381 F42000
; LINE_WIDTH: 0.467946
G1 F9600
M204 S4000
G1 X94.611 Y116.051 E.01267
G1 X94.281 Y116.381 E.01267
G1 X94.611 Y116.712 E.01267
G1 X94.899 Y116.424 E.01104
; WIPE_START
G1 X94.611 Y116.712 E-.1711
G1 X94.281 Y116.381 E-.19629
G1 X94.611 Y116.051 E-.1963
G1 X94.942 Y116.381 E-.19631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.34 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.678 E.04321
G2 X96.665 Y113.866 I-.604 J1.593 E.04265
G2 X95.28 Y112.821 I-1.507 J.557 E.04762
G2 X93.663 Y112.85 I-.679 J7.061 E.04214
G2 X92.51 Y114.28 I.333 J1.448 E.05146
G2 X92.112 Y114.324 I-.075 J1.148 E.01045
G2 X90.991 Y113.646 I-1.469 J1.165 E.03479
G1 X90.991 Y115.309 E.04321
; WIPE_START
G1 X90.991 Y113.646 E-.63181
G1 X91.306 Y113.765 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.789 Y112.444 Z1.72 F42000
G1 X83.585 Y112.408 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.771 Y115.917 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X82.651 Y115.276 I-4.033 J.421 E.01576
G1 X82.369 Y114.926 E.01083
G1 X82.02 Y114.742 E.00951
G1 X81.478 Y114.664 E.01321
G1 X81.305 Y114.466 E.00635
G1 X81.25 Y113.972 E.01199
G1 X81.066 Y113.623 E.00951
G1 X80.717 Y113.341 E.01083
G1 X80.22 Y113.221 E.01233
G1 X78.981 Y113.221 E.02987
G2 X78.507 Y113.335 I.174 J1.759 E.0118
G1 X78.157 Y113.623 E.01093
G1 X77.972 Y113.972 E.00952
G1 X77.894 Y114.514 E.01322
G1 X77.696 Y114.687 E.00634
G1 X77.202 Y114.742 E.01199
G1 X76.853 Y114.926 E.00951
G1 X76.57 Y115.276 E.01085
G1 X76.454 Y115.748 E.01172
G1 X76.451 Y117.012 E.03048
G2 X76.565 Y117.485 I1.76 J-.174 E.01179
G1 X76.853 Y117.836 E.01093
G1 X77.202 Y118.02 E.00952
G1 X77.744 Y118.098 E.01322
G1 X77.917 Y118.296 E.00634
G1 X77.972 Y118.79 E.01199
G1 X78.156 Y119.139 E.00951
G1 X78.506 Y119.422 E.01085
G1 X78.978 Y119.538 E.01172
G1 X80.242 Y119.541 E.03048
G2 X80.715 Y119.427 I-.174 J-1.759 E.01179
G1 X81.066 Y119.14 E.01093
G1 X81.25 Y118.791 E.00952
G1 X81.328 Y118.248 E.01322
G1 X81.526 Y118.075 E.00634
G1 X81.908 Y118.048 E.00924
G1 X82.344 Y117.855 E.01148
G1 X82.64 Y117.515 E.01088
G1 X82.765 Y117.073 E.01109
G2 X82.771 Y115.977 I-70.589 J-.918 E.02641
M204 S10000
G1 X82.386 Y115.917 F42000
G1 F9600
M204 S4000
G1 X82.297 Y115.451 E.01145
G1 X82.119 Y115.23 E.00683
G1 X81.906 Y115.118 E.00579
G1 X81.411 Y115.055 E.01204
G3 X80.914 Y114.468 I.295 J-.754 E.01934
G1 X80.874 Y114.086 E.00926
G1 X80.762 Y113.873 E.0058
G1 X80.542 Y113.695 E.00683
G1 X80.075 Y113.607 E.01146
G1 X78.997 Y113.607 E.02599
G1 X78.696 Y113.679 E.00747
G1 X78.461 Y113.872 E.00733
G1 X78.348 Y114.086 E.00584
G1 X78.285 Y114.581 E.01204
G3 X77.698 Y115.079 I-.754 J-.295 E.01935
G1 X77.316 Y115.118 E.00926
G1 X77.103 Y115.23 E.0058
G1 X76.924 Y115.452 E.00687
G1 X76.839 Y115.892 E.01081
G1 X76.837 Y116.996 E.02661
G1 X76.909 Y117.296 E.00745
G1 X77.101 Y117.531 E.00733
G1 X77.316 Y117.644 E.00584
G1 X77.812 Y117.707 E.01206
G3 X78.309 Y118.295 I-.296 J.754 E.01933
G1 X78.348 Y118.676 E.00926
G1 X78.46 Y118.889 E.0058
G1 X78.682 Y119.068 E.00687
G1 X79.122 Y119.153 E.01081
G1 X80.226 Y119.156 E.02661
G1 X80.526 Y119.084 E.00745
G1 X80.761 Y118.891 E.00733
G1 X80.874 Y118.677 E.00584
G1 X80.937 Y118.181 E.01206
G3 X81.551 Y117.682 I.747 J.291 E.01995
G1 X81.817 Y117.666 E.00642
G1 X82.11 Y117.537 E.00772
G1 X82.302 Y117.316 E.00707
G1 X82.385 Y117 E.00788
G1 X82.386 Y115.977 E.02466
M204 S10000
G1 X82 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.942 Y115.626 E.00717
G1 X81.792 Y115.494 E.00481
G1 X81.296 Y115.423 E.0121
G1 X81.055 Y115.309 E.00643
G3 X80.569 Y114.696 I.74 J-1.086 E.01915
G1 X80.498 Y114.2 E.01209
G1 X80.367 Y114.05 E.00481
G1 X79.959 Y113.992 E.00993
G1 X79.014 Y113.992 E.0228
G2 X78.724 Y114.2 I.04 J.362 E.00898
G1 X78.653 Y114.696 E.01209
G1 X78.539 Y114.938 E.00644
G3 X77.927 Y115.423 I-1.086 J-.741 E.01913
G1 X77.43 Y115.494 E.01211
G1 X77.278 Y115.628 E.00488
G1 X77.225 Y116.029 E.00977
G1 X77.222 Y116.98 E.02292
G1 X77.287 Y117.149 E.00438
G1 X77.43 Y117.268 E.00448
G1 X77.927 Y117.339 E.01212
G1 X78.168 Y117.453 E.00642
G3 X78.653 Y118.065 I-.741 J1.086 E.01912
G1 X78.724 Y118.562 E.01211
G1 X78.858 Y118.714 E.00488
G1 X79.259 Y118.768 E.00977
G1 X80.21 Y118.77 E.02292
G1 X80.379 Y118.705 E.00438
G1 X80.498 Y118.563 E.00448
G1 X80.569 Y118.065 E.01212
G1 X80.683 Y117.825 E.00642
G3 X81.296 Y117.339 I1.086 J.741 E.01914
G1 X81.81 Y117.248 E.0126
G1 X81.964 Y117.117 E.00486
G1 X82 Y116.798 E.00774
G1 X82 Y115.977 E.0198
M204 S10000
G1 X81.614 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.603 Y115.862 E.00135
G1 X81.181 Y115.791 E.01032
G1 X80.843 Y115.632 E.00901
G3 X80.201 Y114.812 I.984 J-1.432 E.02551
G1 X80.13 Y114.39 E.01031
G2 X79.093 Y114.378 I-.778 J23.214 E.02501
G1 X79.021 Y114.812 E.0106
G1 X78.862 Y115.149 E.00901
G3 X78.043 Y115.791 I-1.433 J-.984 E.02548
G1 X77.611 Y115.894 E.01071
G1 X77.608 Y116.899 E.02424
G1 X78.043 Y116.971 E.01062
G1 X78.38 Y117.131 E.00899
G3 X79.021 Y117.95 I-.985 J1.432 E.02547
G1 X79.124 Y118.382 E.01071
G1 X80.129 Y118.384 E.02424
G1 X80.201 Y117.95 E.01062
G1 X80.361 Y117.613 E.00899
G3 X81.181 Y116.971 I1.432 J.985 E.0255
G1 X81.614 Y116.906 E.01057
G1 X81.614 Y115.977 E.02239
M204 S10000
G1 X81.228 Y116.193 F42000
G1 F9600
M204 S4000
G1 X81.065 Y116.16 E.00401
G1 X80.631 Y115.954 E.01158
G1 X80.262 Y115.636 E.01176
G1 X80.038 Y115.361 E.00854
G1 X79.833 Y114.927 E.01158
G1 X79.799 Y114.764 E.00401
G1 X79.423 Y114.764 E.00907
G1 X79.389 Y114.927 E.00401
G1 X79.184 Y115.361 E.01158
G1 X78.866 Y115.73 E.01176
G1 X78.591 Y115.954 E.00853
G1 X78.158 Y116.159 E.01156
G1 X77.996 Y116.193 E.00401
G1 X77.995 Y116.57 E.00909
G1 X78.158 Y116.604 E.00403
G1 X78.591 Y116.809 E.01156
G1 X78.96 Y117.127 E.01175
G1 X79.184 Y117.401 E.00853
G1 X79.389 Y117.834 E.01156
G1 X79.422 Y117.997 E.00401
G1 X79.8 Y117.998 E.00909
G1 X79.833 Y117.834 E.00403
G1 X80.039 Y117.401 E.01156
G1 X80.357 Y117.032 E.01175
G1 X80.631 Y116.808 E.00854
G1 X81.065 Y116.603 E.01158
G1 X81.228 Y116.573 E.00399
G1 X81.228 Y116.253 E.00772
M204 S10000
G1 X80.641 Y116.381 F42000
G1 F9600
M204 S4000
G1 X80.42 Y116.276 E.00591
G1 X79.989 Y115.908 E.01366
G1 X79.716 Y115.572 E.01044
G1 X79.611 Y115.351 E.00591
G1 X79.506 Y115.572 E.00591
G1 X79.138 Y116.003 E.01366
G1 X78.803 Y116.276 E.01042
G1 X78.581 Y116.381 E.00592
G1 X78.803 Y116.487 E.00592
G1 X79.233 Y116.854 E.01364
G1 X79.506 Y117.189 E.01042
G1 X79.611 Y117.411 E.00592
G1 X79.716 Y117.189 E.00592
G1 X80.084 Y116.759 E.01364
G1 X80.42 Y116.486 E.01044
G1 X80.587 Y116.407 E.00446
M204 S10000
G1 X79.923 Y116.381 F42000
; LINE_WIDTH: 0.443266
G1 F9600
M204 S4000
G1 X79.611 Y116.07 E.01126
G1 X79.3 Y116.381 E.01126
G1 X79.611 Y116.693 E.01126
G1 X79.88 Y116.424 E.00973
; WIPE_START
G1 X79.611 Y116.693 E-.1699
G1 X79.3 Y116.381 E-.19668
G1 X79.611 Y116.07 E-.1967
G1 X79.923 Y116.381 E-.19672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.239 Y119.942 Z1.72 F42000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X80.254 Y119.942 E.0004
G2 X81.554 Y119.084 I-.084 J-1.541 E.04243
G1 X81.678 Y119.043 E.00339
G2 X83.016 Y117.698 I-7.133 J-8.431 E.04938
G1 X83.231 Y117.555 E.00673
G1 X83.231 Y113.571 E.10354
G2 X82.124 Y114.089 I.034 J1.518 E.03271
G1 X81.92 Y114.312 E.00785
G3 X81.697 Y114.263 I-.089 J-.126 E.00667
G2 X80.255 Y112.821 I-1.502 J.06 E.05826
G2 X78.687 Y112.85 I-.654 J6.836 E.04084
G2 X77.544 Y114.05 I.377 J1.505 E.04546
G2 X75.991 Y113.572 I-1.384 J1.735 E.04323
G1 X75.991 Y115.235 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 1.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y113.572 E-.63181
G1 X76.326 Y113.609 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/38
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S122.4
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.72 I-.273 J1.186 P1  F42000
G1 X105.637 Y120.355 Z1.72
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.88
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.88 F4000
            G39.3 S1
            G0 Z1.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.603 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y113.94 E.04321
G3 X106.706 Y114.495 I-1.961 J3.268 E.02357
G3 X107.486 Y114.256 I.735 J1.008 E.0216
G3 X108.638 Y112.85 I1.483 J.041 E.05085
G3 X110.305 Y112.821 I.963 J7.264 E.04343
G3 X111.613 Y113.694 I-.128 J1.608 E.04269
G3 X113.232 Y113.997 I.451 J2.061 E.04397
G1 X113.232 Y115.66 E.04321
M204 S10000
G1 X112.771 Y115.864 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X112.655 Y115.231 I-4.07 J.423 E.01554
G1 X112.377 Y114.883 E.01074
G1 X112.056 Y114.705 E.00885
G1 X111.556 Y114.639 E.01217
G1 X111.375 Y114.479 E.00583
G1 X111.296 Y113.958 E.01271
G1 X111.109 Y113.615 E.00943
M73 P50 R8
G1 X110.761 Y113.338 E.01072
G1 X110.27 Y113.221 E.01217
G1 X108.931 Y113.221 E.03229
G2 X108.463 Y113.332 I.168 J1.745 E.01165
G1 X108.113 Y113.614 E.01083
G1 X107.935 Y113.936 E.00887
G1 X107.869 Y114.437 E.01217
G1 X107.709 Y114.617 E.00583
G1 X107.188 Y114.697 E.01271
G1 X106.844 Y114.883 E.00943
G1 X106.567 Y115.232 E.01074
G1 X106.454 Y115.698 E.01156
G1 X106.451 Y117.062 E.03289
G2 X106.562 Y117.53 I1.743 J-.167 E.01164
G1 X106.844 Y117.88 E.01083
G1 X107.166 Y118.058 E.00887
G1 X107.667 Y118.123 E.01217
G1 X107.847 Y118.284 E.00582
G1 X107.926 Y118.804 E.0127
G1 X108.113 Y119.148 E.00943
G1 X108.462 Y119.425 E.01074
G1 X108.928 Y119.538 E.01157
G1 X110.292 Y119.541 E.03289
G2 X110.76 Y119.43 I-.168 J-1.745 E.01164
G1 X111.109 Y119.148 E.01083
G1 X111.287 Y118.826 E.00887
G1 X111.353 Y118.326 E.01217
G1 X111.514 Y118.145 E.00582
G1 X111.922 Y118.095 E.00992
G1 X112.353 Y117.899 E.01143
G1 X112.644 Y117.559 E.01077
G1 X112.766 Y117.123 E.01093
G2 X112.771 Y115.924 I-82.909 J-.995 E.0289
M204 S10000
G1 X112.386 Y115.864 F42000
G1 F9600
M204 S4000
G1 X112.299 Y115.404 E.01129
G1 X112.123 Y115.183 E.00682
G1 X111.935 Y115.079 E.00518
G1 X111.423 Y115.001 E.0125
G1 X111.169 Y114.823 E.00747
G1 X110.991 Y114.57 E.00746
G1 X110.865 Y113.973 E.01471
G2 X110.588 Y113.693 I-.826 J.54 E.00955
G1 X110.128 Y113.607 E.01129
G1 X108.947 Y113.607 E.02847
G1 X108.65 Y113.677 E.00737
G1 X108.414 Y113.867 E.00731
G1 X108.309 Y114.057 E.00524
G1 X108.231 Y114.57 E.0125
G1 X108.053 Y114.823 E.00747
G1 X107.8 Y115.001 E.00746
G1 X107.305 Y115.072 E.01206
G1 X107.098 Y115.185 E.00569
G1 X106.922 Y115.405 E.0068
G1 X106.839 Y115.84 E.01066
G1 X106.837 Y117.046 E.02909
G1 X106.907 Y117.343 E.00735
G1 X107.097 Y117.579 E.00731
G1 X107.287 Y117.684 E.00524
G1 X107.8 Y117.762 E.01251
G1 X108.053 Y117.939 E.00746
G1 X108.231 Y118.192 E.00746
G1 X108.302 Y118.687 E.01206
G1 X108.414 Y118.895 E.0057
G1 X108.635 Y119.07 E.0068
G1 X109.07 Y119.153 E.01066
G1 X110.276 Y119.156 E.02908
G1 X110.572 Y119.086 E.00736
G1 X110.809 Y118.895 E.00731
G1 X110.914 Y118.705 E.00524
G1 X110.991 Y118.192 E.01251
G1 X111.169 Y117.939 E.00746
G1 X111.423 Y117.761 E.00746
G1 X111.954 Y117.656 E.01306
G1 X112.116 Y117.583 E.00429
G1 X112.304 Y117.362 E.007
G1 X112.385 Y117.016 E.00858
G1 X112.386 Y115.924 E.02632
M204 S10000
G1 X112 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.944 Y115.577 E.00706
G1 X111.814 Y115.453 E.00433
G1 X111.289 Y115.363 E.01284
G1 X110.94 Y115.14 E.01
G3 X110.629 Y114.703 I.684 J-.816 E.01307
G1 X110.545 Y114.192 E.01248
G1 X110.416 Y114.049 E.00467
G1 X110.04 Y113.992 E.00915
G1 X108.964 Y113.992 E.02596
G1 X108.786 Y114.062 E.00459
G1 X108.683 Y114.178 E.00376
G1 X108.593 Y114.703 E.01283
G1 X108.37 Y115.052 E.01
G3 X107.934 Y115.363 I-.817 J-.684 E.01305
G1 X107.422 Y115.447 E.0125
G1 X107.277 Y115.579 E.00473
G1 X107.225 Y115.948 E.009
G1 X107.222 Y117.03 E.02608
G1 X107.292 Y117.206 E.00457
G1 X107.408 Y117.31 E.00375
G1 X107.934 Y117.4 E.01286
G1 X108.282 Y117.623 E.00997
G3 X108.593 Y118.059 I-.684 J.817 E.01306
G1 X108.677 Y118.57 E.0125
G1 X108.809 Y118.716 E.00473
G1 X109.178 Y118.768 E.00899
G1 X110.26 Y118.77 E.02608
G1 X110.436 Y118.7 E.00457
G1 X110.54 Y118.584 E.00375
G1 X110.63 Y118.059 E.01286
G1 X110.853 Y117.711 E.00997
G3 X111.289 Y117.399 I.816 J.684 E.01308
G1 X111.794 Y117.305 E.01239
G1 X111.965 Y117.165 E.00533
G1 X112 Y116.887 E.00676
G1 X112 Y115.924 E.02322
M204 S10000
G1 X111.614 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.604 Y115.816 E.00119
G1 X111.156 Y115.725 E.01102
G1 X110.86 Y115.572 E.00803
G3 X110.267 Y114.836 I1.015 J-1.425 E.02309
G1 X110.141 Y114.38 E.01142
G2 X109.047 Y114.378 I-.812 J193.093 E.02638
G1 X108.955 Y114.836 E.01126
G1 X108.802 Y115.132 E.00803
G3 X108.067 Y115.725 I-1.426 J-1.016 E.02306
G1 X107.611 Y115.841 E.01136
G1 X107.608 Y116.946 E.02663
G1 X108.067 Y117.038 E.01129
G1 X108.362 Y117.19 E.00801
G3 X108.955 Y117.925 I-1.016 J1.425 E.02305
G1 X109.071 Y118.382 E.01136
G1 X110.175 Y118.384 E.02663
G1 X110.268 Y117.925 E.01129
G1 X110.42 Y117.63 E.00801
G3 X111.156 Y117.037 I1.425 J1.016 E.02308
G1 X111.614 Y116.953 E.01122
G1 X111.614 Y115.924 E.02481
M204 S10000
G1 X111.229 Y116.136 F42000
G1 F9600
M204 S4000
G1 X111.023 Y116.087 E.00509
G1 X110.643 Y115.891 E.01032
G3 X109.905 Y114.969 I1.265 J-1.768 E.02883
G1 X109.857 Y114.764 E.00508
G1 X109.366 Y114.764 E.01184
G1 X109.317 Y114.969 E.00509
G1 X109.121 Y115.35 E.01033
G3 X108.201 Y116.086 I-1.768 J-1.265 E.02878
G1 X107.996 Y116.135 E.00508
G1 X107.995 Y116.626 E.01186
G1 X108.201 Y116.676 E.00511
G1 X108.58 Y116.872 E.0103
G3 X109.316 Y117.792 I-1.266 J1.768 E.02877
G1 X109.364 Y117.997 E.00508
G1 X109.856 Y117.998 E.01186
G1 X109.906 Y117.792 E.00511
G1 X110.102 Y117.412 E.0103
G3 X111.023 Y116.676 I1.767 J1.265 E.02881
G1 X111.228 Y116.633 E.00505
G1 X111.229 Y116.196 E.01053
M204 S10000
G1 X110.759 Y116.381 F42000
G1 F9600
M204 S4000
G1 X110.425 Y116.209 E.00905
G3 X109.783 Y115.567 I1.627 J-2.269 E.02198
G1 X109.611 Y115.234 E.00906
G1 X109.439 Y115.567 E.00906
G1 X109.1 Y115.958 E.01248
G3 X108.464 Y116.381 I-1.282 J-1.238 E.01856
G1 X108.798 Y116.554 E.00907
G3 X109.439 Y117.195 I-1.63 J2.27 E.02195
G1 X109.611 Y117.529 E.00907
G1 X109.784 Y117.195 E.00907
G3 X110.425 Y116.553 I2.27 J1.629 E.02197
G1 X110.705 Y116.409 E.00761
M204 S10000
G1 X109.967 Y116.381 F42000
; LINE_WIDTH: 0.502306
G1 F9600
M204 S4000
G1 X109.611 Y116.025 E.01472
G1 X109.255 Y116.381 E.01472
G1 X109.611 Y116.737 E.01472
G1 X109.924 Y116.424 E.01297
; WIPE_START
G1 X109.611 Y116.737 E-.17248
G1 X109.255 Y116.381 E-.19582
G1 X109.611 Y116.025 E-.19585
G1 X109.967 Y116.381 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.761 Y118.897 Z1.88 F42000
G1 X98.585 Y120.355 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.771 Y115.89 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X97.653 Y115.254 I-4.068 J.426 E.01563
G1 X97.373 Y114.904 E.0108
G1 X97.05 Y114.728 E.00888
G1 X96.537 Y114.666 E.01245
G1 X96.349 Y114.501 E.00602
G1 X96.273 Y113.965 E.01307
G1 X96.088 Y113.619 E.00946
G1 X95.739 Y113.339 E.01078
G1 X95.245 Y113.221 E.01224
G1 X93.956 Y113.221 E.03108
G2 X93.485 Y113.334 I.171 J1.752 E.01172
G1 X93.134 Y113.619 E.01089
G1 X92.958 Y113.943 E.0089
G1 X92.896 Y114.455 E.01245
G1 X92.731 Y114.643 E.00602
G1 X92.194 Y114.72 E.01307
G1 X91.849 Y114.905 E.00946
G1 X91.569 Y115.254 E.0108
G1 X91.454 Y115.723 E.01164
G1 X91.451 Y117.037 E.03168
G2 X91.564 Y117.508 I1.752 J-.171 E.01172
G1 X91.849 Y117.858 E.01089
G1 X92.173 Y118.035 E.0089
G1 X92.685 Y118.097 E.01246
G1 X92.873 Y118.261 E.00602
G1 X92.949 Y118.798 E.01307
G1 X93.135 Y119.144 E.00946
G1 X93.484 Y119.424 E.0108
G1 X93.953 Y119.538 E.01164
G1 X95.267 Y119.541 E.03168
G2 X95.738 Y119.429 I-.171 J-1.752 E.01172
G1 X96.088 Y119.144 E.01089
G1 X96.264 Y118.82 E.0089
G1 X96.327 Y118.307 E.01246
G1 X96.491 Y118.119 E.00602
G1 X96.917 Y118.071 E.01033
G1 X97.349 Y117.877 E.01141
G1 X97.642 Y117.537 E.01082
G1 X97.766 Y117.098 E.01101
G2 X97.771 Y115.95 I-76.532 J-.955 E.02766
M204 S10000
G1 X97.386 Y115.89 F42000
G1 F9600
M204 S4000
G1 X97.298 Y115.427 E.01136
G1 X97.12 Y115.206 E.00685
G1 X96.931 Y115.103 E.00519
G1 X96.414 Y115.031 E.01259
G1 X96.145 Y114.847 E.00787
G1 X95.961 Y114.578 E.00787
G1 X95.897 Y114.079 E.01213
G1 X95.785 Y113.871 E.00571
G1 X95.565 Y113.694 E.0068
G1 X95.102 Y113.607 E.01136
G1 X93.972 Y113.607 E.02724
G1 X93.673 Y113.678 E.00742
G1 X93.437 Y113.87 E.00735
G1 X93.333 Y114.061 E.00524
G1 X93.261 Y114.578 E.01258
G1 X93.077 Y114.847 E.00787
G1 X92.808 Y115.031 E.00785
G1 X92.309 Y115.096 E.01214
G1 X92.1 Y115.207 E.00571
G1 X91.923 Y115.429 E.00684
G1 X91.839 Y115.866 E.01073
G1 X91.837 Y117.021 E.02786
G1 X91.908 Y117.319 E.0074
G1 X92.1 Y117.556 E.00735
G1 X92.291 Y117.66 E.00524
G1 X92.808 Y117.731 E.0126
G1 X93.077 Y117.915 E.00785
G1 X93.261 Y118.184 E.00785
G1 X93.326 Y118.683 E.01214
G1 X93.437 Y118.892 E.00571
G1 X93.659 Y119.069 E.00684
G1 X94.096 Y119.153 E.01073
G1 X95.251 Y119.156 E.02786
G1 X95.549 Y119.085 E.0074
G1 X95.786 Y118.892 E.00735
G1 X95.89 Y118.702 E.00524
G1 X95.961 Y118.184 E.0126
G1 X96.145 Y117.915 E.00785
G1 X96.414 Y117.731 E.00787
G1 X96.951 Y117.633 E.01316
G1 X97.113 Y117.56 E.00427
G1 X97.303 Y117.339 E.00704
G1 X97.385 Y116.991 E.00864
G1 X97.386 Y115.95 E.02509
M204 S10000
G1 X97 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.943 Y115.601 E.0071
G1 X96.813 Y115.477 E.00433
G1 X96.292 Y115.397 E.01272
G1 X96.063 Y115.285 E.00615
G1 X95.708 Y114.929 E.01212
G1 X95.595 Y114.701 E.00615
G1 X95.521 Y114.194 E.01235
G1 X95.391 Y114.049 E.00468
G1 X95 Y113.992 E.00952
G1 X93.989 Y113.992 E.0244
G1 X93.811 Y114.063 E.00461
G1 X93.707 Y114.179 E.00376
G1 X93.627 Y114.701 E.01272
G1 X93.515 Y114.929 E.00615
G1 X93.16 Y115.284 E.01211
G1 X92.931 Y115.397 E.00613
G1 X92.424 Y115.472 E.01238
G1 X92.277 Y115.603 E.00474
G1 X92.225 Y115.988 E.00937
G1 X92.222 Y117.005 E.02452
G1 X92.293 Y117.182 E.00459
G1 X92.409 Y117.285 E.00376
G1 X92.931 Y117.366 E.01274
G1 X93.306 Y117.598 E.01062
G3 X93.627 Y118.061 I-.677 J.812 E.01375
G1 X93.702 Y118.569 E.01238
G1 X93.833 Y118.715 E.00474
G1 X94.218 Y118.768 E.00937
G1 X95.235 Y118.77 E.02452
G1 X95.411 Y118.7 E.00459
G1 X95.515 Y118.583 E.00376
G1 X95.596 Y118.061 E.01274
G1 X95.828 Y117.687 E.01062
G3 X96.292 Y117.366 I.812 J.677 E.01377
G1 X96.793 Y117.281 E.01226
G1 X96.965 Y117.141 E.00533
G1 X97 Y116.844 E.00722
G1 X97 Y115.95 E.02155
M204 S10000
G1 X96.614 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.604 Y115.842 E.00119
G1 X96.169 Y115.763 E.01067
G1 X95.849 Y115.605 E.0086
G3 X95.23 Y114.823 I.992 J-1.421 E.0244
G1 X95.115 Y114.38 E.01105
G2 X94.073 Y114.378 I-.776 J174.754 E.02512
G1 X93.992 Y114.823 E.01091
G1 X93.835 Y115.144 E.00861
G3 X93.054 Y115.762 I-1.422 J-.992 E.02437
G1 X92.611 Y115.867 E.011
G1 X92.608 Y116.92 E.02537
G1 X93.054 Y117 E.01093
G1 X93.374 Y117.157 E.00859
G3 X93.992 Y117.938 I-.993 J1.421 E.02436
G1 X94.097 Y118.382 E.011
G1 X95.149 Y118.384 E.02537
G1 X95.23 Y117.938 E.01093
G1 X95.387 Y117.619 E.00859
G3 X96.169 Y117 I1.421 J.993 E.02439
G1 X96.614 Y116.927 E.01087
G1 X96.614 Y115.95 E.02357
M204 S10000
G1 X96.229 Y116.169 F42000
G1 F9600
M204 S4000
G1 X96.046 Y116.128 E.0045
G1 X95.635 Y115.926 E.01106
G3 X94.864 Y114.946 I1.238 J-1.766 E.03051
G1 X94.825 Y114.764 E.00449
G1 X94.398 Y114.764 E.01029
G1 X94.358 Y114.946 E.0045
G1 X94.156 Y115.358 E.01106
G3 X93.177 Y116.128 I-1.766 J-1.238 E.03046
G1 X92.996 Y116.167 E.00448
G1 X92.995 Y116.594 E.01031
G1 X93.177 Y116.635 E.00451
G1 X93.588 Y116.837 E.01104
G3 X94.358 Y117.815 I-1.239 J1.766 E.03045
G1 X94.397 Y117.997 E.00448
G1 X94.824 Y117.998 E.01031
G1 X94.865 Y117.815 E.00451
G1 X95.067 Y117.404 E.01104
G3 X96.046 Y116.634 I1.766 J1.239 E.03048
G1 X96.228 Y116.6 E.00447
G1 X96.229 Y116.229 E.00896
M204 S10000
G1 X95.694 Y116.381 F42000
G1 F9600
M204 S4000
G1 X95.42 Y116.247 E.00736
G1 X95.01 Y115.894 E.01306
G1 X94.745 Y115.572 E.01005
G1 X94.611 Y115.298 E.00736
G1 X94.477 Y115.572 E.00736
G1 X94.124 Y115.983 E.01306
G1 X93.802 Y116.246 E.01003
G1 X93.528 Y116.381 E.00737
G1 X93.802 Y116.516 E.00737
G1 X94.213 Y116.869 E.01304
G1 X94.476 Y117.19 E.01003
G1 X94.611 Y117.464 E.00737
G1 X94.746 Y117.19 E.00737
G1 X95.099 Y116.78 E.01304
G1 X95.42 Y116.516 E.01004
G1 X95.64 Y116.408 E.00591
M204 S10000
G1 X94.942 Y116.381 F42000
; LINE_WIDTH: 0.467946
G1 F9600
M204 S4000
G1 X94.611 Y116.051 E.01267
G1 X94.281 Y116.381 E.01267
G1 X94.611 Y116.712 E.01267
G1 X94.899 Y116.424 E.01104
; WIPE_START
G1 X94.611 Y116.712 E-.1711
G1 X94.281 Y116.381 E-.19629
G1 X94.611 Y116.051 E-.1963
G1 X94.942 Y116.381 E-.19631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.363 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.7 E.04321
G2 X96.7 Y114.02 I-.43 J1.768 E.04204
G2 X95.28 Y112.821 I-1.431 J.254 E.0524
G2 X93.663 Y112.85 I-.679 J7.061 E.04214
G2 X92.51 Y114.28 I.333 J1.448 E.05146
G3 X91.935 Y114.057 I-.159 J-.441 E.01748
G2 X90.991 Y113.68 I-1.51 J2.409 E.02658
G1 X90.991 Y115.343 E.04321
; WIPE_START
G1 X90.991 Y113.68 E-.63181
G1 X91.316 Y113.769 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.799 Y112.445 Z1.88 F42000
G1 X83.585 Y112.408 Z1.88
G1 Z1.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.771 Y115.917 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X82.651 Y115.276 I-4.033 J.421 E.01576
G1 X82.369 Y114.926 E.01083
G1 X82.02 Y114.742 E.00951
G1 X81.478 Y114.664 E.01321
G1 X81.305 Y114.466 E.00635
G1 X81.25 Y113.972 E.01199
G1 X81.066 Y113.623 E.00951
G1 X80.717 Y113.341 E.01083
G1 X80.22 Y113.221 E.01233
G1 X78.981 Y113.221 E.02987
G2 X78.507 Y113.335 I.174 J1.759 E.0118
G1 X78.157 Y113.623 E.01093
G1 X77.972 Y113.972 E.00952
G1 X77.894 Y114.514 E.01322
G1 X77.696 Y114.687 E.00634
G1 X77.202 Y114.742 E.01199
G1 X76.853 Y114.926 E.00951
G1 X76.57 Y115.276 E.01085
G1 X76.454 Y115.748 E.01172
M73 P51 R8
G1 X76.451 Y117.012 E.03048
G2 X76.565 Y117.485 I1.76 J-.174 E.01179
G1 X76.853 Y117.836 E.01093
G1 X77.202 Y118.02 E.00952
G1 X77.744 Y118.098 E.01322
G1 X77.917 Y118.296 E.00634
G1 X77.972 Y118.79 E.01199
G1 X78.156 Y119.139 E.00951
G1 X78.506 Y119.422 E.01085
G1 X78.978 Y119.538 E.01172
G1 X80.242 Y119.541 E.03048
G2 X80.715 Y119.427 I-.174 J-1.759 E.01179
G1 X81.066 Y119.14 E.01093
G1 X81.25 Y118.791 E.00952
G1 X81.328 Y118.248 E.01322
G1 X81.526 Y118.075 E.00634
G1 X81.908 Y118.048 E.00924
G1 X82.344 Y117.855 E.01148
G1 X82.64 Y117.515 E.01088
G1 X82.765 Y117.073 E.01109
G2 X82.771 Y115.977 I-70.589 J-.918 E.02641
M204 S10000
G1 X82.386 Y115.917 F42000
G1 F9600
M204 S4000
G1 X82.297 Y115.451 E.01145
G1 X82.119 Y115.23 E.00683
G1 X81.906 Y115.118 E.00579
G1 X81.411 Y115.055 E.01204
G3 X80.914 Y114.468 I.295 J-.754 E.01934
G1 X80.874 Y114.086 E.00926
G1 X80.762 Y113.873 E.0058
G1 X80.542 Y113.695 E.00683
G1 X80.075 Y113.607 E.01146
G1 X78.997 Y113.607 E.02599
G1 X78.696 Y113.679 E.00747
G1 X78.461 Y113.872 E.00733
G1 X78.348 Y114.086 E.00584
G1 X78.285 Y114.581 E.01204
G3 X77.698 Y115.079 I-.754 J-.295 E.01935
G1 X77.316 Y115.118 E.00926
G1 X77.103 Y115.23 E.0058
G1 X76.924 Y115.452 E.00687
G1 X76.839 Y115.892 E.01081
G1 X76.837 Y116.996 E.02661
G1 X76.909 Y117.296 E.00745
G1 X77.101 Y117.531 E.00733
G1 X77.316 Y117.644 E.00584
G1 X77.812 Y117.707 E.01206
G3 X78.309 Y118.295 I-.296 J.754 E.01933
G1 X78.348 Y118.676 E.00926
G1 X78.46 Y118.889 E.0058
G1 X78.682 Y119.068 E.00687
G1 X79.122 Y119.153 E.01081
G1 X80.226 Y119.156 E.02661
G1 X80.526 Y119.084 E.00745
G1 X80.761 Y118.891 E.00733
G1 X80.874 Y118.677 E.00584
G1 X80.937 Y118.181 E.01206
G3 X81.551 Y117.682 I.747 J.291 E.01995
G1 X81.817 Y117.666 E.00642
G1 X82.11 Y117.537 E.00772
G1 X82.302 Y117.316 E.00707
G1 X82.385 Y117 E.00788
G1 X82.386 Y115.977 E.02466
M204 S10000
G1 X82 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.942 Y115.626 E.00717
G1 X81.792 Y115.494 E.00481
G1 X81.296 Y115.423 E.0121
G1 X81.055 Y115.309 E.00643
G3 X80.569 Y114.696 I.74 J-1.086 E.01915
G1 X80.498 Y114.2 E.01209
G1 X80.367 Y114.05 E.00481
G1 X79.959 Y113.992 E.00993
G1 X79.014 Y113.992 E.0228
G2 X78.724 Y114.2 I.04 J.362 E.00898
G1 X78.653 Y114.696 E.01209
G1 X78.539 Y114.938 E.00644
G3 X77.927 Y115.423 I-1.086 J-.741 E.01913
G1 X77.43 Y115.494 E.01211
G1 X77.278 Y115.628 E.00488
G1 X77.225 Y116.029 E.00977
G1 X77.222 Y116.98 E.02292
G1 X77.287 Y117.149 E.00438
G1 X77.43 Y117.268 E.00448
G1 X77.927 Y117.339 E.01212
G1 X78.168 Y117.453 E.00642
G3 X78.653 Y118.065 I-.741 J1.086 E.01912
G1 X78.724 Y118.562 E.01211
G1 X78.858 Y118.714 E.00488
G1 X79.259 Y118.768 E.00977
G1 X80.21 Y118.77 E.02292
G1 X80.379 Y118.705 E.00438
G1 X80.498 Y118.563 E.00448
G1 X80.569 Y118.065 E.01212
G1 X80.683 Y117.825 E.00642
G3 X81.296 Y117.339 I1.086 J.741 E.01914
G1 X81.81 Y117.248 E.0126
G1 X81.964 Y117.117 E.00486
G1 X82 Y116.798 E.00774
G1 X82 Y115.977 E.0198
M204 S10000
G1 X81.614 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.603 Y115.862 E.00135
G1 X81.181 Y115.791 E.01032
G1 X80.843 Y115.632 E.00901
G3 X80.201 Y114.812 I.984 J-1.432 E.02551
G1 X80.13 Y114.39 E.01031
G2 X79.093 Y114.378 I-.778 J23.214 E.02501
G1 X79.021 Y114.812 E.0106
G1 X78.862 Y115.149 E.00901
G3 X78.043 Y115.791 I-1.433 J-.984 E.02548
G1 X77.611 Y115.894 E.01071
G1 X77.608 Y116.899 E.02424
G1 X78.043 Y116.971 E.01062
G1 X78.38 Y117.131 E.00899
G3 X79.021 Y117.95 I-.985 J1.432 E.02547
G1 X79.124 Y118.382 E.01071
G1 X80.129 Y118.384 E.02424
G1 X80.201 Y117.95 E.01062
G1 X80.361 Y117.613 E.00899
G3 X81.181 Y116.971 I1.432 J.985 E.0255
G1 X81.614 Y116.906 E.01057
G1 X81.614 Y115.977 E.02239
M204 S10000
G1 X81.228 Y116.193 F42000
G1 F9600
M204 S4000
G1 X81.065 Y116.16 E.00401
G1 X80.631 Y115.954 E.01158
G1 X80.262 Y115.636 E.01176
G1 X80.038 Y115.361 E.00854
G1 X79.833 Y114.927 E.01158
G1 X79.799 Y114.764 E.00401
G1 X79.423 Y114.764 E.00907
G1 X79.389 Y114.927 E.00401
G1 X79.184 Y115.361 E.01158
G1 X78.866 Y115.73 E.01176
G1 X78.591 Y115.954 E.00853
G1 X78.158 Y116.159 E.01156
G1 X77.996 Y116.193 E.00401
G1 X77.995 Y116.57 E.00909
G1 X78.158 Y116.604 E.00403
G1 X78.591 Y116.809 E.01156
G1 X78.96 Y117.127 E.01175
G1 X79.184 Y117.401 E.00853
G1 X79.389 Y117.834 E.01156
G1 X79.422 Y117.997 E.00401
G1 X79.8 Y117.998 E.00909
G1 X79.833 Y117.834 E.00403
G1 X80.039 Y117.401 E.01156
G1 X80.357 Y117.032 E.01175
G1 X80.631 Y116.808 E.00854
G1 X81.065 Y116.603 E.01158
G1 X81.228 Y116.573 E.00399
G1 X81.228 Y116.253 E.00772
M204 S10000
G1 X80.641 Y116.381 F42000
G1 F9600
M204 S4000
G1 X80.42 Y116.276 E.00591
G1 X79.989 Y115.908 E.01366
G1 X79.716 Y115.572 E.01044
G1 X79.611 Y115.351 E.00591
G1 X79.506 Y115.572 E.00591
G1 X79.138 Y116.003 E.01366
G1 X78.803 Y116.276 E.01042
G1 X78.581 Y116.381 E.00592
G1 X78.803 Y116.487 E.00592
G1 X79.233 Y116.854 E.01364
G1 X79.506 Y117.189 E.01042
G1 X79.611 Y117.411 E.00592
G1 X79.716 Y117.189 E.00592
G1 X80.084 Y116.759 E.01364
G1 X80.42 Y116.486 E.01044
G1 X80.587 Y116.407 E.00446
M204 S10000
G1 X79.923 Y116.381 F42000
; LINE_WIDTH: 0.443266
G1 F9600
M204 S4000
G1 X79.611 Y116.07 E.01126
G1 X79.3 Y116.381 E.01126
G1 X79.611 Y116.693 E.01126
G1 X79.88 Y116.424 E.00973
; WIPE_START
G1 X79.611 Y116.693 E-.1699
G1 X79.3 Y116.381 E-.19668
G1 X79.611 Y116.07 E-.1967
G1 X79.923 Y116.381 E-.19672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.463 Y119.925 Z1.88 F42000
G1 Z1.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X81.637 Y118.909 I-.373 J-1.618 E.042
G3 X82.231 Y118.366 I21.455 J22.906 E.02091
G2 X83.142 Y117.305 I-.652 J-1.481 E.03759
G2 X83.172 Y115.737 I-6.81 J-.914 E.04085
G2 X82.07 Y114.339 I-1.587 J.117 E.0491
G3 X83.231 Y113.673 I1.606 J1.456 E.03537
G1 X83.231 Y112.761 E.02371
G1 X75.991 Y112.761 E.18819
G1 X75.991 Y113.686 E.02405
G3 X77.551 Y113.996 I.404 J2.049 E.04241
G2 X77.525 Y114.263 I17.593 J1.806 E.00698
G2 X76.361 Y114.888 I.16 J1.697 E.03527
; CHANGE_LAYER
; Z_HEIGHT: 1.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.648 Y114.573 E-.16186
G1 X77.084 Y114.355 E-.18526
G1 X77.525 Y114.263 E-.17131
G1 X77.551 Y113.996 E-.10205
G1 X77.228 Y113.821 E-.13951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/38
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z1.88 I-.273 J1.186 P1  F42000
G1 X105.637 Y120.355 Z1.88
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.04
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.04 F4000
            G39.3 S1
            G0 Z2.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.548 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y113.885 E.04321
G3 X106.797 Y114.446 I-1.278 J2.696 E.02566
G3 X107.486 Y114.256 I.632 J.946 E.01889
G3 X108.638 Y112.85 I1.483 J.041 E.05085
G3 X110.305 Y112.821 I.963 J7.264 E.04343
G3 X111.662 Y113.786 I-.135 J1.626 E.04543
G3 X113.232 Y113.93 I.617 J1.903 E.04211
G1 X113.232 Y115.593 E.04321
M204 S10000
G1 X112.771 Y115.864 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X112.655 Y115.231 I-4.07 J.423 E.01554
G1 X112.377 Y114.883 E.01074
G1 X112.056 Y114.705 E.00885
G1 X111.556 Y114.639 E.01217
G1 X111.375 Y114.479 E.00583
G1 X111.296 Y113.958 E.01271
G1 X111.109 Y113.615 E.00943
G1 X110.761 Y113.338 E.01072
G1 X110.27 Y113.221 E.01217
G1 X108.931 Y113.221 E.03229
G2 X108.463 Y113.332 I.168 J1.745 E.01165
G1 X108.113 Y113.614 E.01083
G1 X107.935 Y113.936 E.00887
G1 X107.869 Y114.437 E.01217
G1 X107.709 Y114.617 E.00583
G1 X107.188 Y114.697 E.01271
G1 X106.844 Y114.883 E.00943
G1 X106.567 Y115.232 E.01074
G1 X106.454 Y115.698 E.01156
G1 X106.451 Y117.062 E.03289
G2 X106.562 Y117.53 I1.743 J-.167 E.01164
G1 X106.844 Y117.88 E.01083
G1 X107.166 Y118.058 E.00887
G1 X107.667 Y118.123 E.01217
G1 X107.847 Y118.284 E.00582
G1 X107.926 Y118.804 E.0127
G1 X108.113 Y119.148 E.00943
G1 X108.462 Y119.425 E.01074
G1 X108.928 Y119.538 E.01157
G1 X110.292 Y119.541 E.03289
G2 X110.76 Y119.43 I-.168 J-1.745 E.01164
G1 X111.109 Y119.148 E.01083
G1 X111.287 Y118.826 E.00887
G1 X111.353 Y118.326 E.01217
G1 X111.514 Y118.145 E.00582
G1 X111.922 Y118.095 E.00992
G1 X112.353 Y117.899 E.01143
G1 X112.644 Y117.559 E.01077
G1 X112.766 Y117.123 E.01093
G2 X112.771 Y115.924 I-82.909 J-.995 E.0289
M204 S10000
G1 X112.386 Y115.864 F42000
G1 F9600
M204 S4000
G1 X112.299 Y115.404 E.01129
G1 X112.123 Y115.183 E.00682
G1 X111.935 Y115.079 E.00518
G1 X111.423 Y115.001 E.0125
G1 X111.169 Y114.823 E.00747
G1 X110.991 Y114.57 E.00746
G1 X110.865 Y113.973 E.01471
G2 X110.588 Y113.693 I-.826 J.54 E.00955
G1 X110.128 Y113.607 E.01129
G1 X108.947 Y113.607 E.02847
G1 X108.65 Y113.677 E.00737
G1 X108.414 Y113.867 E.00731
G1 X108.309 Y114.057 E.00524
G1 X108.231 Y114.57 E.0125
G1 X108.053 Y114.823 E.00747
G1 X107.8 Y115.001 E.00746
G1 X107.305 Y115.072 E.01206
G1 X107.098 Y115.185 E.00569
G1 X106.922 Y115.405 E.0068
G1 X106.839 Y115.84 E.01066
G1 X106.837 Y117.046 E.02909
G1 X106.907 Y117.343 E.00735
G1 X107.097 Y117.579 E.00731
G1 X107.287 Y117.684 E.00524
G1 X107.8 Y117.762 E.01251
G1 X108.053 Y117.939 E.00746
G1 X108.231 Y118.192 E.00746
G1 X108.302 Y118.687 E.01206
G1 X108.414 Y118.895 E.0057
G1 X108.635 Y119.07 E.0068
G1 X109.07 Y119.153 E.01066
G1 X110.276 Y119.156 E.02908
G1 X110.572 Y119.086 E.00736
G1 X110.809 Y118.895 E.00731
G1 X110.914 Y118.705 E.00524
G1 X110.991 Y118.192 E.01251
G1 X111.169 Y117.939 E.00746
G1 X111.423 Y117.761 E.00746
G1 X111.954 Y117.656 E.01306
G1 X112.116 Y117.583 E.00429
G1 X112.304 Y117.362 E.007
G1 X112.385 Y117.016 E.00858
G1 X112.386 Y115.924 E.02632
M204 S10000
G1 X112 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.944 Y115.577 E.00706
G1 X111.814 Y115.453 E.00433
G1 X111.289 Y115.363 E.01284
G1 X110.94 Y115.14 E.01
G3 X110.629 Y114.703 I.684 J-.816 E.01307
G1 X110.545 Y114.192 E.01248
G1 X110.416 Y114.049 E.00467
G1 X110.04 Y113.992 E.00915
G1 X108.964 Y113.992 E.02596
G1 X108.786 Y114.062 E.00459
G1 X108.683 Y114.178 E.00376
G1 X108.593 Y114.703 E.01283
G1 X108.37 Y115.052 E.01
G3 X107.934 Y115.363 I-.817 J-.684 E.01305
G1 X107.422 Y115.447 E.0125
G1 X107.277 Y115.579 E.00473
G1 X107.225 Y115.948 E.009
G1 X107.222 Y117.03 E.02608
G1 X107.292 Y117.206 E.00457
G1 X107.408 Y117.31 E.00375
G1 X107.934 Y117.4 E.01286
G1 X108.282 Y117.623 E.00997
G3 X108.593 Y118.059 I-.684 J.817 E.01306
G1 X108.677 Y118.57 E.0125
G1 X108.809 Y118.716 E.00473
G1 X109.178 Y118.768 E.00899
G1 X110.26 Y118.77 E.02608
G1 X110.436 Y118.7 E.00457
G1 X110.54 Y118.584 E.00375
G1 X110.63 Y118.059 E.01286
G1 X110.853 Y117.711 E.00997
G3 X111.289 Y117.399 I.816 J.684 E.01308
G1 X111.794 Y117.305 E.01239
G1 X111.965 Y117.165 E.00533
G1 X112 Y116.887 E.00676
G1 X112 Y115.924 E.02322
M204 S10000
G1 X111.614 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.604 Y115.816 E.00119
G1 X111.156 Y115.725 E.01102
G1 X110.86 Y115.572 E.00803
G3 X110.267 Y114.836 I1.015 J-1.425 E.02309
G1 X110.141 Y114.38 E.01142
G2 X109.047 Y114.378 I-.812 J193.093 E.02638
G1 X108.955 Y114.836 E.01126
G1 X108.802 Y115.132 E.00803
G3 X108.067 Y115.725 I-1.426 J-1.016 E.02306
G1 X107.611 Y115.841 E.01136
G1 X107.608 Y116.946 E.02663
G1 X108.067 Y117.038 E.01129
G1 X108.362 Y117.19 E.00801
G3 X108.955 Y117.925 I-1.016 J1.425 E.02305
G1 X109.071 Y118.382 E.01136
G1 X110.175 Y118.384 E.02663
G1 X110.268 Y117.925 E.01129
G1 X110.42 Y117.63 E.00801
G3 X111.156 Y117.037 I1.425 J1.016 E.02308
G1 X111.614 Y116.953 E.01122
G1 X111.614 Y115.924 E.02481
M204 S10000
G1 X111.229 Y116.136 F42000
G1 F9600
M204 S4000
G1 X111.023 Y116.087 E.00509
G1 X110.643 Y115.891 E.01032
G3 X109.905 Y114.969 I1.265 J-1.768 E.02883
G1 X109.857 Y114.764 E.00508
G1 X109.366 Y114.764 E.01184
G1 X109.317 Y114.969 E.00509
G1 X109.121 Y115.35 E.01033
G3 X108.201 Y116.086 I-1.768 J-1.265 E.02878
G1 X107.996 Y116.135 E.00508
G1 X107.995 Y116.626 E.01186
G1 X108.201 Y116.676 E.00511
G1 X108.58 Y116.872 E.0103
G3 X109.316 Y117.792 I-1.266 J1.768 E.02877
G1 X109.364 Y117.997 E.00508
G1 X109.856 Y117.998 E.01186
G1 X109.906 Y117.792 E.00511
G1 X110.102 Y117.412 E.0103
G3 X111.023 Y116.676 I1.767 J1.265 E.02881
G1 X111.228 Y116.633 E.00505
G1 X111.229 Y116.196 E.01053
M204 S10000
G1 X110.759 Y116.381 F42000
G1 F9600
M204 S4000
G1 X110.425 Y116.209 E.00905
G3 X109.783 Y115.567 I1.627 J-2.269 E.02198
G1 X109.611 Y115.234 E.00906
G1 X109.439 Y115.567 E.00906
G1 X109.1 Y115.958 E.01248
G3 X108.464 Y116.381 I-1.282 J-1.238 E.01856
G1 X108.798 Y116.554 E.00907
G3 X109.439 Y117.195 I-1.63 J2.27 E.02195
G1 X109.611 Y117.529 E.00907
G1 X109.784 Y117.195 E.00907
G3 X110.425 Y116.553 I2.27 J1.629 E.02197
G1 X110.705 Y116.409 E.00761
M204 S10000
G1 X109.967 Y116.381 F42000
; LINE_WIDTH: 0.502306
G1 F9600
M204 S4000
G1 X109.611 Y116.025 E.01472
G1 X109.255 Y116.381 E.01472
G1 X109.611 Y116.737 E.01472
G1 X109.924 Y116.424 E.01297
; WIPE_START
G1 X109.611 Y116.737 E-.17248
G1 X109.255 Y116.381 E-.19582
G1 X109.611 Y116.025 E-.19585
G1 X109.967 Y116.381 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.761 Y118.897 Z2.04 F42000
G1 X98.585 Y120.355 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
M73 P52 R8
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.771 Y115.89 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X97.653 Y115.254 I-4.068 J.426 E.01563
G1 X97.373 Y114.904 E.0108
G1 X97.05 Y114.728 E.00888
G1 X96.537 Y114.666 E.01245
G1 X96.349 Y114.501 E.00602
G1 X96.273 Y113.965 E.01307
G1 X96.088 Y113.619 E.00946
G1 X95.739 Y113.339 E.01078
G1 X95.245 Y113.221 E.01224
G1 X93.956 Y113.221 E.03108
G2 X93.485 Y113.334 I.171 J1.752 E.01172
G1 X93.134 Y113.619 E.01089
G1 X92.958 Y113.943 E.0089
G1 X92.896 Y114.455 E.01245
G1 X92.731 Y114.643 E.00602
G1 X92.194 Y114.72 E.01307
G1 X91.849 Y114.905 E.00946
G1 X91.569 Y115.254 E.0108
G1 X91.454 Y115.723 E.01164
G1 X91.451 Y117.037 E.03168
G2 X91.564 Y117.508 I1.752 J-.171 E.01172
G1 X91.849 Y117.858 E.01089
G1 X92.173 Y118.035 E.0089
G1 X92.685 Y118.097 E.01246
G1 X92.873 Y118.261 E.00602
G1 X92.949 Y118.798 E.01307
G1 X93.135 Y119.144 E.00946
G1 X93.484 Y119.424 E.0108
G1 X93.953 Y119.538 E.01164
G1 X95.267 Y119.541 E.03168
G2 X95.738 Y119.429 I-.171 J-1.752 E.01172
G1 X96.088 Y119.144 E.01089
G1 X96.264 Y118.82 E.0089
G1 X96.327 Y118.307 E.01246
G1 X96.491 Y118.119 E.00602
G1 X96.917 Y118.071 E.01033
G1 X97.349 Y117.877 E.01141
G1 X97.642 Y117.537 E.01082
G1 X97.766 Y117.098 E.01101
G2 X97.771 Y115.95 I-76.532 J-.955 E.02766
M204 S10000
G1 X97.386 Y115.89 F42000
G1 F9600
M204 S4000
G1 X97.298 Y115.427 E.01136
G1 X97.12 Y115.206 E.00685
G1 X96.931 Y115.103 E.00519
G1 X96.414 Y115.031 E.01259
G1 X96.145 Y114.847 E.00787
G1 X95.961 Y114.578 E.00787
G1 X95.897 Y114.079 E.01213
G1 X95.785 Y113.871 E.00571
G1 X95.565 Y113.694 E.0068
G1 X95.102 Y113.607 E.01136
G1 X93.972 Y113.607 E.02724
G1 X93.673 Y113.678 E.00742
G1 X93.437 Y113.87 E.00735
G1 X93.333 Y114.061 E.00524
G1 X93.261 Y114.578 E.01258
G1 X93.077 Y114.847 E.00787
G1 X92.808 Y115.031 E.00785
G1 X92.309 Y115.096 E.01214
G1 X92.1 Y115.207 E.00571
G1 X91.923 Y115.429 E.00684
G1 X91.839 Y115.866 E.01073
G1 X91.837 Y117.021 E.02786
G1 X91.908 Y117.319 E.0074
G1 X92.1 Y117.556 E.00735
G1 X92.291 Y117.66 E.00524
G1 X92.808 Y117.731 E.0126
G1 X93.077 Y117.915 E.00785
G1 X93.261 Y118.184 E.00785
G1 X93.326 Y118.683 E.01214
G1 X93.437 Y118.892 E.00571
G1 X93.659 Y119.069 E.00684
G1 X94.096 Y119.153 E.01073
G1 X95.251 Y119.156 E.02786
G1 X95.549 Y119.085 E.0074
G1 X95.786 Y118.892 E.00735
G1 X95.89 Y118.702 E.00524
G1 X95.961 Y118.184 E.0126
G1 X96.145 Y117.915 E.00785
G1 X96.414 Y117.731 E.00787
G1 X96.951 Y117.633 E.01316
G1 X97.113 Y117.56 E.00427
G1 X97.303 Y117.339 E.00704
G1 X97.385 Y116.991 E.00864
G1 X97.386 Y115.95 E.02509
M204 S10000
G1 X97 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.943 Y115.601 E.0071
G1 X96.813 Y115.477 E.00433
G1 X96.292 Y115.397 E.01272
G1 X96.063 Y115.285 E.00615
G1 X95.708 Y114.929 E.01212
G1 X95.595 Y114.701 E.00615
G1 X95.521 Y114.194 E.01235
G1 X95.391 Y114.049 E.00468
G1 X95 Y113.992 E.00952
G1 X93.989 Y113.992 E.0244
G1 X93.811 Y114.063 E.00461
G1 X93.707 Y114.179 E.00376
G1 X93.627 Y114.701 E.01272
G1 X93.515 Y114.929 E.00615
G1 X93.16 Y115.284 E.01211
G1 X92.931 Y115.397 E.00613
G1 X92.424 Y115.472 E.01238
G1 X92.277 Y115.603 E.00474
G1 X92.225 Y115.988 E.00937
G1 X92.222 Y117.005 E.02452
G1 X92.293 Y117.182 E.00459
G1 X92.409 Y117.285 E.00376
G1 X92.931 Y117.366 E.01274
G1 X93.306 Y117.598 E.01062
G3 X93.627 Y118.061 I-.677 J.812 E.01375
G1 X93.702 Y118.569 E.01238
G1 X93.833 Y118.715 E.00474
G1 X94.218 Y118.768 E.00937
G1 X95.235 Y118.77 E.02452
G1 X95.411 Y118.7 E.00459
G1 X95.515 Y118.583 E.00376
G1 X95.596 Y118.061 E.01274
G1 X95.828 Y117.687 E.01062
G3 X96.292 Y117.366 I.812 J.677 E.01377
G1 X96.793 Y117.281 E.01226
G1 X96.965 Y117.141 E.00533
G1 X97 Y116.844 E.00722
G1 X97 Y115.95 E.02155
M204 S10000
G1 X96.614 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.604 Y115.842 E.00119
G1 X96.169 Y115.763 E.01067
G1 X95.849 Y115.605 E.0086
G3 X95.23 Y114.823 I.992 J-1.421 E.0244
G1 X95.115 Y114.38 E.01105
G2 X94.073 Y114.378 I-.776 J174.754 E.02512
G1 X93.992 Y114.823 E.01091
G1 X93.835 Y115.144 E.00861
G3 X93.054 Y115.762 I-1.422 J-.992 E.02437
G1 X92.611 Y115.867 E.011
G1 X92.608 Y116.92 E.02537
G1 X93.054 Y117 E.01093
G1 X93.374 Y117.157 E.00859
G3 X93.992 Y117.938 I-.993 J1.421 E.02436
G1 X94.097 Y118.382 E.011
G1 X95.149 Y118.384 E.02537
G1 X95.23 Y117.938 E.01093
G1 X95.387 Y117.619 E.00859
G3 X96.169 Y117 I1.421 J.993 E.02439
G1 X96.614 Y116.927 E.01087
G1 X96.614 Y115.95 E.02357
M204 S10000
G1 X96.229 Y116.169 F42000
G1 F9600
M204 S4000
G1 X96.046 Y116.128 E.0045
G1 X95.635 Y115.926 E.01106
G3 X94.864 Y114.946 I1.238 J-1.766 E.03051
G1 X94.825 Y114.764 E.00449
G1 X94.398 Y114.764 E.01029
G1 X94.358 Y114.946 E.0045
G1 X94.156 Y115.358 E.01106
G3 X93.177 Y116.128 I-1.766 J-1.238 E.03046
G1 X92.996 Y116.167 E.00448
G1 X92.995 Y116.594 E.01031
G1 X93.177 Y116.635 E.00451
G1 X93.588 Y116.837 E.01104
G3 X94.358 Y117.815 I-1.239 J1.766 E.03045
G1 X94.397 Y117.997 E.00448
G1 X94.824 Y117.998 E.01031
G1 X94.865 Y117.815 E.00451
G1 X95.067 Y117.404 E.01104
G3 X96.046 Y116.634 I1.766 J1.239 E.03048
G1 X96.228 Y116.6 E.00447
G1 X96.229 Y116.229 E.00896
M204 S10000
G1 X95.694 Y116.381 F42000
G1 F9600
M204 S4000
G1 X95.42 Y116.247 E.00736
G1 X95.01 Y115.894 E.01306
G1 X94.745 Y115.572 E.01005
G1 X94.611 Y115.298 E.00736
G1 X94.477 Y115.572 E.00736
G1 X94.124 Y115.983 E.01306
G1 X93.802 Y116.246 E.01003
G1 X93.528 Y116.381 E.00737
G1 X93.802 Y116.516 E.00737
G1 X94.213 Y116.869 E.01304
G1 X94.476 Y117.19 E.01003
G1 X94.611 Y117.464 E.00737
G1 X94.746 Y117.19 E.00737
G1 X95.099 Y116.78 E.01304
G1 X95.42 Y116.516 E.01004
G1 X95.64 Y116.408 E.00591
M204 S10000
G1 X94.942 Y116.381 F42000
; LINE_WIDTH: 0.467946
G1 F9600
M204 S4000
G1 X94.611 Y116.051 E.01267
G1 X94.281 Y116.381 E.01267
G1 X94.611 Y116.712 E.01267
G1 X94.899 Y116.424 E.01104
; WIPE_START
G1 X94.611 Y116.712 E-.1711
G1 X94.281 Y116.381 E-.19629
G1 X94.611 Y116.051 E-.1963
G1 X94.942 Y116.381 E-.19631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.374 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.711 E.04321
G2 X96.708 Y114.173 I-.234 J1.972 E.04259
G2 X95.28 Y112.821 I-1.496 J.149 E.05572
G2 X93.663 Y112.85 I-.679 J7.061 E.04214
G2 X92.51 Y114.28 I.333 J1.448 E.05146
G1 X92.358 Y114.287 E.00396
G2 X90.991 Y113.701 I-1.491 J1.592 E.03944
G1 X90.991 Y115.364 E.04321
; WIPE_START
G1 X90.991 Y113.701 E-.63181
G1 X91.323 Y113.758 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.804 Y112.446 Z2.04 F42000
G1 X83.585 Y112.408 Z2.04
G1 Z1.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.771 Y115.917 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X82.651 Y115.276 I-4.033 J.421 E.01576
G1 X82.369 Y114.926 E.01083
G1 X82.02 Y114.742 E.00951
G1 X81.478 Y114.664 E.01321
G1 X81.305 Y114.466 E.00635
G1 X81.25 Y113.972 E.01199
G1 X81.066 Y113.623 E.00951
G1 X80.717 Y113.341 E.01083
G1 X80.22 Y113.221 E.01233
G1 X78.981 Y113.221 E.02987
G2 X78.507 Y113.335 I.174 J1.759 E.0118
G1 X78.157 Y113.623 E.01093
G1 X77.972 Y113.972 E.00952
G1 X77.894 Y114.514 E.01322
G1 X77.696 Y114.687 E.00634
G1 X77.202 Y114.742 E.01199
G1 X76.853 Y114.926 E.00951
G1 X76.57 Y115.276 E.01085
G1 X76.454 Y115.748 E.01172
G1 X76.451 Y117.012 E.03048
G2 X76.565 Y117.485 I1.76 J-.174 E.01179
G1 X76.853 Y117.836 E.01093
G1 X77.202 Y118.02 E.00952
G1 X77.744 Y118.098 E.01322
G1 X77.917 Y118.296 E.00634
G1 X77.972 Y118.79 E.01199
G1 X78.156 Y119.139 E.00951
G1 X78.506 Y119.422 E.01085
G1 X78.978 Y119.538 E.01172
G1 X80.242 Y119.541 E.03048
G2 X80.715 Y119.427 I-.174 J-1.759 E.01179
G1 X81.066 Y119.14 E.01093
G1 X81.25 Y118.791 E.00952
G1 X81.328 Y118.248 E.01322
G1 X81.526 Y118.075 E.00634
G1 X81.908 Y118.048 E.00924
G1 X82.344 Y117.855 E.01148
G1 X82.64 Y117.515 E.01088
G1 X82.765 Y117.073 E.01109
G2 X82.771 Y115.977 I-70.589 J-.918 E.02641
M204 S10000
G1 X82.386 Y115.917 F42000
G1 F9600
M204 S4000
G1 X82.297 Y115.451 E.01145
G1 X82.119 Y115.23 E.00683
G1 X81.906 Y115.118 E.00579
G1 X81.411 Y115.055 E.01204
G3 X80.914 Y114.468 I.295 J-.754 E.01934
G1 X80.874 Y114.086 E.00926
G1 X80.762 Y113.873 E.0058
G1 X80.542 Y113.695 E.00683
G1 X80.075 Y113.607 E.01146
G1 X78.997 Y113.607 E.02599
G1 X78.696 Y113.679 E.00747
G1 X78.461 Y113.872 E.00733
G1 X78.348 Y114.086 E.00584
G1 X78.285 Y114.581 E.01204
G3 X77.698 Y115.079 I-.754 J-.295 E.01935
G1 X77.316 Y115.118 E.00926
G1 X77.103 Y115.23 E.0058
G1 X76.924 Y115.452 E.00687
G1 X76.839 Y115.892 E.01081
G1 X76.837 Y116.996 E.02661
G1 X76.909 Y117.296 E.00745
G1 X77.101 Y117.531 E.00733
G1 X77.316 Y117.644 E.00584
G1 X77.812 Y117.707 E.01206
G3 X78.309 Y118.295 I-.296 J.754 E.01933
G1 X78.348 Y118.676 E.00926
G1 X78.46 Y118.889 E.0058
G1 X78.682 Y119.068 E.00687
G1 X79.122 Y119.153 E.01081
G1 X80.226 Y119.156 E.02661
G1 X80.526 Y119.084 E.00745
G1 X80.761 Y118.891 E.00733
G1 X80.874 Y118.677 E.00584
G1 X80.937 Y118.181 E.01206
G3 X81.551 Y117.682 I.747 J.291 E.01995
G1 X81.817 Y117.666 E.00642
G1 X82.11 Y117.537 E.00772
G1 X82.302 Y117.316 E.00707
G1 X82.385 Y117 E.00788
G1 X82.386 Y115.977 E.02466
M204 S10000
G1 X82 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.942 Y115.626 E.00717
G1 X81.792 Y115.494 E.00481
G1 X81.296 Y115.423 E.0121
G1 X81.055 Y115.309 E.00643
G3 X80.569 Y114.696 I.74 J-1.086 E.01915
G1 X80.498 Y114.2 E.01209
G1 X80.367 Y114.05 E.00481
G1 X79.959 Y113.992 E.00993
G1 X79.014 Y113.992 E.0228
G2 X78.724 Y114.2 I.04 J.362 E.00898
G1 X78.653 Y114.696 E.01209
G1 X78.539 Y114.938 E.00644
G3 X77.927 Y115.423 I-1.086 J-.741 E.01913
G1 X77.43 Y115.494 E.01211
G1 X77.278 Y115.628 E.00488
G1 X77.225 Y116.029 E.00977
G1 X77.222 Y116.98 E.02292
G1 X77.287 Y117.149 E.00438
G1 X77.43 Y117.268 E.00448
G1 X77.927 Y117.339 E.01212
G1 X78.168 Y117.453 E.00642
G3 X78.653 Y118.065 I-.741 J1.086 E.01912
G1 X78.724 Y118.562 E.01211
G1 X78.858 Y118.714 E.00488
G1 X79.259 Y118.768 E.00977
G1 X80.21 Y118.77 E.02292
G1 X80.379 Y118.705 E.00438
G1 X80.498 Y118.563 E.00448
G1 X80.569 Y118.065 E.01212
G1 X80.683 Y117.825 E.00642
G3 X81.296 Y117.339 I1.086 J.741 E.01914
G1 X81.81 Y117.248 E.0126
G1 X81.964 Y117.117 E.00486
G1 X82 Y116.798 E.00774
G1 X82 Y115.977 E.0198
M204 S10000
G1 X81.614 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.603 Y115.862 E.00135
G1 X81.181 Y115.791 E.01032
G1 X80.843 Y115.632 E.00901
G3 X80.201 Y114.812 I.984 J-1.432 E.02551
G1 X80.13 Y114.39 E.01031
G2 X79.093 Y114.378 I-.778 J23.214 E.02501
G1 X79.021 Y114.812 E.0106
G1 X78.862 Y115.149 E.00901
G3 X78.043 Y115.791 I-1.433 J-.984 E.02548
G1 X77.611 Y115.894 E.01071
G1 X77.608 Y116.899 E.02424
G1 X78.043 Y116.971 E.01062
G1 X78.38 Y117.131 E.00899
G3 X79.021 Y117.95 I-.985 J1.432 E.02547
G1 X79.124 Y118.382 E.01071
G1 X80.129 Y118.384 E.02424
G1 X80.201 Y117.95 E.01062
G1 X80.361 Y117.613 E.00899
G3 X81.181 Y116.971 I1.432 J.985 E.0255
G1 X81.614 Y116.906 E.01057
G1 X81.614 Y115.977 E.02239
M204 S10000
G1 X81.228 Y116.193 F42000
G1 F9600
M204 S4000
G1 X81.065 Y116.16 E.00401
G1 X80.631 Y115.954 E.01158
G1 X80.262 Y115.636 E.01176
G1 X80.038 Y115.361 E.00854
G1 X79.833 Y114.927 E.01158
G1 X79.799 Y114.764 E.00401
G1 X79.423 Y114.764 E.00907
G1 X79.389 Y114.927 E.00401
G1 X79.184 Y115.361 E.01158
G1 X78.866 Y115.73 E.01176
G1 X78.591 Y115.954 E.00853
G1 X78.158 Y116.159 E.01156
G1 X77.996 Y116.193 E.00401
G1 X77.995 Y116.57 E.00909
G1 X78.158 Y116.604 E.00403
G1 X78.591 Y116.809 E.01156
G1 X78.96 Y117.127 E.01175
G1 X79.184 Y117.401 E.00853
G1 X79.389 Y117.834 E.01156
G1 X79.422 Y117.997 E.00401
G1 X79.8 Y117.998 E.00909
G1 X79.833 Y117.834 E.00403
G1 X80.039 Y117.401 E.01156
G1 X80.357 Y117.032 E.01175
G1 X80.631 Y116.808 E.00854
G1 X81.065 Y116.603 E.01158
G1 X81.228 Y116.573 E.00399
G1 X81.228 Y116.253 E.00772
M204 S10000
G1 X80.641 Y116.381 F42000
G1 F9600
M204 S4000
G1 X80.42 Y116.276 E.00591
G1 X79.989 Y115.908 E.01366
G1 X79.716 Y115.572 E.01044
G1 X79.611 Y115.351 E.00591
G1 X79.506 Y115.572 E.00591
G1 X79.138 Y116.003 E.01366
G1 X78.803 Y116.276 E.01042
G1 X78.581 Y116.381 E.00592
G1 X78.803 Y116.487 E.00592
G1 X79.233 Y116.854 E.01364
G1 X79.506 Y117.189 E.01042
G1 X79.611 Y117.411 E.00592
G1 X79.716 Y117.189 E.00592
G1 X80.084 Y116.759 E.01364
G1 X80.42 Y116.486 E.01044
G1 X80.587 Y116.407 E.00446
M204 S10000
G1 X79.923 Y116.381 F42000
; LINE_WIDTH: 0.443266
G1 F9600
M204 S4000
G1 X79.611 Y116.07 E.01126
G1 X79.3 Y116.381 E.01126
G1 X79.611 Y116.693 E.01126
G1 X79.88 Y116.424 E.00973
; WIPE_START
G1 X79.611 Y116.693 E-.1699
G1 X79.3 Y116.381 E-.19668
G1 X79.611 Y116.07 E-.1967
G1 X79.923 Y116.381 E-.19672
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.632 Y119.879 Z2.04 F42000
G1 Z1.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X81.677 Y118.735 I-.517 J-1.522 E.04201
G1 X81.972 Y118.446 E.01075
G2 X83.142 Y117.305 I-.391 J-1.571 E.04451
G2 X83.172 Y115.737 I-6.81 J-.914 E.04085
G2 X82.203 Y114.382 I-1.621 J.135 E.04547
G3 X83.231 Y113.76 I1.614 J1.507 E.03165
G1 X83.231 Y112.761 E.02596
G1 X75.991 Y112.761 E.18819
G1 X75.991 Y113.784 E.0266
G3 X77.565 Y113.935 I.611 J1.92 E.04225
G2 X77.525 Y114.263 I3.04 J.538 E.0086
G2 X76.401 Y114.84 I.16 J1.696 E.03364
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.648 Y114.573 E-.13814
G1 X77.037 Y114.373 E-.16635
G1 X77.525 Y114.263 E-.19014
G1 X77.565 Y113.935 E-.1256
G1 X77.227 Y113.79 E-.13976
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/38
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S124.95
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.04 I-.274 J1.186 P1  F42000
G1 X105.637 Y120.355 Z2.04
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X105.991 Y115.482 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y113.82 E.04321
G3 X106.896 Y114.394 I-.834 J2.316 E.02809
G3 X107.486 Y114.256 I.524 J.91 E.01596
G3 X108.638 Y112.85 I1.483 J.041 E.05085
G3 X110.305 Y112.821 I.963 J7.264 E.04343
G3 X111.689 Y113.863 I-.121 J1.6 E.04756
G3 X113.232 Y113.853 I.783 J1.781 E.04124
G1 X113.232 Y115.516 E.04321
M204 S10000
G1 X112.771 Y115.864 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X112.655 Y115.231 I-4.07 J.423 E.01554
G1 X112.377 Y114.883 E.01074
G1 X112.056 Y114.705 E.00885
G1 X111.556 Y114.639 E.01217
G1 X111.375 Y114.479 E.00583
G1 X111.296 Y113.958 E.01271
G1 X111.109 Y113.615 E.00943
G1 X110.761 Y113.338 E.01072
G1 X110.27 Y113.221 E.01217
G1 X108.931 Y113.221 E.03229
M73 P53 R8
G2 X108.463 Y113.332 I.168 J1.745 E.01165
G1 X108.113 Y113.614 E.01083
G1 X107.935 Y113.936 E.00887
G1 X107.869 Y114.437 E.01217
G1 X107.709 Y114.617 E.00583
G1 X107.188 Y114.697 E.01271
G1 X106.844 Y114.883 E.00943
G1 X106.567 Y115.232 E.01074
G1 X106.454 Y115.698 E.01156
G1 X106.451 Y117.062 E.03289
G2 X106.562 Y117.53 I1.743 J-.167 E.01164
G1 X106.844 Y117.88 E.01083
G1 X107.166 Y118.058 E.00887
G1 X107.667 Y118.123 E.01217
G1 X107.847 Y118.284 E.00582
G1 X107.926 Y118.804 E.0127
G1 X108.113 Y119.148 E.00943
G1 X108.462 Y119.425 E.01074
G1 X108.928 Y119.538 E.01157
G1 X110.292 Y119.541 E.03289
G2 X110.76 Y119.43 I-.168 J-1.745 E.01164
G1 X111.109 Y119.148 E.01083
G1 X111.287 Y118.826 E.00887
G1 X111.353 Y118.326 E.01217
G1 X111.514 Y118.145 E.00582
G1 X111.922 Y118.095 E.00992
G1 X112.353 Y117.899 E.01143
G1 X112.644 Y117.559 E.01077
G1 X112.766 Y117.123 E.01093
G2 X112.771 Y115.924 I-82.909 J-.995 E.0289
M204 S10000
G1 X112.386 Y115.864 F42000
G1 F9600
M204 S4000
G1 X112.299 Y115.404 E.01129
G1 X112.123 Y115.183 E.00682
G1 X111.935 Y115.079 E.00518
G1 X111.423 Y115.001 E.0125
G1 X111.169 Y114.823 E.00747
G1 X110.991 Y114.57 E.00746
G1 X110.865 Y113.973 E.01471
G2 X110.588 Y113.693 I-.826 J.54 E.00955
G1 X110.128 Y113.607 E.01129
G1 X108.947 Y113.607 E.02847
G1 X108.65 Y113.677 E.00737
G1 X108.414 Y113.867 E.00731
G1 X108.309 Y114.057 E.00524
G1 X108.231 Y114.57 E.0125
G1 X108.053 Y114.823 E.00747
G1 X107.8 Y115.001 E.00746
G1 X107.305 Y115.072 E.01206
G1 X107.098 Y115.185 E.00569
G1 X106.922 Y115.405 E.0068
G1 X106.839 Y115.84 E.01066
G1 X106.837 Y117.046 E.02909
G1 X106.907 Y117.343 E.00735
G1 X107.097 Y117.579 E.00731
G1 X107.287 Y117.684 E.00524
G1 X107.8 Y117.762 E.01251
G1 X108.053 Y117.939 E.00746
G1 X108.231 Y118.192 E.00746
G1 X108.302 Y118.687 E.01206
G1 X108.414 Y118.895 E.0057
G1 X108.635 Y119.07 E.0068
G1 X109.07 Y119.153 E.01066
G1 X110.276 Y119.156 E.02908
G1 X110.572 Y119.086 E.00736
G1 X110.809 Y118.895 E.00731
G1 X110.914 Y118.705 E.00524
G1 X110.991 Y118.192 E.01251
G1 X111.169 Y117.939 E.00746
G1 X111.423 Y117.761 E.00746
G1 X111.954 Y117.656 E.01306
G1 X112.116 Y117.583 E.00429
G1 X112.304 Y117.362 E.007
G1 X112.385 Y117.016 E.00858
G1 X112.386 Y115.924 E.02632
M204 S10000
G1 X112 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.944 Y115.577 E.00706
G1 X111.814 Y115.453 E.00433
G1 X111.289 Y115.363 E.01284
G1 X110.94 Y115.14 E.01
G3 X110.629 Y114.703 I.684 J-.816 E.01307
G1 X110.545 Y114.192 E.01248
G1 X110.416 Y114.049 E.00467
G1 X110.04 Y113.992 E.00915
G1 X108.964 Y113.992 E.02596
G1 X108.786 Y114.062 E.00459
G1 X108.683 Y114.178 E.00376
G1 X108.593 Y114.703 E.01283
G1 X108.37 Y115.052 E.01
G3 X107.934 Y115.363 I-.817 J-.684 E.01305
G1 X107.422 Y115.447 E.0125
G1 X107.277 Y115.579 E.00473
G1 X107.225 Y115.948 E.009
G1 X107.222 Y117.03 E.02608
G1 X107.292 Y117.206 E.00457
G1 X107.408 Y117.31 E.00375
G1 X107.934 Y117.4 E.01286
G1 X108.282 Y117.623 E.00997
G3 X108.593 Y118.059 I-.684 J.817 E.01306
G1 X108.677 Y118.57 E.0125
G1 X108.809 Y118.716 E.00473
G1 X109.178 Y118.768 E.00899
G1 X110.26 Y118.77 E.02608
G1 X110.436 Y118.7 E.00457
G1 X110.54 Y118.584 E.00375
G1 X110.63 Y118.059 E.01286
G1 X110.853 Y117.711 E.00997
G3 X111.289 Y117.399 I.816 J.684 E.01308
G1 X111.794 Y117.305 E.01239
G1 X111.965 Y117.165 E.00533
G1 X112 Y116.887 E.00676
G1 X112 Y115.924 E.02322
M204 S10000
G1 X111.614 Y115.864 F42000
G1 F9600
M204 S4000
G1 X111.604 Y115.816 E.00119
G1 X111.156 Y115.725 E.01102
G1 X110.86 Y115.572 E.00803
G3 X110.267 Y114.836 I1.015 J-1.425 E.02309
G1 X110.141 Y114.38 E.01142
G2 X109.047 Y114.378 I-.812 J193.093 E.02638
G1 X108.955 Y114.836 E.01126
G1 X108.802 Y115.132 E.00803
G3 X108.067 Y115.725 I-1.426 J-1.016 E.02306
G1 X107.611 Y115.841 E.01136
G1 X107.608 Y116.946 E.02663
G1 X108.067 Y117.038 E.01129
G1 X108.362 Y117.19 E.00801
G3 X108.955 Y117.925 I-1.016 J1.425 E.02305
G1 X109.071 Y118.382 E.01136
G1 X110.175 Y118.384 E.02663
G1 X110.268 Y117.925 E.01129
G1 X110.42 Y117.63 E.00801
G3 X111.156 Y117.037 I1.425 J1.016 E.02308
G1 X111.614 Y116.953 E.01122
G1 X111.614 Y115.924 E.02481
M204 S10000
G1 X111.229 Y116.136 F42000
G1 F9600
M204 S4000
G1 X111.023 Y116.087 E.00509
G1 X110.643 Y115.891 E.01032
G3 X109.905 Y114.969 I1.265 J-1.768 E.02883
G1 X109.857 Y114.764 E.00508
G1 X109.366 Y114.764 E.01184
G1 X109.317 Y114.969 E.00509
G1 X109.121 Y115.35 E.01033
G3 X108.201 Y116.086 I-1.768 J-1.265 E.02878
G1 X107.996 Y116.135 E.00508
G1 X107.995 Y116.626 E.01186
G1 X108.201 Y116.676 E.00511
G1 X108.58 Y116.872 E.0103
G3 X109.316 Y117.792 I-1.266 J1.768 E.02877
G1 X109.364 Y117.997 E.00508
G1 X109.856 Y117.998 E.01186
G1 X109.906 Y117.792 E.00511
G1 X110.102 Y117.412 E.0103
G3 X111.023 Y116.676 I1.767 J1.265 E.02881
G1 X111.228 Y116.633 E.00505
G1 X111.229 Y116.196 E.01053
M204 S10000
G1 X110.759 Y116.381 F42000
G1 F9600
M204 S4000
G1 X110.425 Y116.209 E.00905
G3 X109.783 Y115.567 I1.627 J-2.269 E.02198
G1 X109.611 Y115.234 E.00906
G1 X109.439 Y115.567 E.00906
G1 X109.1 Y115.958 E.01248
G3 X108.464 Y116.381 I-1.282 J-1.238 E.01856
G1 X108.798 Y116.554 E.00907
G3 X109.439 Y117.195 I-1.63 J2.27 E.02195
G1 X109.611 Y117.529 E.00907
G1 X109.784 Y117.195 E.00907
G3 X110.425 Y116.553 I2.27 J1.629 E.02197
G1 X110.705 Y116.409 E.00761
M204 S10000
G1 X109.967 Y116.381 F42000
; LINE_WIDTH: 0.502306
G1 F9600
M204 S4000
G1 X109.611 Y116.025 E.01472
G1 X109.255 Y116.381 E.01472
G1 X109.611 Y116.737 E.01472
G1 X109.924 Y116.424 E.01297
; WIPE_START
G1 X109.611 Y116.737 E-.17248
G1 X109.255 Y116.381 E-.19582
G1 X109.611 Y116.025 E-.19585
G1 X109.967 Y116.381 E-.19585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X102.761 Y118.897 Z2.2 F42000
G1 X98.585 Y120.355 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.295 E.10172
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.111 E.11406
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y116.381 E.11408
G1 X99 Y120.711 E.11252
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.771 Y115.89 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X97.653 Y115.254 I-4.068 J.426 E.01563
G1 X97.373 Y114.904 E.0108
G1 X97.05 Y114.728 E.00888
G1 X96.537 Y114.666 E.01245
G1 X96.349 Y114.501 E.00602
G1 X96.273 Y113.965 E.01307
G1 X96.088 Y113.619 E.00946
G1 X95.739 Y113.339 E.01078
G1 X95.245 Y113.221 E.01224
G1 X93.956 Y113.221 E.03108
G2 X93.485 Y113.334 I.171 J1.752 E.01172
G1 X93.134 Y113.619 E.01089
G1 X92.958 Y113.943 E.0089
G1 X92.896 Y114.455 E.01245
G1 X92.731 Y114.643 E.00602
G1 X92.194 Y114.72 E.01307
G1 X91.849 Y114.905 E.00946
G1 X91.569 Y115.254 E.0108
G1 X91.454 Y115.723 E.01164
G1 X91.451 Y117.037 E.03168
G2 X91.564 Y117.508 I1.752 J-.171 E.01172
G1 X91.849 Y117.858 E.01089
G1 X92.173 Y118.035 E.0089
G1 X92.685 Y118.097 E.01246
G1 X92.873 Y118.261 E.00602
G1 X92.949 Y118.798 E.01307
G1 X93.135 Y119.144 E.00946
G1 X93.484 Y119.424 E.0108
G1 X93.953 Y119.538 E.01164
G1 X95.267 Y119.541 E.03168
G2 X95.738 Y119.429 I-.171 J-1.752 E.01172
G1 X96.088 Y119.144 E.01089
G1 X96.264 Y118.82 E.0089
G1 X96.327 Y118.307 E.01246
G1 X96.491 Y118.119 E.00602
G1 X96.917 Y118.071 E.01033
G1 X97.349 Y117.877 E.01141
G1 X97.642 Y117.537 E.01082
G1 X97.766 Y117.098 E.01101
G2 X97.771 Y115.95 I-76.532 J-.955 E.02766
M204 S10000
G1 X97.386 Y115.89 F42000
G1 F9600
M204 S4000
G1 X97.298 Y115.427 E.01136
G1 X97.12 Y115.206 E.00685
G1 X96.931 Y115.103 E.00519
G1 X96.414 Y115.031 E.01259
G1 X96.145 Y114.847 E.00787
G1 X95.961 Y114.578 E.00787
G1 X95.897 Y114.079 E.01213
G1 X95.785 Y113.871 E.00571
G1 X95.565 Y113.694 E.0068
G1 X95.102 Y113.607 E.01136
G1 X93.972 Y113.607 E.02724
G1 X93.673 Y113.678 E.00742
G1 X93.437 Y113.87 E.00735
G1 X93.333 Y114.061 E.00524
G1 X93.261 Y114.578 E.01258
G1 X93.077 Y114.847 E.00787
G1 X92.808 Y115.031 E.00785
G1 X92.309 Y115.096 E.01214
G1 X92.1 Y115.207 E.00571
G1 X91.923 Y115.429 E.00684
G1 X91.839 Y115.866 E.01073
G1 X91.837 Y117.021 E.02786
G1 X91.908 Y117.319 E.0074
G1 X92.1 Y117.556 E.00735
G1 X92.291 Y117.66 E.00524
G1 X92.808 Y117.731 E.0126
G1 X93.077 Y117.915 E.00785
G1 X93.261 Y118.184 E.00785
G1 X93.326 Y118.683 E.01214
G1 X93.437 Y118.892 E.00571
G1 X93.659 Y119.069 E.00684
G1 X94.096 Y119.153 E.01073
G1 X95.251 Y119.156 E.02786
G1 X95.549 Y119.085 E.0074
G1 X95.786 Y118.892 E.00735
G1 X95.89 Y118.702 E.00524
G1 X95.961 Y118.184 E.0126
G1 X96.145 Y117.915 E.00785
G1 X96.414 Y117.731 E.00787
G1 X96.951 Y117.633 E.01316
G1 X97.113 Y117.56 E.00427
G1 X97.303 Y117.339 E.00704
G1 X97.385 Y116.991 E.00864
G1 X97.386 Y115.95 E.02509
M204 S10000
G1 X97 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.943 Y115.601 E.0071
G1 X96.813 Y115.477 E.00433
G1 X96.292 Y115.397 E.01272
G1 X96.063 Y115.285 E.00615
G1 X95.708 Y114.929 E.01212
G1 X95.595 Y114.701 E.00615
G1 X95.521 Y114.194 E.01235
G1 X95.391 Y114.049 E.00468
G1 X95 Y113.992 E.00952
G1 X93.989 Y113.992 E.0244
G1 X93.811 Y114.063 E.00461
G1 X93.707 Y114.179 E.00376
G1 X93.627 Y114.701 E.01272
G1 X93.515 Y114.929 E.00615
G1 X93.16 Y115.284 E.01211
G1 X92.931 Y115.397 E.00613
G1 X92.424 Y115.472 E.01238
G1 X92.277 Y115.603 E.00474
G1 X92.225 Y115.988 E.00937
G1 X92.222 Y117.005 E.02452
G1 X92.293 Y117.182 E.00459
G1 X92.409 Y117.285 E.00376
G1 X92.931 Y117.366 E.01274
G1 X93.306 Y117.598 E.01062
G3 X93.627 Y118.061 I-.677 J.812 E.01375
G1 X93.702 Y118.569 E.01238
G1 X93.833 Y118.715 E.00474
G1 X94.218 Y118.768 E.00937
G1 X95.235 Y118.77 E.02452
G1 X95.411 Y118.7 E.00459
G1 X95.515 Y118.583 E.00376
G1 X95.596 Y118.061 E.01274
G1 X95.828 Y117.687 E.01062
G3 X96.292 Y117.366 I.812 J.677 E.01377
G1 X96.793 Y117.281 E.01226
G1 X96.965 Y117.141 E.00533
G1 X97 Y116.844 E.00722
G1 X97 Y115.95 E.02155
M204 S10000
G1 X96.614 Y115.89 F42000
G1 F9600
M204 S4000
G1 X96.604 Y115.842 E.00119
G1 X96.169 Y115.763 E.01067
G1 X95.849 Y115.605 E.0086
G3 X95.23 Y114.823 I.992 J-1.421 E.0244
G1 X95.115 Y114.38 E.01105
G2 X94.073 Y114.378 I-.776 J174.754 E.02512
G1 X93.992 Y114.823 E.01091
G1 X93.835 Y115.144 E.00861
G3 X93.054 Y115.762 I-1.422 J-.992 E.02437
G1 X92.611 Y115.867 E.011
G1 X92.608 Y116.92 E.02537
G1 X93.054 Y117 E.01093
G1 X93.374 Y117.157 E.00859
G3 X93.992 Y117.938 I-.993 J1.421 E.02436
G1 X94.097 Y118.382 E.011
G1 X95.149 Y118.384 E.02537
G1 X95.23 Y117.938 E.01093
G1 X95.387 Y117.619 E.00859
G3 X96.169 Y117 I1.421 J.993 E.02439
G1 X96.614 Y116.927 E.01087
G1 X96.614 Y115.95 E.02357
M204 S10000
G1 X96.229 Y116.169 F42000
G1 F9600
M204 S4000
G1 X96.046 Y116.128 E.0045
G1 X95.635 Y115.926 E.01106
G3 X94.864 Y114.946 I1.238 J-1.766 E.03051
G1 X94.825 Y114.764 E.00449
G1 X94.398 Y114.764 E.01029
G1 X94.358 Y114.946 E.0045
G1 X94.156 Y115.358 E.01106
G3 X93.177 Y116.128 I-1.766 J-1.238 E.03046
G1 X92.996 Y116.167 E.00448
G1 X92.995 Y116.594 E.01031
G1 X93.177 Y116.635 E.00451
G1 X93.588 Y116.837 E.01104
G3 X94.358 Y117.815 I-1.239 J1.766 E.03045
G1 X94.397 Y117.997 E.00448
G1 X94.824 Y117.998 E.01031
G1 X94.865 Y117.815 E.00451
G1 X95.067 Y117.404 E.01104
G3 X96.046 Y116.634 I1.766 J1.239 E.03048
G1 X96.228 Y116.6 E.00447
G1 X96.229 Y116.229 E.00896
M204 S10000
G1 X95.694 Y116.381 F42000
G1 F9600
M204 S4000
G1 X95.42 Y116.247 E.00736
G1 X95.01 Y115.894 E.01306
G1 X94.745 Y115.572 E.01005
G1 X94.611 Y115.298 E.00736
G1 X94.477 Y115.572 E.00736
G1 X94.124 Y115.983 E.01306
G1 X93.802 Y116.246 E.01003
G1 X93.528 Y116.381 E.00737
G1 X93.802 Y116.516 E.00737
G1 X94.213 Y116.869 E.01304
G1 X94.476 Y117.19 E.01003
G1 X94.611 Y117.464 E.00737
G1 X94.746 Y117.19 E.00737
G1 X95.099 Y116.78 E.01304
G1 X95.42 Y116.516 E.01004
M73 P53 R7
G1 X95.64 Y116.408 E.00591
M204 S10000
G1 X94.942 Y116.381 F42000
; LINE_WIDTH: 0.467946
G1 F9600
M204 S4000
G1 X94.611 Y116.051 E.01267
G1 X94.281 Y116.381 E.01267
G1 X94.611 Y116.712 E.01267
G1 X94.899 Y116.424 E.01104
; WIPE_START
G1 X94.611 Y116.712 E-.1711
G1 X94.281 Y116.381 E-.19629
G1 X94.611 Y116.051 E-.1963
G1 X94.942 Y116.381 E-.19631
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.373 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.71 E.04321
G2 X96.712 Y114.28 I-.058 J2.155 E.04324
G2 X95.28 Y112.821 I-1.497 J.037 E.0585
G2 X93.663 Y112.85 I-.679 J7.061 E.04214
G2 X92.502 Y114.28 I.362 J1.48 E.0514
G2 X90.991 Y113.711 I-1.46 J1.586 E.04303
G1 X90.991 Y115.374 E.04321
; WIPE_START
G1 X90.991 Y113.711 E-.63181
G1 X91.327 Y113.734 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.805 Y112.445 Z2.2 F42000
G1 X83.585 Y112.408 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.355 E.10328
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.171 E.11551
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y116.381 E.11408
G1 X84 Y120.771 E.11408
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X83.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.231 Y115.496 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X83.231 Y113.834 E.04321
G2 X82.311 Y114.438 I.927 J2.414 E.02883
G2 X81.697 Y114.263 I-3.043 J9.559 E.01661
G2 X80.255 Y112.821 I-1.502 J.06 E.05826
G2 X78.687 Y112.85 I-.654 J6.836 E.04084
G2 X77.583 Y113.863 I.295 J1.43 E.0409
G2 X75.991 Y113.87 I-.789 J1.827 E.04257
G1 X75.991 Y115.532 E.04321
; WIPE_START
G1 X75.991 Y113.87 E-.63181
G1 X76.31 Y113.76 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.771 Y115.917 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G2 X82.651 Y115.276 I-4.033 J.421 E.01576
G1 X82.369 Y114.926 E.01083
G1 X82.02 Y114.742 E.00951
G1 X81.478 Y114.664 E.01321
M73 P54 R7
G1 X81.305 Y114.466 E.00635
G1 X81.25 Y113.972 E.01199
G1 X81.066 Y113.623 E.00951
G1 X80.717 Y113.341 E.01083
G1 X80.22 Y113.221 E.01233
G1 X78.981 Y113.221 E.02987
G2 X78.507 Y113.335 I.174 J1.759 E.0118
G1 X78.157 Y113.623 E.01093
G1 X77.972 Y113.972 E.00952
G1 X77.894 Y114.514 E.01322
G1 X77.696 Y114.687 E.00634
G1 X77.202 Y114.742 E.01199
G1 X76.853 Y114.926 E.00951
G1 X76.57 Y115.276 E.01085
G1 X76.454 Y115.748 E.01172
G1 X76.451 Y117.012 E.03048
G2 X76.565 Y117.485 I1.76 J-.174 E.01179
G1 X76.853 Y117.836 E.01093
G1 X77.202 Y118.02 E.00952
G1 X77.744 Y118.098 E.01322
G1 X77.917 Y118.296 E.00634
G1 X77.972 Y118.79 E.01199
G1 X78.156 Y119.139 E.00951
G1 X78.506 Y119.422 E.01085
G1 X78.978 Y119.538 E.01172
G1 X80.242 Y119.541 E.03048
G2 X80.715 Y119.427 I-.174 J-1.759 E.01179
G1 X81.066 Y119.14 E.01093
G1 X81.25 Y118.791 E.00952
G1 X81.328 Y118.248 E.01322
G1 X81.526 Y118.075 E.00634
G1 X81.908 Y118.048 E.00924
G1 X82.344 Y117.855 E.01148
G1 X82.64 Y117.515 E.01088
G1 X82.765 Y117.073 E.01109
G2 X82.771 Y115.977 I-70.589 J-.918 E.02641
M204 S10000
G1 X82.386 Y115.917 F42000
G1 F9600
M204 S4000
G1 X82.297 Y115.451 E.01145
G1 X82.119 Y115.23 E.00683
G1 X81.906 Y115.118 E.00579
G1 X81.411 Y115.055 E.01204
G3 X80.914 Y114.468 I.295 J-.754 E.01934
G1 X80.874 Y114.086 E.00926
G1 X80.762 Y113.873 E.0058
G1 X80.542 Y113.695 E.00683
G1 X80.075 Y113.607 E.01146
G1 X78.997 Y113.607 E.02599
G1 X78.696 Y113.679 E.00747
G1 X78.461 Y113.872 E.00733
G1 X78.348 Y114.086 E.00584
G1 X78.285 Y114.581 E.01204
G3 X77.698 Y115.079 I-.754 J-.295 E.01935
G1 X77.316 Y115.118 E.00926
G1 X77.103 Y115.23 E.0058
G1 X76.924 Y115.452 E.00687
G1 X76.839 Y115.892 E.01081
G1 X76.837 Y116.996 E.02661
G1 X76.909 Y117.296 E.00745
G1 X77.101 Y117.531 E.00733
G1 X77.316 Y117.644 E.00584
G1 X77.812 Y117.707 E.01206
G3 X78.309 Y118.295 I-.296 J.754 E.01933
G1 X78.348 Y118.676 E.00926
G1 X78.46 Y118.889 E.0058
G1 X78.682 Y119.068 E.00687
G1 X79.122 Y119.153 E.01081
G1 X80.226 Y119.156 E.02661
G1 X80.526 Y119.084 E.00745
G1 X80.761 Y118.891 E.00733
G1 X80.874 Y118.677 E.00584
G1 X80.937 Y118.181 E.01206
G3 X81.551 Y117.682 I.747 J.291 E.01995
G1 X81.817 Y117.666 E.00642
G1 X82.11 Y117.537 E.00772
G1 X82.302 Y117.316 E.00707
G1 X82.385 Y117 E.00788
G1 X82.386 Y115.977 E.02466
M204 S10000
G1 X82 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.942 Y115.626 E.00717
G1 X81.792 Y115.494 E.00481
G1 X81.296 Y115.423 E.0121
G1 X81.055 Y115.309 E.00643
G3 X80.569 Y114.696 I.74 J-1.086 E.01915
G1 X80.498 Y114.2 E.01209
G1 X80.367 Y114.05 E.00481
G1 X79.959 Y113.992 E.00993
G1 X79.014 Y113.992 E.0228
G2 X78.724 Y114.2 I.04 J.362 E.00898
G1 X78.653 Y114.696 E.01209
G1 X78.539 Y114.938 E.00644
G3 X77.927 Y115.423 I-1.086 J-.741 E.01913
G1 X77.43 Y115.494 E.01211
G1 X77.278 Y115.628 E.00488
G1 X77.225 Y116.029 E.00977
G1 X77.222 Y116.98 E.02292
G1 X77.287 Y117.149 E.00438
G1 X77.43 Y117.268 E.00448
G1 X77.927 Y117.339 E.01212
G1 X78.168 Y117.453 E.00642
G3 X78.653 Y118.065 I-.741 J1.086 E.01912
G1 X78.724 Y118.562 E.01211
G1 X78.858 Y118.714 E.00488
G1 X79.259 Y118.768 E.00977
G1 X80.21 Y118.77 E.02292
G1 X80.379 Y118.705 E.00438
G1 X80.498 Y118.563 E.00448
G1 X80.569 Y118.065 E.01212
G1 X80.683 Y117.825 E.00642
G3 X81.296 Y117.339 I1.086 J.741 E.01914
G1 X81.81 Y117.248 E.0126
G1 X81.964 Y117.117 E.00486
G1 X82 Y116.798 E.00774
G1 X82 Y115.977 E.0198
M204 S10000
G1 X81.614 Y115.917 F42000
G1 F9600
M204 S4000
G1 X81.603 Y115.862 E.00135
G1 X81.181 Y115.791 E.01032
G1 X80.843 Y115.632 E.00901
G3 X80.201 Y114.812 I.984 J-1.432 E.02551
G1 X80.13 Y114.39 E.01031
G2 X79.093 Y114.378 I-.778 J23.214 E.02501
G1 X79.021 Y114.812 E.0106
G1 X78.862 Y115.149 E.00901
G3 X78.043 Y115.791 I-1.433 J-.984 E.02548
G1 X77.611 Y115.894 E.01071
G1 X77.608 Y116.899 E.02424
G1 X78.043 Y116.971 E.01062
G1 X78.38 Y117.131 E.00899
G3 X79.021 Y117.95 I-.985 J1.432 E.02547
G1 X79.124 Y118.382 E.01071
G1 X80.129 Y118.384 E.02424
G1 X80.201 Y117.95 E.01062
G1 X80.361 Y117.613 E.00899
G3 X81.181 Y116.971 I1.432 J.985 E.0255
G1 X81.614 Y116.906 E.01057
G1 X81.614 Y115.977 E.02239
M204 S10000
G1 X81.228 Y116.193 F42000
G1 F9600
M204 S4000
G1 X81.065 Y116.16 E.00401
G1 X80.631 Y115.954 E.01158
G1 X80.262 Y115.636 E.01176
G1 X80.038 Y115.361 E.00854
G1 X79.833 Y114.927 E.01158
G1 X79.799 Y114.764 E.00401
G1 X79.423 Y114.764 E.00907
G1 X79.389 Y114.927 E.00401
G1 X79.184 Y115.361 E.01158
G1 X78.866 Y115.73 E.01176
G1 X78.591 Y115.954 E.00853
G1 X78.158 Y116.159 E.01156
G1 X77.996 Y116.193 E.00401
G1 X77.995 Y116.57 E.00909
G1 X78.158 Y116.604 E.00403
G1 X78.591 Y116.809 E.01156
G1 X78.96 Y117.127 E.01175
G1 X79.184 Y117.401 E.00853
G1 X79.389 Y117.834 E.01156
G1 X79.422 Y117.997 E.00401
G1 X79.8 Y117.998 E.00909
G1 X79.833 Y117.834 E.00403
G1 X80.039 Y117.401 E.01156
G1 X80.357 Y117.032 E.01175
G1 X80.631 Y116.808 E.00854
G1 X81.065 Y116.603 E.01158
G1 X81.228 Y116.573 E.00399
G1 X81.228 Y116.253 E.00772
M204 S10000
G1 X80.641 Y116.381 F42000
G1 F9600
M204 S4000
G1 X80.42 Y116.276 E.00591
G1 X79.989 Y115.908 E.01366
G1 X79.716 Y115.572 E.01044
G1 X79.611 Y115.351 E.00591
G1 X79.506 Y115.572 E.00591
G1 X79.138 Y116.003 E.01366
G1 X78.803 Y116.276 E.01042
G1 X78.581 Y116.381 E.00592
G1 X78.803 Y116.487 E.00592
G1 X79.233 Y116.854 E.01364
G1 X79.506 Y117.189 E.01042
G1 X79.611 Y117.411 E.00592
G1 X79.716 Y117.189 E.00592
G1 X80.084 Y116.759 E.01364
G1 X80.42 Y116.486 E.01044
G1 X80.587 Y116.407 E.00446
M204 S10000
G1 X79.923 Y116.381 F42000
; LINE_WIDTH: 0.443266
G1 F9600
M204 S4000
G1 X79.611 Y116.07 E.01126
G1 X79.3 Y116.381 E.01126
G1 X79.611 Y116.693 E.01126
G1 X79.88 Y116.424 E.00973
; CHANGE_LAYER
; Z_HEIGHT: 1.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F9600
G1 X79.611 Y116.693 E-.1699
G1 X79.3 Y116.381 E-.19668
G1 X79.611 Y116.07 E-.1967
G1 X79.923 Y116.381 E-.19672
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/38
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
M106 S114.75
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.2 I-.186 J1.203 P1  F42000
G1 X105.637 Y120.355 Z2.2
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y116.381 E.10328
G1 X113.585 Y120.355 E.10328
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y116.381 E.11551
G1 X114.401 Y121.171 E.11551
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y116.381 E.11408
G1 X114 Y120.771 E.11408
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.36
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.36 F4000
            G39.3 S1
            G0 Z2.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.406 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y113.743 E.04321
G3 X107.005 Y114.336 I-.509 J2.034 E.03096
G3 X107.486 Y114.256 I.425 J1.067 E.01276
G3 X108.638 Y112.85 I1.483 J.04 E.05084
G3 X110.305 Y112.821 I.963 J7.259 E.04343
G3 X111.705 Y113.928 I-.114 J1.582 E.04927
G3 X113.232 Y113.766 I.955 J1.718 E.041
G1 X113.232 Y115.429 E.04321
; WIPE_START
G1 X113.232 Y113.766 E-.63181
G1 X112.902 Y113.695 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.945 Y116.864 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X110.094 Y119.715 E.09722
G1 X109.549 Y119.715
G1 X112.945 Y116.319 E.11582
G1 X112.945 Y115.773
G1 X109.003 Y119.715 E.13442
G1 X108.548 Y119.624
G1 X112.854 Y115.318 E.14686
G1 X112.667 Y114.96
G1 X108.19 Y119.438 E.15271
G1 X107.917 Y119.165
G1 X112.395 Y114.687 E.1527
G1 X112.025 Y114.512
G1 X107.742 Y118.795 E.14607
G1 X107.657 Y118.334
G1 X111.564 Y114.427 E.13323
G1 X111.48 Y113.965
G1 X107.195 Y118.25 E.14613
G1 X106.826 Y118.074
G1 X111.304 Y113.596 E.15273
G1 X111.031 Y113.324
G1 X106.554 Y117.801 E.1527
G1 X106.354 Y117.455
G1 X110.672 Y113.138 E.14726
G1 X110.216 Y113.048
G1 X106.278 Y116.986 E.13432
G1 X106.278 Y116.441
G1 X109.671 Y113.048 E.11572
G1 X109.125 Y113.048
G1 X106.278 Y115.896 E.09712
; WIPE_START
M204 S4000
G1 X107.692 Y114.481 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.475 Y113.936 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0997972
G1 F15000
M204 S4000
G1 X111.459 Y113.907 E.00014
G2 X111.378 Y113.795 I-.976 J.621 E.00057
; WIPE_START
G1 X111.459 Y113.907 E-.61231
G1 X111.475 Y113.936 E-.14769
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.964 Y115.779 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.116611
G1 F15000
M204 S4000
G1 X112.867 Y115.579 E.00115
; WIPE_START
G1 X112.964 Y115.779 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.628 Y117.881 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.16198
G1 F15000
M204 S4000
G1 X111.806 Y118.295 E.00734
; WIPE_START
G1 X112.628 Y117.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.949 Y117.248 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.321598
G1 F15000
M204 S4000
G3 X112.384 Y117.923 I-5.613 J-4.123 E.01583
; LINE_WIDTH: 0.333394
G1 X112.28 Y117.999 E.0024
; LINE_WIDTH: 0.29523
G1 X112.177 Y118.075 E.00209
; LINE_WIDTH: 0.242429
G3 X111.857 Y118.293 I-1.988 J-2.584 E.00504
M204 S10000
G1 X111.522 Y118.627 F42000
; LINE_WIDTH: 0.235165
G1 F15000
M204 S4000
G1 X111.381 Y118.844 E.00325
; LINE_WIDTH: 0.257089
G1 X111.305 Y118.947 E.00179
; LINE_WIDTH: 0.295241
G1 X111.229 Y119.051 E.00209
; LINE_WIDTH: 0.3231
G3 X111.146 Y119.162 I-.605 J-.367 E.00251
G3 X110.477 Y119.719 I-3.377 J-3.369 E.01574
; WIPE_START
G1 X110.809 Y119.468 E-.31261
G1 X111.146 Y119.162 E-.34302
G1 X111.229 Y119.051 E-.10437
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.525 Y118.577 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.16197
G1 F15000
M204 S4000
G1 X111.11 Y119.398 E.00734
; WIPE_START
M73 P55 R7
G1 X111.525 Y118.577 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.844 Y118.965 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.100337
G1 F15000
M204 S4000
G3 X107.747 Y118.824 I.658 J-.558 E.00071
; WIPE_START
G1 X107.844 Y118.965 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.363 Y114.47 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.233063
G1 F15000
M204 S4000
G1 X107.148 Y114.61 E.00319
; LINE_WIDTH: 0.255012
G1 X107.044 Y114.686 E.00177
; LINE_WIDTH: 0.293195
G1 X106.941 Y114.763 E.00208
; LINE_WIDTH: 0.32168
G2 X106.83 Y114.846 I.368 J.606 E.0025
G2 X106.308 Y115.482 I2.532 J2.61 E.01482
; WIPE_START
G1 X106.528 Y115.178 E-.29623
G1 X106.83 Y114.846 E-.35417
G1 X106.941 Y114.763 E-.1096
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.413 Y114.468 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.159749
G1 F15000
M204 S4000
G1 X106.597 Y114.879 E.00717
; WIPE_START
G1 X107.413 Y114.468 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.109 Y113.366 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.159748
G1 F15000
M204 S4000
G1 X107.697 Y114.183 E.00718
; WIPE_START
G1 X108.109 Y113.366 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.743 Y113.044 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.319599
G1 F15000
M204 S4000
G2 X108.069 Y113.608 I4.088 J5.571 E.0157
; LINE_WIDTH: 0.331361
G1 X107.992 Y113.711 E.00238
; LINE_WIDTH: 0.293189
G1 X107.916 Y113.815 E.00208
; LINE_WIDTH: 0.240386
G2 X107.7 Y114.133 I2.556 J1.967 E.00496
; WIPE_START
G1 X107.916 Y113.815 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.369 Y112.677 Z2.36 F42000
G1 X98.585 Y112.408 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y116.381 E.10328
G1 X98.585 Y120.355 E.10328
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.555 Y114.407 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y116.381 E.11551
G1 X99.401 Y121.171 E.11551
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y116.381 E.11408
G1 X99 Y120.771 E.11408
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X98.968 Y113.992 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y115.361 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y113.698 E.04321
G2 X96.897 Y114.288 I.159 J2.162 E.03868
G1 X96.712 Y114.28 E.00482
G2 X95.28 Y112.821 I-1.497 J.037 E.05849
G2 X93.663 Y112.85 I-.679 J7.06 E.04214
G2 X92.516 Y114.144 I.338 J1.454 E.04791
G2 X90.991 Y113.71 I-1.25 J1.494 E.04246
G1 X90.991 Y115.372 E.04321
; WIPE_START
G1 X90.991 Y113.71 E-.63181
G1 X91.328 Y113.699 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.377 Y119.706 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X96.48 Y118.603 E.03761
G1 X96.833 Y118.25
G1 X97.936 Y117.147 E.03761
G1 X97.945 Y116.593
G1 X94.823 Y119.715 E.10647
G1 X94.277 Y119.715
G1 X97.945 Y116.047 E.12507
G1 X97.903 Y115.544
G1 X93.774 Y119.673 E.14082
G1 X93.35 Y119.551
G1 X97.781 Y115.12 E.1511
G1 X97.532 Y114.823
G1 X93.053 Y119.303 E.15276
G1 X92.84 Y118.97
G1 X97.2 Y114.61 E.1487
G1 X96.756 Y114.509
G1 X92.739 Y118.526 E.13698
G1 X92.466 Y118.253
G1 X96.483 Y114.237 E.13698
G1 X96.382 Y113.792
G1 X92.022 Y118.152 E.1487
G1 X91.69 Y117.939
G1 X96.169 Y113.46 E.15276
G1 X95.872 Y113.212
G1 X91.441 Y117.642 E.1511
G1 X91.295 Y117.243
G1 X95.449 Y113.089 E.14167
G1 X94.945 Y113.048
G1 X91.278 Y116.715 E.12507
G1 X91.278 Y116.17
G1 X94.399 Y113.048 E.10647
G1 X93.845 Y113.056
G1 X92.743 Y114.159 E.03761
G1 X92.389 Y114.513
G1 X91.307 Y115.595 E.0369
; WIPE_START
M204 S4000
G1 X92.389 Y114.513 E-.58153
G1 X92.721 Y114.181 E-.17847
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.828 Y117.553 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.089393
G1 F15000
M204 S4000
G3 X97.784 Y117.617 I-.366 J-.202 E.00027
; LINE_WIDTH: 0.121796
G3 X97.438 Y117.991 I-2.059 J-1.559 E.00279
; LINE_WIDTH: 0.124004
G1 X97.352 Y118.055 E.0006
; LINE_WIDTH: 0.0950746
G1 X97.266 Y118.118 E.00041
; WIPE_START
G1 X97.352 Y118.055 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.439 Y113.165 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0893163
G1 F15000
M204 S4000
G2 X93.375 Y113.208 I.202 J.366 E.00027
; LINE_WIDTH: 0.12167
G2 X93.001 Y113.555 I1.563 J2.064 E.00279
; LINE_WIDTH: 0.123925
G1 X92.938 Y113.641 E.0006
; LINE_WIDTH: 0.0950495
G1 X92.875 Y113.727 E.00041
; WIPE_START
G1 X92.938 Y113.641 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.956 Y114.645 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
G1 F15000
M204 S4000
G1 X91.87 Y114.708 E.00041
; LINE_WIDTH: 0.122257
G2 X91.761 Y114.792 I.373 J.598 E.00076
G1 X91.441 Y115.141 E.0026
; LINE_WIDTH: 0.0886992
G2 X91.4 Y115.205 I.257 J.212 E.00026
; WIPE_START
G1 X91.441 Y115.141 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.398 Y118.184 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.109947
G1 F15000
M204 S4000
G1 X92.207 Y118.248 E.00095
M204 S10000
G1 X92.808 Y118.594 F42000
; LINE_WIDTH: 0.109817
G1 F15000
M204 S4000
G1 X92.744 Y118.786 E.00095
; WIPE_START
G1 X92.808 Y118.594 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.348 Y119.036 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0950712
G1 F15000
M204 S4000
G1 X96.285 Y119.122 E.00041
; LINE_WIDTH: 0.122164
G3 X96.2 Y119.231 I-.598 J-.373 E.00076
G1 X95.847 Y119.554 E.00263
; LINE_WIDTH: 0.0893788
G3 X95.783 Y119.598 I-.266 J-.323 E.00027
; WIPE_START
G1 X95.847 Y119.554 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.231 Y120.052 Z2.36 F42000
G1 X83.585 Y120.355 Z2.36
G1 Z1.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y116.381 E.10328
G1 X83.585 Y120.295 E.10172
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y116.381 E.11551
G1 X84.401 Y121.111 E.11406
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y116.381 E.11408
G1 X84 Y120.711 E.11252
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.945 Y116.867 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X80.097 Y119.715 E.09713
G1 X79.551 Y119.715
G1 X82.945 Y116.321 E.11573
G1 X82.945 Y115.776
G1 X79.006 Y119.715 E.13433
G1 X78.561 Y119.614
G1 X82.844 Y115.331 E.14606
G1 X82.646 Y114.984
G1 X78.214 Y119.416 E.15113
G1 X77.95 Y119.134
G1 X82.364 Y114.72 E.15054
G1 X81.987 Y114.552
G1 X77.782 Y118.757 E.14339
G1 X77.7 Y118.294
G1 X81.523 Y114.47 E.13039
G1 X81.441 Y114.008
G1 X77.238 Y118.211 E.14334
G1 X76.86 Y118.043
G1 X81.273 Y113.63 E.15051
G1 X81.01 Y113.348
G1 X76.578 Y117.78 E.15114
G1 X76.368 Y117.444
G1 X80.663 Y113.149 E.14649
G1 X80.219 Y113.048
G1 X76.278 Y116.989 E.13441
G1 X76.278 Y116.444
G1 X79.674 Y113.048 E.11581
G1 X79.128 Y113.048
G1 X76.278 Y115.898 E.09721
; WIPE_START
M204 S4000
G1 X77.692 Y114.484 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.87 Y113.205 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.123619
G1 F15000
M204 S4000
G1 X80.799 Y113.216 E.0004
G1 X80.698 Y113.143 E.0007
; WIPE_START
G1 X80.799 Y113.216 E-.48388
G1 X80.87 Y113.205 E-.27612
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.518 Y114.84 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0848471
G1 F15000
M204 S4000
G2 X82.422 Y114.75 I-.368 J.298 E.00041
; WIPE_START
G1 X82.518 Y114.84 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.949 Y115.759 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0838384
G1 F15000
M204 S4000
G1 X82.864 Y115.584 E.0006
; WIPE_START
G1 X82.949 Y115.759 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.944 Y117.237 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.285681
G1 F15000
M204 S4000
G3 X82.385 Y117.897 I-5.436 J-4.041 E.01359
; LINE_WIDTH: 0.293097
G1 X82.28 Y117.973 E.00211
; LINE_WIDTH: 0.25279
G1 X82.174 Y118.05 E.00178
; LINE_WIDTH: 0.197676
G3 X81.886 Y118.245 I-1.789 J-2.343 E.00356
M204 S10000
G1 X81.475 Y118.655 F42000
; LINE_WIDTH: 0.188885
G1 F15000
M204 S4000
G1 X81.357 Y118.839 E.00212
; LINE_WIDTH: 0.212518
G1 X81.28 Y118.945 E.00145
; LINE_WIDTH: 0.252805
G1 X81.203 Y119.05 E.00178
; LINE_WIDTH: 0.286647
G3 X81.117 Y119.166 I-.63 J-.379 E.00229
G3 X80.467 Y119.714 I-3.268 J-3.214 E.01343
; WIPE_START
G1 X80.775 Y119.48 E-.29546
G1 X81.117 Y119.166 E-.35411
G1 X81.203 Y119.05 E-.11044
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.526 Y119.621 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.12359
G1 F15000
M204 S4000
G1 X78.425 Y119.547 E.0007
G1 X78.353 Y119.558 E.0004
; WIPE_START
G1 X78.425 Y119.547 E-.27852
G1 X78.526 Y119.621 E-.48148
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.802 Y118.013 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.0853498
G1 F15000
M204 S4000
G3 X76.706 Y117.924 I.27 J-.386 E.00042
; WIPE_START
G1 X76.802 Y118.013 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.338 Y114.518 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.19068
M73 P56 R7
G1 F15000
M204 S4000
G1 X77.153 Y114.637 E.00215
; LINE_WIDTH: 0.214345
G1 X77.048 Y114.713 E.00147
; LINE_WIDTH: 0.254638
G1 X76.943 Y114.79 E.00179
; LINE_WIDTH: 0.289123
G2 X76.827 Y114.876 I.378 J.629 E.0023
G2 X76.321 Y115.484 I2.385 J2.501 E.01264
; WIPE_START
G1 X76.518 Y115.213 E-.27244
G1 X76.827 Y114.876 E-.37045
G1 X76.943 Y114.79 E-.11711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.757 Y113.048 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; LINE_WIDTH: 0.287467
G1 F15000
M204 S4000
G2 X78.097 Y113.608 I4.035 J5.433 E.01372
; LINE_WIDTH: 0.294922
G1 X78.02 Y113.713 E.00212
; LINE_WIDTH: 0.25465
G1 X77.943 Y113.818 E.00179
; LINE_WIDTH: 0.199506
G2 X77.748 Y114.109 I2.317 J1.77 E.00362
; WIPE_START
G1 X77.943 Y113.818 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y115.607 Z2.36 F42000
G1 Z1.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y113.944 E.04321
G3 X77.617 Y113.78 I1.001 J1.774 E.04372
G3 X78.687 Y112.851 I1.493 J.639 E.03812
G3 X80.255 Y112.821 I.914 J6.805 E.04084
G3 X81.697 Y114.263 I-.061 J1.502 E.05825
G3 X82.411 Y114.489 I-1.294 J5.34 E.01949
G3 X83.232 Y113.897 I2.207 J2.193 E.02642
G1 X83.232 Y115.559 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y113.897 E-.63181
G1 X83.016 Y113.994 E-.09004
G1 X82.938 Y114.058 E-.03815
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/38
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S122.4
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.36 I-.325 J1.173 P1  F42000
G1 X105.637 Y120.355 Z2.36
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.52
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.52 F4000
            G39.3 S1
            G0 Z2.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y115.328 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y113.665 E.04321
G2 X111.644 Y114.024 I-.354 J2.124 E.04339
G2 X110.321 Y112.902 I-1.423 J.337 E.04827
G2 X108.679 Y112.922 I-.704 J9.443 E.04273
G2 X107.563 Y114.333 I.301 J1.384 E.05066
G3 X107.099 Y114.246 I-.176 J-.341 E.01324
G2 X105.991 Y113.654 I-1.346 J1.188 E.03335
G1 X105.991 Y117.518 E.10044
G3 X106.65 Y118.147 I-.65 J1.342 E.02406
G3 X107.63 Y118.934 I-12.095 J16.054 E.03267
G2 X108.895 Y119.859 I1.385 J-.566 E.04289
; WIPE_START
G1 X108.293 Y119.713 E-.23569
G1 X107.846 Y119.342 E-.22042
G1 X107.63 Y118.934 E-.1757
G1 X107.376 Y118.711 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.874 Y120.114 Z2.52 F42000
G1 X98.585 Y120.355 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
M73 P57 R7
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y115.359 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X90.991 Y113.697 E.04321
G3 X92.601 Y114.053 I.466 J1.715 E.04458
G3 X93.704 Y112.922 I1.438 J.3 E.04333
G3 X95.296 Y112.902 I.913 J9.137 E.04144
G3 X96.635 Y114.358 I-.067 J1.405 E.05702
G1 X96.947 Y114.372 E.00814
G3 X98.232 Y113.674 I1.681 J1.563 E.03865
G1 X98.232 Y115.337 E.04321
; WIPE_START
G1 X98.232 Y113.674 E-.63181
G1 X97.908 Y113.769 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.31 Y113.047 Z2.52 F42000
G1 X83.585 Y112.408 Z2.52
G1 Z2.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
M204 S10000
G1 X78.375 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y115.672 Z2.52 F42000
G1 Z2.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y114.01 E.04321
G3 X77.744 Y113.71 I1.218 J1.849 E.04757
G3 X78.729 Y112.922 I1.361 J.691 E.0338
G3 X80.271 Y112.902 I.888 J8.851 E.04014
G3 X81.616 Y114.377 I-.071 J1.415 E.05756
G3 X82.447 Y114.599 I.002 J1.663 E.02262
G3 X83.232 Y113.95 I2.798 J2.588 E.02653
G1 X83.232 Y115.613 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.28
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y113.95 E-.63181
G1 X83.016 Y114.072 E-.09426
G1 X82.95 Y114.133 E-.03393
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/38
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S119.85
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.52 I-.322 J1.174 P1  F42000
G1 X105.637 Y120.355 Z2.52
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.68 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.68
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.68 F4000
            G39.3 S1
            G0 Z2.68 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y115.21 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y113.547 E.04321
G2 X111.647 Y114.083 I-.104 J2.304 E.0445
G2 X110.321 Y112.902 I-1.402 J.238 E.04985
G2 X108.679 Y112.922 I-.704 J9.443 E.04273
G2 X107.563 Y114.333 I.301 J1.384 E.05066
G1 X107.363 Y114.343 E.00522
G2 X106.207 Y113.546 I-1.718 J1.253 E.0372
G1 X105.991 Y113.549 E.00562
G1 X105.991 Y117.563 E.10433
G1 X106.207 Y117.712 E.00682
G2 X107.545 Y119.083 I4.987 J-3.527 E.05001
G3 X107.846 Y119.342 I.023 J.278 E.0115
G2 X108.902 Y119.861 I1.06 J-.825 E.03164
G1 X109.13 Y119.861 E.00594
; WIPE_START
G1 X108.902 Y119.861 E-.08684
G1 X108.293 Y119.713 E-.23819
G1 X107.846 Y119.342 E-.22042
G1 X107.74 Y119.142 E-.08635
G1 X107.545 Y119.083 E-.07733
G1 X107.441 Y118.998 E-.05087
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.897 Y120.154 Z2.68 F42000
G1 X98.585 Y120.355 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
M73 P58 R7
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y115.334 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X90.991 Y113.672 E.04321
G3 X91.489 Y113.552 I.574 J1.293 E.0134
G3 X92.636 Y113.888 I.21 J1.407 E.03205
G3 X93.704 Y112.922 I1.298 J.362 E.03949
G3 X95.296 Y112.902 I.913 J9.137 E.04144
G3 X96.635 Y114.358 I-.067 J1.405 E.05702
G3 X97.063 Y114.396 I.12 J1.087 E.01126
G3 X98.232 Y113.638 I1.611 J1.205 E.03696
G1 X98.232 Y115.301 E.04321
; WIPE_START
G1 X98.232 Y113.638 E-.63181
G1 X97.918 Y113.763 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.32 Y113.044 Z2.68 F42000
G1 X83.585 Y112.408 Z2.68
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y115.146 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y115.73 Z2.68 F42000
G1 Z2.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y114.067 E.04321
G3 X77.806 Y113.588 I1.444 J1.793 E.05027
G3 X78.729 Y112.922 I1.321 J.857 E.03026
G3 X80.271 Y112.902 I.888 J8.851 E.04014
G3 X81.616 Y114.377 I-.071 J1.415 E.05756
G3 X82.56 Y114.657 I-.008 J1.759 E.02596
G3 X83.232 Y113.995 I1.675 J1.028 E.02474
G1 X83.232 Y115.658 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y113.995 E-.63181
G1 X83.016 Y114.144 E-.09965
G1 X82.966 Y114.2 E-.02854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/38
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.68 I-.319 J1.174 P1  F42000
G1 X105.637 Y120.355 Z2.68
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
M73 P59 R7
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.84 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.84
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.84 F4000
            G39.3 S1
            G0 Z2.84 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y115.082 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y113.419 E.04321
G2 X111.649 Y114.135 I.273 J2.71 E.04594
G2 X110.321 Y112.902 I-1.393 J.168 E.05122
G2 X108.679 Y112.922 I-.704 J9.443 E.04273
G2 X107.563 Y114.333 I.301 J1.384 E.05066
G1 X107.506 Y114.336 E.00149
G2 X106.653 Y113.452 I-1.966 J1.044 E.03235
G2 X105.991 Y113.444 I-.342 J.854 E.0176
G1 X105.991 Y117.599 E.108
G1 X106.207 Y117.778 E.00729
G1 X107.099 Y118.972 E.03873
G1 X107.545 Y119.31 E.01455
G1 X107.858 Y119.352 E.00821
G2 X108.902 Y119.861 I1.044 J-.817 E.03123
G1 X109.373 Y119.861 E.01225
; WIPE_START
G1 X108.902 Y119.861 E-.17911
G1 X108.293 Y119.713 E-.23819
G1 X107.858 Y119.352 E-.21451
G1 X107.545 Y119.31 E-.12009
G1 X107.528 Y119.297 E-.00811
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.948 Y120.194 Z2.84 F42000
G1 X98.585 Y120.355 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
M73 P59 R6
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y115.296 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X90.991 Y113.633 E.04321
G1 X91.935 Y113.392 E.02534
G3 X92.719 Y113.709 I.113 J.849 E.02297
G3 X93.704 Y112.922 I1.36 J.693 E.03377
G3 X95.296 Y112.902 I.913 J9.137 E.04144
G3 X96.635 Y114.358 I-.067 J1.405 E.05702
G3 X97.135 Y114.414 I.111 J1.274 E.01317
G3 X98.232 Y113.593 I1.671 J1.09 E.03634
G1 X98.232 Y115.255 E.04321
; WIPE_START
G1 X98.232 Y113.593 E-.63181
G1 X97.93 Y113.743 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.654 Y119.794 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X93.314 Y119.711 E.0091
G3 X92.599 Y118.667 I.609 J-1.183 E.03426
G1 X92.397 Y118.396 E.00877
G3 X91.194 Y117.414 I.129 J-1.385 E.04283
; WIPE_START
G1 X91.286 Y117.684 E-.10834
G1 X91.656 Y118.126 E-.21907
G1 X92.08 Y118.347 E-.18164
G1 X92.397 Y118.396 E-.12216
G1 X92.599 Y118.667 E-.12826
G1 X92.6 Y118.668 E-.00052
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.097 Y120.072 Z2.84 F42000
G1 X83.585 Y120.355 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
M73 P60 R6
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
M204 S10000
G1 X78.375 Y115.146 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y115.781 Z2.84 F42000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y114.118 E.04321
G3 X77.664 Y113.392 I1.905 J2.099 E.04826
G1 X77.896 Y113.424 E.0061
G3 X78.729 Y112.922 I1.059 J.816 E.02584
G3 X80.271 Y112.902 I.888 J8.851 E.04014
G3 X81.616 Y114.377 I-.071 J1.415 E.05756
G3 X82.625 Y114.733 I.093 J1.343 E.0286
G3 X83.232 Y114.031 I1.749 J.9 E.02434
G1 X83.232 Y115.694 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y114.031 E-.63181
G1 X83.016 Y114.21 E-.10653
G1 X82.981 Y114.256 E-.02166
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/38
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z2.84 I-.316 J1.175 P1  F42000
G1 X105.637 Y120.355 Z2.84
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X113.232 Y114.914 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y113.252 E.04321
G2 X111.652 Y114.18 I.736 J3.061 E.04833
G2 X110.321 Y112.902 I-1.39 J.115 E.05241
G2 X108.679 Y112.922 I-.704 J9.443 E.04273
G2 X107.567 Y114.254 I.294 J1.375 E.04858
G3 X107.099 Y113.388 I5.84 J-3.721 E.02559
G1 X106.653 Y113.15 E.01314
G2 X105.991 Y113.291 I-.025 J1.503 E.01775
G1 X105.991 Y117.627 E.11268
G3 X107.099 Y119.374 I-5.422 J4.663 E.05397
G1 X107.545 Y119.613 E.01315
G2 X108.066 Y119.524 I.07 J-1.171 E.01385
G1 X108.293 Y119.713 E.00766
G2 X109.643 Y119.861 I.98 J-2.698 E.03564
; WIPE_START
G1 X108.902 Y119.861 E-.28161
G1 X108.293 Y119.713 E-.23819
G1 X108.066 Y119.524 E-.11201
G1 X107.733 Y119.581 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.128 Y120.224 Z3 F42000
G1 X98.585 Y120.355 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
M73 P61 R6
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y115.243 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X90.991 Y113.58 E.04321
G3 X92.381 Y113.15 I2.286 J4.93 E.03794
G1 X92.857 Y113.444 E.01453
G3 X93.704 Y112.922 I1.472 J1.44 E.02611
G3 X95.296 Y112.902 I.913 J9.137 E.04144
G3 X96.635 Y114.358 I-.067 J1.405 E.05702
G3 X97.183 Y114.436 I.112 J1.173 E.01453
G3 X98.232 Y113.526 I1.818 J1.035 E.03679
G1 X98.232 Y115.189 E.04321
; WIPE_START
G1 X98.232 Y113.526 E-.63181
G1 X97.944 Y113.703 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.628 Y119.861 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X93.314 Y119.711 I-.351 J-2.756 E.03471
G3 X92.381 Y118.544 I1.035 J-1.784 E.03971
G1 X92.284 Y118.391 E.00471
G3 X91.158 Y117.307 I.295 J-1.433 E.04287
; WIPE_START
G1 X91.286 Y117.684 E-.15132
G1 X91.656 Y118.126 E-.21907
G1 X92.284 Y118.391 E-.25922
G1 X92.381 Y118.544 E-.06885
G1 X92.458 Y118.687 E-.06153
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.957 Y120.097 Z3 F42000
G1 X83.585 Y120.355 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z3 F42000
G1 Z2.6
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
M204 S10000
G1 X78.375 Y115.146 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y115.825 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y114.162 E.04321
G3 X78.11 Y113.15 I2.312 J2.115 E.06257
G1 X78.178 Y113.186 E.00201
G3 X78.729 Y112.922 I.614 J.574 E.01625
G3 X80.271 Y112.902 I.888 J8.851 E.04014
G3 X81.616 Y114.377 I-.071 J1.415 E.05756
G3 X82.681 Y114.8 I.096 J1.311 E.03084
G3 X83.232 Y114.059 I1.875 J.817 E.0242
G1 X83.232 Y115.721 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 2.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y114.059 E-.63181
G1 X83.016 Y114.272 E-.11533
G1 X82.997 Y114.3 E-.01286
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/38
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3 I.101 J1.213 P1  F42000
G1 X105.637 Y112.408 Z3
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
M73 P62 R6
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.16 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.16
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.16 F4000
            G39.3 S1
            G0 Z3.16 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y114.695 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y113.032 E.04321
G2 X111.686 Y114.151 I2.431 J4.985 E.04985
G1 X111.653 Y114.204 E.00161
G2 X110.321 Y112.902 I-1.39 J.09 E.05302
G2 X108.679 Y112.922 I-.704 J9.443 E.04273
G2 X107.596 Y113.95 I.23 J1.327 E.04113
G3 X107.454 Y113.259 I1.349 J-.637 E.01849
G1 X107.703 Y112.813 E.01328
G1 X107.799 Y112.761 E.00284
G1 X106.524 Y112.761 E.03313
G1 X105.991 Y113.09 E.01629
G1 X105.991 Y117.628 E.11797
G3 X106.692 Y119.057 I-2.655 J2.19 E.04175
G1 X106.744 Y119.503 E.01167
G1 X106.495 Y119.949 E.01328
G1 X106.399 Y120.002 E.00284
G1 X107.673 Y120.002 E.03312
G1 X108.23 Y119.66 E.01696
G1 X108.293 Y119.713 E.00213
G2 X109.856 Y119.861 I1.086 J-3.136 E.0412
; WIPE_START
G1 X108.902 Y119.861 E-.36252
G1 X108.293 Y119.713 E-.23819
G1 X108.23 Y119.66 E-.0311
G1 X107.942 Y119.837 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X100.321 Y120.259 Z3.16 F42000
G1 X98.585 Y120.355 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y115.191 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X90.991 Y113.528 E.04321
G3 X92.223 Y112.813 I5.792 J8.567 E.03706
G1 X92.253 Y112.761 E.00157
G1 X93.527 Y112.761 E.03313
G2 X93.284 Y113.077 I.13 J.352 E.01092
G3 X93.704 Y112.922 I.409 J.465 E.01189
G3 X95.296 Y112.902 I.913 J9.137 E.04144
G3 X96.635 Y114.358 I-.067 J1.405 E.05702
G3 X97.221 Y114.456 I.119 J1.086 E.01565
G3 X98.232 Y113.461 I2.487 J1.515 E.03725
G1 X98.232 Y115.123 E.04321
; WIPE_START
G1 X98.232 Y113.461 E-.63181
G1 X97.948 Y113.643 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.351 Y119.855 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X93.696 Y119.804 I-.465 J-11.851 E.04309
G2 X93.402 Y120.002 I.011 J.333 E.0097
G1 X92.127 Y120.002 E.03312
G1 X92.223 Y119.949 E.00284
G1 X92.472 Y119.503 E.01328
G2 X92.166 Y118.369 I-2.488 J.063 E.03084
G3 X91.143 Y117.187 I.443 J-1.417 E.04277
; WIPE_START
G1 X91.286 Y117.684 E-.19634
G1 X91.656 Y118.126 E-.21907
G1 X92.166 Y118.369 E-.2147
G1 X92.285 Y118.689 E-.1299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.788 Y120.125 Z3.16 F42000
G1 X83.585 Y120.355 Z3.16
G1 Z2.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
M204 S10000
G1 X78.375 Y115.146 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
M73 P63 R6
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.313 Y118.37 Z3.16 F42000
G1 Z2.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X77.607 Y118.386 I.234 J-1.636 E.00764
G2 X78.166 Y119.566 I1.325 J.095 E.03549
G1 X77.952 Y119.949 E.01141
G1 X77.856 Y120.002 E.00284
G1 X75.991 Y120.002 E.04848
G1 X75.991 Y114.177 E.15139
G3 X77.138 Y113.259 I3.057 J2.646 E.03841
G1 X77.981 Y112.761 E.02545
G1 X83.232 Y112.761 E.13647
G1 X83.232 Y114.011 E.0325
G1 X83.143 Y114.151 E.00431
G2 X82.753 Y114.885 I1.515 J1.274 E.02176
G2 X81.616 Y114.377 I-1.041 J.803 E.03375
G2 X81.593 Y114.018 I-3.354 J.03 E.00935
; CHANGE_LAYER
; Z_HEIGHT: 2.92
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X81.616 Y114.377 E-.13664
G1 X82.134 Y114.438 E-.19844
G1 X82.561 Y114.657 E-.18219
G1 X82.753 Y114.885 E-.11356
G1 X82.86 Y114.597 E-.11671
G1 X82.877 Y114.57 E-.01246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/38
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.16 I.115 J1.212 P1  F42000
G1 X105.637 Y112.408 Z3.16
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
; WIPE_START
M204 S4000
G1 X110.496 Y118.498 E-.46878
G1 X110.455 Y118.617 E-.0478
G1 X110.303 Y118.691 E-.06416
G1 X109.832 Y118.691 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.32 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.32
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.32 F4000
            G39.3 S1
            G0 Z3.32 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X106.618 Y114.654 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X106.65 Y114.616 E.00129
G3 X107.563 Y114.333 I.836 J1.085 E.02538
G3 X107.751 Y113.259 I36.852 J5.878 E.02834
G3 X108.161 Y112.761 I1.1 J.487 E.01699
G1 X113.232 Y112.761 E.13179
G1 X113.232 Y112.821 E.00157
G1 X112.06 Y113.705 E.03816
G2 X111.654 Y114.229 I1.057 J1.239 E.01734
G1 X111.659 Y114.333 E.00272
G3 X113.091 Y115.672 I.03 J1.402 E.05639
G3 X113.07 Y117.314 I-9.45 J.704 E.04274
G1 X113.013 Y117.483 E.00465
G3 X113.232 Y117.767 I-.574 J.668 E.00937
G1 X113.232 Y119.43 E.04321
; WIPE_START
G1 X113.232 Y117.767 E-.63181
G1 X113.026 Y117.5 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.025 Y119.861 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X108.902 Y119.861 E.0292
G1 X108.378 Y119.733 E.01402
G2 X108.051 Y120.002 I.319 J.72 E.01112
G1 X106.036 Y120.002 E.05237
G2 X106.511 Y119.057 I-.632 J-.909 E.02865
G2 X105.991 Y117.621 I-2.878 J.231 E.04017
G1 X105.991 Y115.959 E.04321
; WIPE_START
G1 X105.991 Y117.621 E-.63181
G1 X106.159 Y117.914 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.986 Y113.426 Z3.32 F42000
G1 X98.585 Y112.408 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
M73 P64 R6
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
; WIPE_START
M204 S4000
G1 X92.494 Y117.241 E-.47827
G1 X92.376 Y117.201 E-.04742
G1 X92.301 Y117.048 E-.06452
G1 X92.301 Y116.602 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.35 Y115.121 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.135 Y117.092 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X92.074 Y118.344 I1.341 J-.027 E.04344
G1 X92.24 Y119.057 E.01902
G3 X91.834 Y119.949 I-1.002 J.083 E.0266
G1 X91.765 Y120.002 E.00227
G1 X90.991 Y120.002 E.02012
G1 X90.991 Y113.45 E.17028
G1 X91.875 Y112.761 E.02914
G1 X98.232 Y112.761 E.16522
G1 X98.232 Y113.327 E.01471
G2 X97.254 Y114.474 I1.93 J2.634 E.03952
G3 X98.091 Y115.793 I-.546 J1.271 E.04315
; WIPE_START
G1 X97.94 Y115.084 E-.27553
G1 X97.566 Y114.636 E-.22158
G1 X97.254 Y114.474 E-.13379
G1 X97.412 Y114.173 E-.12911
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.841 Y113.206 Z3.32 F42000
G1 X83.585 Y112.408 Z3.32
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y115.146 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.012 Y118.286 Z3.32 F42000
G1 Z2.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X77.607 Y118.386 I.625 J-1.892 E.01574
G2 X77.924 Y119.362 I1.386 J.089 E.02734
G1 X77.904 Y119.503 E.0037
G3 X77.493 Y120.002 I-1.1 J-.487 E.01699
G1 X75.991 Y120.002 E.03905
G1 X75.991 Y114.199 E.15082
G3 X76.381 Y113.705 I1.384 J.693 E.01647
G1 X77.603 Y112.761 E.04014
G1 X83.232 Y112.761 E.14629
G1 X83.232 Y114.021 E.03275
G2 X82.83 Y114.976 I2.422 J1.58 E.02709
G1 X82.939 Y115.105 E.00437
G3 X83.116 Y116.381 I-7.128 J1.644 E.03354
G1 X83.232 Y116.714 E.00915
G1 X83.232 Y118.377 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.08
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y116.714 E-.63181
G1 X83.121 Y116.395 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/38
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.32 I.212 J1.198 P1  F42000
G1 X105.637 Y112.408 Z3.32
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
; WIPE_START
M204 S4000
G1 X110.496 Y118.498 E-.46878
G1 X110.455 Y118.617 E-.0478
G1 X110.303 Y118.691 E-.06416
G1 X109.832 Y118.691 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.325 Y115.096 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.265 Y115.096 E.02293
; WIPE_START
G1 X108.325 Y114.264 E-.31705
G1 X108.354 Y114.084 E-.06942
G1 X108.452 Y113.898 E-.07974
G1 X108.646 Y113.737 E-.09594
G1 X108.919 Y113.671 E-.10671
G1 X109.159 Y113.671 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.48 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.48
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.48 F4000
            G39.3 S1
            G0 Z3.48 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.932 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y117.594 E.04321
G3 X106.356 Y118.611 I-2.343 J1.416 E.02827
G3 X105.991 Y119.785 I-1.43 J.198 E.03299
G1 X105.991 Y120.002 E.00564
G1 X108.299 Y120.002 E.05999
G3 X108.54 Y119.773 I.865 J.668 E.00867
G3 X107.563 Y118.429 I.378 J-1.301 E.04646
G3 X106.152 Y117.314 I-.027 J-1.416 E.05066
G3 X106.132 Y115.672 I9.43 J-.938 E.04274
G3 X107.563 Y114.333 I1.401 J.064 E.05639
G1 X107.579 Y114.015 E.00828
G3 X108.401 Y112.761 I2.903 J1.006 E.03938
G1 X113.034 Y112.761 E.12042
G1 X111.993 Y113.705 E.03653
G1 X111.689 Y114.151 E.01403
G2 X111.659 Y114.333 I.177 J.123 E.00496
G3 X113.091 Y115.672 I.03 J1.402 E.05639
G1 X113.091 Y117.08 E.03659
G3 X113.026 Y117.446 I-.785 J.05 E.00977
G3 X113.232 Y117.767 I-.668 J.655 E.00999
G1 X113.232 Y119.657 E.04911
G3 X112.932 Y120.002 I-1.272 J-.802 E.01192
G1 X111.27 Y120.002 E.04321
; WIPE_START
G1 X112.932 Y120.002 E-.63181
G1 X113.153 Y119.747 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.528 Y120.065 Z3.48 F42000
G1 X98.585 Y120.355 Z3.48
G1 Z3.08
M73 P65 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
M73 P65 R5
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.132 Y117.033 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X92.022 Y118.317 I1.43 J-.041 E.04295
G3 X91.525 Y120.002 I-1.484 J.478 E.0485
G1 X90.991 Y120.002 E.01389
G1 X90.991 Y113.344 E.17305
G2 X91.627 Y112.761 I-1.579 J-2.362 E.02252
G1 X98.232 Y112.761 E.17166
G1 X98.232 Y113.25 E.01271
G2 X97.279 Y114.487 I1.58 J2.202 E.04116
G3 X98.091 Y115.821 I-.589 J1.272 E.04306
; WIPE_START
G1 X97.94 Y115.084 E-.28588
G1 X97.566 Y114.636 E-.22158
G1 X97.279 Y114.487 E-.12322
G1 X97.409 Y114.172 E-.12932
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.838 Y113.206 Z3.48 F42000
G1 X83.585 Y112.408 Z3.48
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y115.146 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.78 Y118.166 Z3.48 F42000
G1 Z3.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X77.607 Y118.386 I.825 J-1.44 E.02248
G2 X77.79 Y119.142 I1.634 J.004 E.02043
G3 X77.253 Y120.002 I-1.92 J-.602 E.02662
G1 X75.991 Y120.002 E.03282
G1 X75.991 Y114.2 E.1508
G3 X76.315 Y113.705 I1.348 J.531 E.01547
G1 X77.356 Y112.761 E.03653
G1 X83.232 Y112.761 E.15273
G1 X83.232 Y114.015 E.0326
G2 X82.87 Y115.024 I2.532 J1.475 E.02802
G2 X81.616 Y114.377 I-1.163 J.715 E.03857
G2 X81.61 Y114.199 I-1.002 J-.06 E.00464
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X81.616 Y114.377 E-.0677
G1 X82.134 Y114.438 E-.19844
G1 X82.561 Y114.657 E-.18219
G1 X82.87 Y115.024 E-.1826
G1 X82.941 Y114.692 E-.12906
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/38
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.48 I.122 J1.211 P1  F42000
G1 X105.637 Y112.408 Z3.48
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
M73 P66 R5
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
; WIPE_START
M204 S4000
G1 X110.496 Y118.498 E-.46878
G1 X110.455 Y118.617 E-.0478
G1 X110.303 Y118.691 E-.06416
G1 X109.832 Y118.691 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.897 Y115.096 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.64 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.64
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.64 F4000
            G39.3 S1
            G0 Z3.64 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X107.518 Y114.336 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X107.563 Y114.333 E.00118
G3 X108.353 Y113.032 I1.426 J-.025 E.04174
G3 X108.919 Y112.761 I.421 J.154 E.01806
G1 X112.838 Y112.761 E.10186
G2 X111.922 Y113.705 I9.544 J10.176 E.03422
G2 X111.653 Y114.214 I1.064 J.887 E.01506
G1 X111.659 Y114.333 E.00311
G3 X113.091 Y115.672 I.03 J1.402 E.05639
G3 X113.07 Y117.314 I-9.45 J.704 E.04274
G1 X113.045 Y117.39 E.00209
G3 X113.232 Y117.729 I-.706 J.61 E.01014
G1 X113.232 Y119.37 E.04264
G3 X112.736 Y120.002 I-2.778 J-1.667 E.02093
G1 X105.991 Y120.002 E.17533
G1 X105.991 Y119.559 E.0115
G2 X105.991 Y117.537 I-1.706 J-1.011 E.05517
G1 X105.991 Y115.874 E.04321
; WIPE_START
G1 X105.991 Y117.537 E-.63181
G1 X106.111 Y117.852 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.927 Y113.378 Z3.64 F42000
G1 X98.585 Y112.408 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
M204 S10000
G1 X93.35 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.351 Y117.702 E.02351
; WIPE_START
G1 X92.494 Y117.642 E-.32651
G1 X92.317 Y117.615 E-.06796
G1 X92.131 Y117.518 E-.07999
G1 X91.968 Y117.323 E-.09643
G1 X91.9 Y117.048 E-.1074
G1 X91.9 Y116.833 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.132 Y116.978 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X91.973 Y118.291 I1.418 J.018 E.04292
G3 X91.329 Y120.002 I-1.796 J.3 E.04976
G1 X90.991 Y120.002 E.00879
G1 X90.991 Y113.18 E.17732
G2 X91.431 Y112.761 I-1.583 J-2.104 E.01583
G1 X98.232 Y112.761 E.17676
G3 X98.04 Y113.259 I-.327 J.161 E.01558
G2 X97.295 Y114.495 I1.869 J1.97 E.03796
G3 X98.091 Y115.839 I-.617 J1.273 E.04301
; WIPE_START
G1 X97.94 Y115.084 E-.29252
G1 X97.566 Y114.636 E-.22158
G1 X97.295 Y114.495 E-.11644
G1 X97.396 Y114.169 E-.12946
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.824 Y113.204 Z3.64 F42000
G1 X83.585 Y112.408 Z3.64
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
M73 P67 R5
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y115.146 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.616 Y118.052 Z3.64 F42000
G1 Z3.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X76.662 Y118.106 E.00183
G2 X77.607 Y118.386 I.953 J-1.479 E.02597
G2 X77.686 Y119.057 I4.858 J-.237 E.01759
G3 X77.058 Y120.002 I-2.492 J-.977 E.02972
G1 X75.991 Y120.002 E.02773
G1 X75.991 Y114.161 E.15179
G3 X77.159 Y112.761 I3.991 J2.142 E.04774
G1 X83.232 Y112.761 E.15783
G1 X83.232 Y113.969 E.03139
G2 X83.232 Y116.024 I1.72 J1.028 E.05609
G1 X83.232 Y117.687 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y116.024 E-.63181
G1 X83.091 Y115.718 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/38
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.64 I.177 J1.204 P1  F42000
G1 X105.637 Y112.408 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
; WIPE_START
M204 S4000
G1 X110.496 Y118.498 E-.46878
G1 X110.455 Y118.617 E-.0478
G1 X110.303 Y118.691 E-.06416
G1 X109.832 Y118.691 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.897 Y115.096 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X111.004 Y112.761 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X112.667 Y112.761 E.04321
G2 X111.65 Y114.14 I1.732 J2.343 E.04522
G1 X111.659 Y114.333 E.00503
G3 X113.091 Y115.672 I.03 J1.402 E.05639
G3 X113.071 Y117.303 I-9.388 J.704 E.04246
G1 X113.232 Y117.663 E.01025
G1 X113.232 Y119.097 E.03727
G3 X112.568 Y120.002 I-3.221 J-1.667 E.02928
G1 X105.991 Y120.002 E.17095
G1 X105.991 Y119.295 E.01837
G2 X105.991 Y117.427 I-1.839 J-.934 E.05039
G1 X105.991 Y115.764 E.04321
; WIPE_START
G1 X105.991 Y117.427 E-.63181
G1 X106.121 Y117.719 E-.12152
G1 X106.124 Y117.736 E-.00667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.891 Y113.331 Z3.8 F42000
G1 X98.585 Y112.408 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
M73 P68 R5
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
M204 S10000
G1 X93.35 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.351 Y117.702 E.02351
; WIPE_START
G1 X92.494 Y117.642 E-.32651
G1 X92.317 Y117.615 E-.06796
G1 X92.131 Y117.518 E-.07999
G1 X91.968 Y117.323 E-.09643
G1 X91.9 Y117.048 E-.1074
G1 X91.9 Y116.833 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.132 Y116.943 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X91.942 Y118.275 I1.417 J.05 E.0429
G3 X91.161 Y120.002 I-2.157 J.064 E.05099
G1 X90.991 Y120.002 E.00442
G1 X90.991 Y113.037 E.18101
G2 X91.26 Y112.761 I-2.32 J-2.527 E.01003
G1 X98.232 Y112.761 E.18121
G1 X98.232 Y112.931 E.00443
G2 X97.301 Y114.498 I1.838 J2.151 E.04822
G3 X98.091 Y115.846 I-.629 J1.273 E.04299
; WIPE_START
G1 X97.94 Y115.084 E-.29527
G1 X97.566 Y114.636 E-.22158
G1 X97.301 Y114.498 E-.11364
G1 X97.37 Y114.164 E-.12951
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.799 Y113.2 Z3.8 F42000
G1 X83.585 Y112.408 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y115.146 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.315 Y115.146 E.02408
; WIPE_START
G1 X78.375 Y114.264 E-.33596
G1 X78.401 Y114.091 E-.06651
G1 X78.498 Y113.903 E-.08023
G1 X78.693 Y113.739 E-.09693
G1 X78.969 Y113.671 E-.10809
G1 X79.159 Y113.671 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.489 Y117.901 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X77.607 Y118.386 I1.021 J-.823 E.03294
G3 X76.889 Y120.002 I-1.854 J.144 E.04788
G1 X75.991 Y120.002 E.02336
G1 X75.991 Y114.095 E.15351
G3 X76.988 Y112.761 I2.667 J.953 E.04396
G1 X83.232 Y112.761 E.16227
G1 X83.232 Y113.859 E.02855
G2 X83.232 Y115.727 I1.839 J.934 E.05038
G1 X83.232 Y117.39 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y115.727 E-.63181
G1 X83.105 Y115.489 E-.10233
G1 X83.091 Y115.423 E-.02586
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/38
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.8 I.161 J1.206 P1  F42000
G1 X105.637 Y112.408 Z3.8
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
M73 P69 R5
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.96 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.96
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.96 F4000
            G39.3 S1
            G0 Z3.96 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X105.991 Y115.582 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y117.244 E.04321
G3 X105.991 Y119.101 I-1.858 J.928 E.05003
G1 X105.991 Y120.002 E.02341
G1 X112.409 Y120.002 E.16683
G1 X112.458 Y119.949 E.00187
G2 X113.232 Y118.82 I-1.83 J-2.082 E.03594
G1 X113.232 Y117.53 E.03352
G2 X113.082 Y117.176 I-.783 J.121 E.0101
G2 X113.091 Y115.672 I-8.64 J-.8 E.03914
G2 X111.659 Y114.333 I-1.401 J.064 E.05639
G3 X111.756 Y113.705 I.848 J-.191 E.01691
G3 X112.507 Y112.761 I4.5 J2.808 E.03144
G1 X110.845 Y112.761 E.04321
; WIPE_START
G1 X112.507 Y112.761 E-.63181
G1 X112.277 Y113.007 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.652 Y112.673 Z3.96 F42000
G1 X98.585 Y112.408 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
M204 S10000
G1 X93.35 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.351 Y117.702 E.02351
; WIPE_START
G1 X92.494 Y117.642 E-.32651
G1 X92.317 Y117.615 E-.06796
G1 X92.131 Y117.518 E-.07999
G1 X91.968 Y117.323 E-.09643
G1 X91.9 Y117.048 E-.1074
G1 X91.9 Y116.833 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.991 Y118.351 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X91.002 Y120.002 E.04292
G2 X91.926 Y118.267 I-1.64 J-1.986 E.05241
G2 X92.588 Y118.405 I.543 J-.948 E.01787
G2 X93.926 Y119.861 I1.405 J.051 E.05702
G2 X95.519 Y119.84 I.679 J-9.158 E.04144
G2 X96.635 Y118.405 I-.304 J-1.388 E.05129
G2 X98.091 Y117.055 I.102 J-1.35 E.05794
G1 X98.091 Y115.697 E.0353
G2 X97.298 Y114.496 I-1.46 J.102 E.03909
G3 X98.232 Y112.765 I2.601 J.286 E.05241
G1 X98.232 Y114.428 E.04321
; WIPE_START
G1 X98.232 Y112.765 E-.63181
G1 X98.002 Y113.012 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.376 Y112.692 Z3.96 F42000
G1 X83.585 Y112.408 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
M73 P70 R5
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
M204 S10000
G1 X78.375 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.393 Y120.002 Z3.96 F42000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X76.731 Y120.002 E.04321
G2 X77.607 Y118.505 I-1.554 J-1.914 E.04606
G1 X77.607 Y118.386 E.00309
G3 X76.132 Y117.03 I-.054 J-1.421 E.05778
G1 X76.132 Y115.721 E.034
G2 X75.991 Y115.252 I-.972 J.036 E.01288
G1 X75.991 Y113.962 E.03352
G3 X76.78 Y112.813 I2.646 J.972 E.0366
G1 X76.828 Y112.761 E.00187
G1 X83.232 Y112.761 E.16642
G1 X83.232 Y113.666 E.02354
G2 X83.232 Y115.545 I1.925 J.939 E.05054
G1 X83.232 Y117.208 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.72
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y115.545 E-.63181
G1 X83.121 Y115.226 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/38
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z3.96 I.151 J1.208 P1  F42000
G1 X105.637 Y112.408 Z3.96
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.12
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.12 F4000
            G39.3 S1
            G0 Z4.12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.732 Y114.808 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X111.659 Y114.333 I-1.128 J1.099 E.03124
G3 X112.297 Y112.813 I1.566 J-.236 E.04506
G1 X112.349 Y112.761 E.00192
G1 X113.232 Y112.761 E.02294
G1 X113.232 Y118.676 E.15375
G3 X112.25 Y120.002 I-2.612 J-.908 E.04353
G1 X105.991 Y120.002 E.16269
G1 X105.991 Y118.918 E.02816
G2 X105.991 Y117.059 I-1.849 J-.93 E.05013
G1 X105.991 Y115.396 E.04321
; WIPE_START
G1 X105.991 Y117.059 E-.63181
G1 X106.107 Y117.273 E-.09268
G1 X106.128 Y117.364 E-.03551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.749 Y113.173 Z4.12 F42000
G1 X98.585 Y112.408 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
M73 P71 R5
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
M204 S10000
G1 X93.35 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.351 Y117.702 E.02351
; WIPE_START
G1 X92.494 Y117.642 E-.32651
G1 X92.317 Y117.615 E-.06796
G1 X92.131 Y117.518 E-.07999
G1 X91.968 Y117.323 E-.09643
G1 X91.9 Y117.048 E-.1074
G1 X91.9 Y116.833 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.856 Y119.317 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X92.588 Y118.405 I1.091 J-.817 E.02526
G3 X91.921 Y118.264 I-.119 J-1.089 E.01801
M73 P71 R4
G3 X90.991 Y119.847 I-2.752 J-.553 E.04861
G1 X90.991 Y120.002 E.00403
G1 X97.979 Y120.002 E.18163
G3 X98.232 Y119.74 I2.698 J2.356 E.00946
G1 X98.232 Y112.761 E.1814
G1 X98.077 Y112.761 E.00401
G2 X97.282 Y114.488 I1.399 J1.691 E.05112
G2 X96.635 Y114.358 I-.528 J.948 E.01745
G2 X96.356 Y113.426 I-1.385 J-.093 E.02582
; WIPE_START
G1 X96.577 Y113.85 E-.18157
G1 X96.635 Y114.358 E-.1943
G1 X96.97 Y114.373 E-.12775
G1 X97.282 Y114.488 E-.12643
G1 X97.284 Y114.151 E-.12805
G1 X97.285 Y114.146 E-.0019
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.713 Y113.185 Z4.12 F42000
G1 X83.585 Y112.408 Z4.12
G1 Z3.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
M204 S10000
G1 X78.375 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.234 Y120.002 Z4.12 F42000
G1 Z3.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X76.571 Y120.002 E.04321
G2 X77.607 Y118.386 I-1.946 J-2.386 E.05072
G3 X76.132 Y117.03 I-.054 J-1.421 E.05778
G1 X76.132 Y115.721 E.034
G1 X76.181 Y115.523 E.00532
G3 X75.991 Y115.108 I.805 J-.62 E.01195
G1 X75.991 Y113.685 E.03699
G3 X76.67 Y112.761 I3.328 J1.734 E.02994
G1 X83.232 Y112.761 E.17054
G1 X83.232 Y113.491 E.01898
G2 X83.232 Y115.35 I1.849 J.93 E.05013
G1 X83.232 Y117.013 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 3.88
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y115.35 E-.63181
G1 X83.098 Y115.043 E-.12723
G1 X83.098 Y115.041 E-.00096
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/38
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.12 I.141 J1.209 P1  F42000
G1 X105.637 Y112.408 Z4.12
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.637 Y120.355 E.20656
G1 X105.637 Y112.468 E.205
; WIPE_START
G1 X107.637 Y112.452 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y111.591 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.821 Y121.171 E.23102
G1 X104.821 Y111.651 E.22957
M204 S10000
G1 X105.222 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.222 Y120.771 E.22817
G1 X105.222 Y112.052 E.22661
; WIPE_START
G1 X107.222 Y112.038 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y118.083 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.312 Y114.68 E.01571
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.372 Y118.081 E.01415
; WIPE_START
G1 X111.295 Y118.687 E-.23214
G1 X111.098 Y119.121 E-.18109
G1 X110.767 Y119.395 E-.16313
G1 X110.478 Y119.492 E-.11614
G1 X110.303 Y119.508 E-.06651
G1 X110.301 Y119.508 E-.00099
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.28 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.28
M73 P72 R4
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.28 F4000
            G39.3 S1
            G0 Z4.28 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X107.566 Y118.476 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X107.563 Y118.429 E.00122
G3 X106.284 Y117.705 I.062 J-1.602 E.03969
G1 X106.262 Y117.641 E.00176
G3 X105.991 Y118.802 I-1.833 J.183 E.03156
G1 X105.991 Y120.002 E.03118
G1 X112.081 Y120.002 E.15829
G2 X113.232 Y118.608 I-2.801 J-3.485 E.0473
G1 X113.232 Y112.761 E.15199
G1 X112.182 Y112.761 E.02728
G2 X111.548 Y113.705 I1.923 J1.977 E.02979
G3 X111.659 Y114.333 I-2.523 J.771 E.01662
G3 X112.572 Y114.616 I.077 J1.368 E.02538
G1 X112.618 Y114.671 E.00187
; WIPE_START
G1 X112.572 Y114.616 E-.02728
G1 X112.151 Y114.393 E-.1811
G1 X111.659 Y114.333 E-.18833
G1 X111.643 Y114.015 E-.12099
G1 X111.548 Y113.705 E-.12328
G1 X111.673 Y113.418 E-.11902
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.064 Y112.831 Z4.28 F42000
G1 X98.585 Y112.408 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
M204 S10000
G1 X93.35 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.351 Y117.702 E.02351
; WIPE_START
G1 X92.494 Y117.642 E-.32651
G1 X92.317 Y117.615 E-.06796
G1 X92.131 Y117.518 E-.07999
G1 X91.968 Y117.323 E-.09643
G1 X91.9 Y117.048 E-.1074
G1 X91.9 Y116.833 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.859 Y119.323 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X92.588 Y118.405 I1.096 J-.823 E.02543
G3 X91.926 Y118.267 I-.119 J-1.086 E.01785
G3 X91.195 Y119.503 I-2.597 J-.702 E.03778
G2 X90.991 Y120.002 I.131 J.345 E.0157
G1 X97.809 Y120.002 E.17722
G3 X98.232 Y119.596 I2.057 J1.72 E.01525
G1 X98.232 Y112.761 E.17766
G1 X97.911 Y112.761 E.00834
G2 X97.253 Y114.473 I1.172 J1.432 E.04988
G2 X96.635 Y114.358 I-.498 J.956 E.0166
G2 X96.356 Y113.426 I-1.385 J-.093 E.02583
G1 X96.331 Y113.405 E.00085
; WIPE_START
G1 X96.356 Y113.426 E-.01247
G1 X96.577 Y113.85 E-.18164
G1 X96.635 Y114.358 E-.1943
G1 X96.97 Y114.373 E-.12775
G1 X97.253 Y114.473 E-.11401
G1 X97.222 Y114.151 E-.12283
G1 X97.224 Y114.133 E-.00701
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.652 Y113.175 Z4.28 F42000
G1 X83.585 Y112.408 Z4.28
G1 Z3.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
M204 S10000
G1 X78.375 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.668 Y118.386 Z4.28 F42000
G1 Z3.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X81.616 Y118.386 E.00136
G3 X80.867 Y119.713 I-1.445 J.06 E.04172
G3 X80.608 Y120.002 I-1.443 J-1.034 E.0101
G1 X76.402 Y120.002 E.10932
G2 X77.607 Y118.429 I-2.386 J-3.075 E.05207
G1 X77.607 Y118.386 E.00112
G3 X76.132 Y117.03 I-.054 J-1.421 E.05778
G1 X76.132 Y115.721 E.034
G1 X76.203 Y115.431 E.00778
G3 X75.991 Y115.04 I.812 J-.696 E.01164
G1 X75.991 Y113.427 E.04192
G3 X76.503 Y112.761 I2.686 J1.535 E.02193
G1 X83.232 Y112.761 E.17487
G1 X83.232 Y113.197 E.01134
M73 P73 R4
G2 X83.232 Y115.234 I1.756 J1.019 E.05546
G1 X83.232 Y116.897 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 4.04
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X83.232 Y115.234 E-.63181
G1 X83.114 Y114.918 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/38
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.28 I-.286 J1.183 P1  F42000
G1 X105.637 Y120.355 Z4.28
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
M204 S10000
G1 X110.897 Y115.096 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.44 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.44
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.44 F4000
            G39.3 S1
            G0 Z4.44 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.478 Y114.566 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X111.659 Y114.333 I-.731 J1.014 E.02258
G2 X111.46 Y113.579 I-1.17 J-.095 E.02067
G3 X111.989 Y112.761 I1.971 J.695 E.02555
G1 X113.232 Y112.761 E.03229
G1 X113.232 Y118.565 E.15085
G3 X112.914 Y119.057 I-1.34 J-.514 E.01534
G1 X111.888 Y120.002 E.03626
G1 X105.991 Y120.002 E.15327
G1 X105.991 Y118.74 E.03279
G2 X106.337 Y117.769 I-2.272 J-1.359 E.02697
G2 X107.563 Y118.429 I1.28 J-.91 E.03748
G1 X107.573 Y118.627 E.00516
; WIPE_START
G1 X107.563 Y118.429 E-.07538
G1 X107.071 Y118.369 E-.18832
G1 X106.65 Y118.147 E-.18111
G1 X106.337 Y117.769 E-.18613
G1 X106.27 Y118.102 E-.12906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.946 Y120.249 Z4.44 F42000
G1 X98.585 Y120.355 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.29 Y113.371 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X96.356 Y113.426 E.00222
G3 X96.635 Y114.358 I-1.107 J.838 E.02583
G3 X97.206 Y114.449 I.117 J1.106 E.01522
G3 X97.718 Y112.761 I1.515 J-.463 E.04862
G1 X98.232 Y112.761 E.01335
G1 X98.232 Y119.43 E.17335
G2 X97.616 Y120.002 I1.676 J2.422 E.0219
G1 X90.991 Y120.002 E.17221
G1 X90.991 Y119.526 E.01237
G2 X91.941 Y118.275 I-1.583 J-2.19 E.04143
G2 X92.588 Y118.405 I.527 J-.948 E.01741
M73 P74 R4
G2 X92.868 Y119.338 I1.332 J.109 E.02591
; WIPE_START
G1 X92.645 Y118.913 E-.18219
G1 X92.588 Y118.405 E-.1943
G1 X92.252 Y118.39 E-.12775
G1 X91.941 Y118.275 E-.12577
G1 X91.813 Y118.592 E-.12999
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.35 Y120.191 Z4.44 F42000
G1 X83.585 Y120.355 Z4.44
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y117.617 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.232 Y116.844 Z4.44 F42000
G1 Z4.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X83.232 Y115.181 E.04321
G3 X83.02 Y113.259 I1.843 J-1.176 E.05204
G2 X83.232 Y112.761 I-.195 J-.378 E.01527
G1 X80.902 Y112.761 E.06054
G3 X80.657 Y112.997 I-.942 J-.735 E.00889
G3 X81.616 Y114.377 I-.372 J1.282 E.04724
G3 X83.091 Y115.721 I.06 J1.416 E.05755
G1 X83.091 Y117.03 E.03401
G3 X81.616 Y118.386 I-1.421 J-.065 E.05778
G3 X80.801 Y120.002 I-2.411 J-.202 E.04821
G1 X76.209 Y120.002 E.11935
G1 X77.236 Y119.057 E.03626
G2 X77.607 Y118.386 I-.912 J-.942 E.02023
G3 X76.152 Y117.264 I-.06 J-1.427 E.05186
G3 X76.132 Y115.721 I8.851 J-.888 E.04014
G1 X76.221 Y115.359 E.00969
G3 X75.991 Y114.997 I.755 J-.734 E.01125
G1 X75.991 Y113.13 E.04851
G3 X76.311 Y112.761 I1.442 J.925 E.01274
G1 X77.973 Y112.761 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.311 Y112.761 E-.63181
G1 X76.09 Y113.016 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/38
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.44 I-.293 J1.181 P1  F42000
G1 X105.637 Y120.355 Z4.44
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
M204 S10000
G1 X110.897 Y115.096 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X112.259 Y114.45 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X111.659 Y114.333 I-.494 J.936 E.01612
G2 X111.324 Y113.377 I-1.955 J.148 E.02665
G1 X111.343 Y113.259 E.00309
G3 X111.756 Y112.761 I1.155 J.536 E.01702
G1 X113.232 Y112.761 E.03835
G1 X113.232 Y118.562 E.15079
G3 X112.848 Y119.057 I-1.384 J-.678 E.01639
G1 X111.647 Y120.002 E.0397
G1 X105.991 Y120.002 E.14702
G1 X105.991 Y118.711 E.03355
G2 X106.376 Y117.816 I-1.805 J-1.307 E.02553
G2 X107.563 Y118.429 I1.09 J-.655 E.03657
G1 X107.576 Y118.688 E.00672
; WIPE_START
G1 X107.563 Y118.429 E-.0983
G1 X107.071 Y118.369 E-.18832
G1 X106.65 Y118.147 E-.18111
G1 X106.376 Y117.816 E-.16321
G1 X106.303 Y118.148 E-.12906
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.965 Y120.246 Z4.6 F42000
G1 X98.585 Y120.355 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
M73 P75 R4
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
M204 S10000
G1 X93.35 Y115.121 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.872 Y117.642 E.02507
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.29 Y115.121 E.02351
; WIPE_START
G1 X93.35 Y114.264 E-.32651
G1 X93.377 Y114.087 E-.06796
G1 X93.475 Y113.901 E-.07999
G1 X93.669 Y113.738 E-.09643
G1 X93.944 Y113.671 E-.1074
G1 X94.159 Y113.671 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.247 Y113.335 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X96.635 Y114.358 I-1.316 J1.084 E.02895
G3 X97.156 Y114.422 I.094 J1.377 E.01374
G1 X96.999 Y113.705 E.01908
G3 X97.416 Y112.813 I1.033 J-.06 E.02668
G1 X97.485 Y112.761 E.00224
G1 X98.232 Y112.761 E.01941
G1 X98.232 Y119.322 E.17054
G1 X97.376 Y120.002 E.02841
G1 X90.991 Y120.002 E.16595
G1 X90.991 Y119.403 E.01556
G2 X91.965 Y118.287 I-1.51 J-2.302 E.03898
G2 X92.588 Y118.405 I.502 J-.954 E.01671
G2 X92.888 Y119.355 I1.304 J.11 E.02657
; WIPE_START
G1 X92.645 Y118.913 E-.19165
G1 X92.588 Y118.405 E-.1943
G1 X92.252 Y118.39 E-.12775
G1 X91.965 Y118.287 E-.11566
G1 X91.808 Y118.593 E-.13064
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.345 Y120.192 Z4.6 F42000
G1 X83.585 Y120.355 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.375 Y117.617 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.625 Y120.002 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X75.991 Y120.002 E.04247
G3 X76.009 Y119.949 I.043 J-.014 E.00156
G1 X77.169 Y119.057 E.03803
G1 X77.528 Y118.611 E.01488
G2 X77.607 Y118.386 I-.181 J-.19 E.00644
G3 X76.152 Y117.264 I-.06 J-1.427 E.05186
G3 X76.132 Y115.721 I8.851 J-.888 E.04014
G1 X76.232 Y115.313 E.01095
G3 X75.991 Y114.994 I.646 J-.742 E.01046
G1 X75.991 Y113.332 E.04321
; WIPE_START
G1 X75.991 Y114.994 E-.63181
G1 X76.195 Y115.263 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.616 Y114.373 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
G1 F12000
M204 S4000
G2 X80.813 Y113.036 I-1.36 J-.094 E.04316
G2 X81.143 Y112.761 I-.358 J-.764 E.01128
G1 X83.161 Y112.761 E.05246
G1 X83.145 Y112.813 E.00143
G2 X82.727 Y113.705 I.616 J.832 E.02668
G2 X83.232 Y115.174 I3.37 J-.337 E.04072
G1 X83.232 Y119.673 E.11694
G3 X83.104 Y120.002 I-.509 J-.008 E.00935
G1 X81.034 Y120.002 E.05381
G2 X81.507 Y118.997 I-.654 J-.922 E.03016
G2 X81.616 Y118.386 I-1.771 J-.631 E.01622
G2 X82.58 Y118.083 I.087 J-1.408 E.02687
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X82.134 Y118.325 E-.19278
G1 X81.616 Y118.386 E-.19844
G1 X81.595 Y118.738 E-.13389
G1 X81.507 Y118.997 E-.10424
G1 X81.466 Y119.339 E-.13064
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/38
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.6 I-.051 J1.216 P1  F42000
G1 X105.637 Y120.355 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
M73 P76 R4
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.897 Y117.667 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.76 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.76
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.76 F4000
            G39.3 S1
            G0 Z4.76 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X107.592 Y118.8 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X107.563 Y118.429 I.904 J-.257 E.00973
G3 X106.449 Y117.904 I-.099 J-1.235 E.03351
G3 X105.991 Y118.702 I-2.442 J-.871 E.02405
G1 X105.991 Y120.002 E.03378
G1 X111.291 Y120.002 E.13775
G1 X112.107 Y119.503 E.02487
G2 X113.232 Y118.583 I-1.94 J-3.515 E.03797
G1 X113.232 Y112.761 E.15131
G1 X111.415 Y112.761 E.04722
G1 X111.322 Y112.813 E.00277
G1 X111.098 Y113.189 E.01138
G3 X111.659 Y114.333 I-.685 J1.046 E.03476
G3 X111.985 Y114.351 I.119 J.812 E.00853
; WIPE_START
G1 X111.659 Y114.333 E-.12388
G1 X111.599 Y113.841 E-.18832
G1 X111.376 Y113.42 E-.18111
G1 X111.098 Y113.189 E-.13757
G1 X111.272 Y112.897 E-.12911
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.645 Y112.603 Z4.76 F42000
G1 X98.585 Y112.408 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y117.241 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.301 E.02887
; WIPE_START
M204 S4000
G1 X92.494 Y117.241 E-.47827
G1 X92.376 Y117.201 E-.04742
G1 X92.301 Y117.048 E-.06452
G1 X92.301 Y116.602 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y117.58 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y119.243 E.04321
G3 X97.051 Y119.949 I-5.964 J-8.63 E.03579
G1 X97.019 Y120.002 E.00159
G1 X95.647 Y120.002 E.03567
G2 X95.877 Y119.719 I-.135 J-.345 E.00992
G1 X95.519 Y119.84 E.00984
G3 X93.926 Y119.861 I-.913 J-9.137 E.04144
G3 X92.588 Y118.405 I.067 J-1.405 E.05702
G3 X91.998 Y118.304 I-.119 J-1.083 E.01576
G3 X90.991 Y119.312 I-2.509 J-1.501 E.0374
G1 X90.991 Y117.649 E.04321
; WIPE_START
G1 X90.991 Y119.312 E-.63181
G1 X91.272 Y119.127 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.841 Y112.91 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X95.497 Y112.951 I.523 J12.391 E.04309
G2 X95.771 Y112.761 I-.031 J-.337 E.00906
G1 X97.143 Y112.761 E.03567
G1 X97.051 Y112.813 E.00277
G1 X96.784 Y113.259 E.0135
G2 X97.066 Y114.397 I2.29 J.035 E.0308
G3 X98.065 Y115.592 I-.266 J1.237 E.04361
; WIPE_START
G1 X97.94 Y115.084 E-.19877
G1 X97.566 Y114.636 E-.22158
G1 X97.066 Y114.397 E-.21074
G1 X96.953 Y114.077 E-.12891
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.044 Y117.321 Z4.76 F42000
G1 X83.585 Y120.355 Z4.76
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
M73 P76 R3
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
M73 P77 R3
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.464 Y119.843 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X81.591 Y118.756 I-.329 J-1.467 E.04279
G3 X81.735 Y119.503 I-1.341 J.646 E.02001
G1 X81.468 Y119.949 E.0135
G1 X81.375 Y120.002 E.00277
G1 X82.748 Y120.002 E.03567
G1 X83.232 Y119.637 E.01575
G1 X83.232 Y115.182 E.11579
G3 X82.55 Y113.705 I3.931 J-2.712 E.04248
G1 X82.513 Y113.259 E.01163
G1 X82.855 Y112.761 E.01573
G1 X81.499 Y112.761 E.03524
G1 X80.951 Y113.107 E.01687
G2 X79.326 Y112.902 I-1.177 J2.781 E.0431
; WIPE_START
G1 X80.271 Y112.902 E-.35907
G1 X80.951 Y113.107 E-.26984
G1 X81.242 Y112.923 E-.13109
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y113.352 Z4.76 F42000
G1 Z4.36
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X75.991 Y115.015 E.04321
G2 X76.24 Y115.284 I.761 J-.454 E.0096
G1 X76.132 Y115.721 E.01172
G2 X76.152 Y117.264 I8.871 J.654 E.04014
G2 X77.607 Y118.386 I1.395 J-.305 E.05186
G3 X77.535 Y118.611 I-.217 J.055 E.00648
G3 X75.991 Y119.752 I-4.072 J-3.897 E.05015
G1 X75.991 Y120.002 E.00649
G1 X77.404 Y120.002 E.03672
; CHANGE_LAYER
; Z_HEIGHT: 4.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y120.002 E-.53689
G1 X75.991 Y119.752 E-.09492
G1 X76.277 Y119.574 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/38
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.76 I-.032 J1.217 P1  F42000
G1 X105.637 Y120.355 Z4.76
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.897 Y117.667 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.92 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.92
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.92 F4000
            G39.3 S1
            G0 Z4.92 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y116.933 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y118.596 E.04321
G3 X111.113 Y119.649 I-2.465 J-2.302 E.06284
G1 X111.045 Y119.617 E.00194
G3 X110.544 Y119.84 I-.542 J-.542 E.0146
G3 X108.902 Y119.861 I-.938 J-9.423 E.04273
G3 X107.563 Y118.429 I.064 J-1.401 E.05639
G3 X106.515 Y117.984 I.063 J-1.603 E.03025
G3 X105.991 Y118.702 I-1.787 J-.756 E.02331
G1 X105.991 Y117.039 E.04321
; WIPE_START
G1 X105.991 Y118.702 E-.63181
G1 X106.207 Y118.485 E-.11633
G1 X106.223 Y118.458 E-.01186
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.816 Y120.298 Z4.92 F42000
G1 X98.585 Y120.355 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
M73 P78 R3
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
; WIPE_START
M204 S4000
G1 X93.751 Y114.264 E-.47827
G1 X93.792 Y114.146 E-.04742
G1 X93.944 Y114.071 E-.06452
G1 X94.391 Y114.071 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y117.526 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y119.189 E.04321
G3 X96.841 Y119.649 I-2.566 J-5.423 E.03817
G1 X96.395 Y119.435 E.01286
G1 X96.348 Y119.343 E.00268
G3 X95.519 Y119.84 I-1.057 J-.823 E.02571
G3 X93.926 Y119.861 I-.913 J-9.137 E.04144
G3 X92.588 Y118.405 I.067 J-1.405 E.05702
G3 X92.035 Y118.324 I-.113 J-1.154 E.01467
G3 X90.991 Y119.244 I-1.815 J-1.007 E.03688
G1 X90.991 Y117.581 E.04321
; WIPE_START
G1 X90.991 Y119.244 E-.63181
G1 X91.277 Y119.065 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.418 Y112.902 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F12000
M204 S4000
G3 X96.395 Y113.327 I.439 J2.765 E.05378
G2 X96.97 Y114.373 I3.783 J-1.401 E.03113
G3 X98.037 Y115.477 I-.227 J1.286 E.04265
; WIPE_START
G1 X97.94 Y115.084 E-.15387
G1 X97.566 Y114.636 E-.22158
G1 X96.97 Y114.373 E-.24767
G1 X96.797 Y114.057 E-.13689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.907 Y117.341 Z4.92 F42000
G1 X83.585 Y120.355 Z4.92
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.739 Y119.757 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G2 X81.616 Y118.469 I-.481 J-1.27 E.04313
G3 X82.124 Y119.435 I-6.047 J3.795 E.0284
G1 X82.57 Y119.649 E.01286
G2 X83.232 Y119.488 I-.059 J-1.684 E.01783
G1 X83.232 Y115.134 E.11317
G3 X82.124 Y113.327 I5.423 J-4.569 E.05529
G2 X81.107 Y113.239 I-.585 J.831 E.02779
G1 X80.887 Y113.054 E.00746
G2 X79.53 Y112.902 I-.987 J2.673 E.03584
; WIPE_START
G1 X80.271 Y112.902 E-.28146
G1 X80.887 Y113.054 E-.24128
G1 X81.107 Y113.239 E-.10907
G1 X81.436 Y113.167 E-.1282
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.991 Y113.366 Z4.92 F42000
G1 Z4.52
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X75.991 Y115.028 E.04321
G1 X76.241 Y115.279 E.00921
G1 X76.132 Y115.721 E.01184
G2 X76.152 Y117.264 I8.871 J.654 E.04014
G2 X77.607 Y118.386 I1.395 J-.305 E.05186
G2 X77.61 Y118.539 I.862 J.06 E.00399
G3 X75.991 Y119.529 I-2.427 J-2.15 E.05006
G1 X75.991 Y120.002 E.01228
G1 X77.181 Y120.002 E.03093
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y120.002 E-.45222
G1 X75.991 Y119.529 E-.17959
G1 X76.305 Y119.406 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/38
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z4.92 I-.039 J1.216 P1  F42000
G1 X105.637 Y120.355 Z4.92
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
M73 P79 R3
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.08 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.08
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.08 F4000
            G39.3 S1
            G0 Z5.08 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y116.977 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y118.64 E.04321
G3 X111.559 Y119.387 I-1.946 J-2.11 E.04847
G1 X111.351 Y119.363 E.00542
G3 X110.544 Y119.84 I-1.026 J-.814 E.02494
G3 X108.902 Y119.861 I-.938 J-9.423 E.04273
G3 X107.563 Y118.429 I.064 J-1.401 E.05639
G3 X106.57 Y118.05 I.096 J-1.743 E.02807
G3 X105.991 Y118.728 I-1.682 J-.851 E.0234
G1 X105.991 Y117.066 E.04321
; WIPE_START
G1 X105.991 Y118.728 E-.63181
G1 X106.207 Y118.546 E-.10731
G1 X106.239 Y118.502 E-.02088
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.821 Y120.298 Z5.08 F42000
G1 X98.585 Y120.355 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
; WIPE_START
M204 S4000
G1 X93.751 Y114.264 E-.47827
G1 X93.792 Y114.146 E-.04742
G1 X93.944 Y114.071 E-.06452
G1 X94.391 Y114.071 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y117.471 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y119.134 E.04321
G1 X97.287 Y119.387 E.02541
G3 X96.492 Y119.075 I-.131 J-.835 E.02326
G3 X95.519 Y119.84 I-1.349 J-.714 E.03315
G3 X93.926 Y119.861 I-.913 J-9.137 E.04144
G3 X92.588 Y118.405 I.067 J-1.405 E.05702
G3 X92.081 Y118.347 I-.111 J-1.291 E.01334
G3 X90.991 Y119.176 I-1.676 J-1.075 E.03633
G1 X90.991 Y117.513 E.04321
; WIPE_START
G1 X90.991 Y119.176 E-.63181
G1 X91.291 Y119.023 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.544 Y112.962 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F12000
M204 S4000
G1 X95.909 Y113.052 E.00977
G3 X96.622 Y114.07 I-.614 J1.189 E.0336
G1 X96.839 Y114.367 E.00956
G3 X98.01 Y115.368 I-.131 J1.338 E.04264
; WIPE_START
G1 X97.94 Y115.084 E-.11122
G1 X97.566 Y114.636 E-.22158
G1 X97.143 Y114.415 E-.18166
G1 X96.839 Y114.367 E-.11679
G1 X96.639 Y114.094 E-.12875
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.757 Y117.394 Z5.08 F42000
G1 X83.585 Y120.355 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
M73 P80 R3
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.75 Y112.902 Z5.08 F42000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X80.887 Y113.054 I.26 J2.38 E.03011
G1 X81.275 Y113.381 E.01318
G1 X81.678 Y113.427 E.01053
G1 X82.124 Y113.761 E.01448
G1 X83.016 Y114.978 E.03923
G1 X83.232 Y115.16 E.00734
G1 X83.232 Y119.332 E.10844
G3 X82.57 Y119.336 I-.336 J-.878 E.01758
G3 X81.672 Y118.386 I1.111 J-1.948 E.03446
G1 X81.616 Y118.386 E.00147
G3 X80.494 Y119.84 I-1.427 J.06 E.05186
G3 X78.951 Y119.861 I-.888 J-8.851 E.04014
G3 X77.614 Y118.588 I.076 J-1.418 E.05223
G3 X75.991 Y119.359 I-1.948 J-2.009 E.04755
G1 X75.991 Y117.696 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 4.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y119.359 E-.63181
G1 X76.318 Y119.277 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/38
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.08 I-.045 J1.216 P1  F42000
G1 X105.637 Y120.355 Z5.08
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.24 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.24
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.24 F4000
            G39.3 S1
            G0 Z5.24 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.232 Y117.027 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X113.232 Y118.69 E.04321
G3 X111.452 Y119.2 I-1.489 J-1.833 E.04946
G3 X110.544 Y119.84 I-1.313 J-.898 E.0295
G3 X108.902 Y119.861 I-.938 J-9.423 E.04273
G3 X107.563 Y118.429 I.064 J-1.401 E.05639
G3 X106.65 Y118.147 I-.077 J-1.368 E.02538
G1 X106.632 Y118.125 E.00072
G3 X105.991 Y118.764 I-1.62 J-.987 E.02375
G1 X105.991 Y117.101 E.04321
; WIPE_START
G1 X105.991 Y118.764 E-.63181
G1 X106.207 Y118.612 E-.10027
G1 X106.255 Y118.557 E-.02792
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.824 Y120.299 Z5.24 F42000
G1 X98.585 Y120.355 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.471 Y117.241 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
M73 P81 R3
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.531 Y117.241 E.02887
M204 S10000
G1 X95.872 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y117.432 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y119.094 E.04321
G3 X97.733 Y119.219 I-.591 J-1.299 E.01343
G3 X96.582 Y118.892 I-.229 J-1.382 E.03213
G3 X95.519 Y119.84 I-1.295 J-.381 E.03902
G3 X93.926 Y119.861 I-.913 J-9.137 E.04144
G3 X92.588 Y118.405 I.067 J-1.405 E.05702
G3 X92.151 Y118.365 I-.119 J-1.107 E.01146
G3 X90.991 Y119.129 I-1.621 J-1.199 E.03687
G1 X90.991 Y117.466 E.04321
; WIPE_START
G1 X90.991 Y119.129 E-.63181
G1 X91.303 Y119.001 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.785 Y120.32 Z5.24 F42000
G1 X83.585 Y120.355 Z5.24
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80 Y112.902 Z5.24 F42000
G1 Z4.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X80.271 Y112.902 E.00703
G3 X81.335 Y113.432 I-.004 J1.343 E.03202
G2 X81.678 Y113.659 I.278 J-.047 E.01197
G3 X83.016 Y115.044 I-3.43 J4.652 E.05028
G1 X83.232 Y115.196 E.00686
G1 X83.232 Y119.225 E.10473
G3 X82.57 Y119.103 I-.137 J-1.113 E.01777
G3 X81.809 Y118.379 I1.763 J-2.613 E.02742
G3 X81.616 Y118.386 I-.134 J-1.082 E.00504
G3 X80.494 Y119.84 I-1.427 J.06 E.05186
G3 X78.951 Y119.861 I-.888 J-8.851 E.04014
G3 X77.619 Y118.643 I.08 J-1.425 E.05078
G3 X75.991 Y119.228 I-1.569 J-1.811 E.046
G1 X75.991 Y117.565 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y119.228 E-.63181
G1 X76.325 Y119.18 E-.12819
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/38
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.24 I-.049 J1.216 P1  F42000
G1 X105.637 Y120.355 Z5.24
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
M73 P82 R3
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X109.948 Y119.931 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.469136
G1 F9600
M204 S4000
G1 X108.927 Y119.931 E.02776
M204 S10000
G1 X108.867 Y119.928 F42000
; LINE_WIDTH: 0.444818
G1 F9600
M204 S4000
G1 X108.312 Y119.775 E.01479
G1 X107.914 Y119.455 E.0131
G1 X107.832 Y119.515 E.00262
G1 X107.735 Y119.724 E.0059
G1 X107.765 Y119.945 E.00575
G2 X108.807 Y119.93 I.263 J-17.437 E.02675
; WIPE_START
G1 X107.765 Y119.945 E-.39599
G1 X107.735 Y119.724 E-.08506
G1 X107.832 Y119.515 E-.08741
G1 X107.914 Y119.455 E-.03883
G1 X108.227 Y119.707 E-.15272
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.991 Y117.145 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X105.991 Y118.807 E.04321
G2 X106.712 Y118.18 I-.817 J-1.668 E.02514
G3 X106.152 Y117.314 I1.154 J-1.362 E.0272
G3 X106.132 Y115.672 I9.43 J-.938 E.04274
G3 X107.563 Y114.333 I1.401 J.064 E.05639
G3 X108.679 Y112.922 I1.416 J-.027 E.05066
G3 X110.321 Y112.902 I.938 J9.423 E.04273
G3 X111.659 Y114.333 I-.064 J1.401 E.05639
G3 X113.091 Y115.672 I.03 J1.402 E.05639
G1 X113.091 Y117.08 E.03659
G3 X111.659 Y118.429 I-1.352 J0 E.05727
G3 X111.515 Y119.08 I-1.072 J.105 E.01762
G2 X113.232 Y118.747 I.457 J-2.23 E.04664
G1 X113.232 Y117.084 E.04321
; WIPE_START
G1 X113.232 Y118.747 E-.63181
G1 X112.939 Y118.915 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.345 Y119.677 Z5.4 F42000
G1 X98.585 Y120.355 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.471 Y117.241 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.531 Y117.241 E.02887
M204 S10000
G1 X95.872 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.232 Y117.405 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G1 X98.232 Y119.068 E.04321
G3 X96.62 Y118.727 I-.483 J-1.696 E.04453
G1 X96.635 Y118.405 E.00838
G2 X98.091 Y117.055 I.102 J-1.35 E.05794
G1 X98.091 Y115.697 E.0353
G2 X96.635 Y114.358 I-1.405 J.067 E.05702
G2 X95.296 Y112.902 I-1.405 J-.051 E.05702
G2 X93.704 Y112.922 I-.679 J9.158 E.04144
G2 X92.588 Y114.358 I.304 J1.388 E.05129
G2 X91.131 Y115.697 I-.051 J1.405 E.05702
G2 X91.152 Y117.289 I9.158 J.679 E.04144
G2 X92.234 Y118.385 I1.332 J-.232 E.04261
G3 X90.991 Y119.091 I-1.518 J-1.227 E.03805
G1 X90.991 Y117.429 E.04321
; WIPE_START
G1 X90.991 Y119.091 E-.63181
G1 X91.314 Y118.993 E-.12819
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.458 Y119.942 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.444706
G1 F9600
M204 S4000
G2 X93.485 Y119.814 I-.181 J-.105 E.00341
G1 X93.244 Y119.73 E.00655
G1 X92.932 Y119.452 E.01075
G1 X92.83 Y119.524 E.0032
G1 X92.738 Y119.732 E.00584
G1 X92.767 Y119.942 E.00544
G1 X93.398 Y119.942 E.01619
; WIPE_START
G1 X92.767 Y119.942 E-.23978
G1 X92.738 Y119.732 E-.08055
G1 X92.83 Y119.524 E-.08651
G1 X92.932 Y119.452 E-.04744
G1 X93.244 Y119.73 E-.15914
G1 X93.485 Y119.814 E-.09697
G1 X93.458 Y119.942 E-.0496
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.833 Y120.261 Z5.4 F42000
G1 X83.585 Y120.355 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
M73 P82 R2
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z5.4 F42000
G1 Z5
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
M73 P83 R2
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.222 Y112.902 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12000
M204 S4000
G3 X81.515 Y113.781 I.024 J1.354 E.04332
G3 X82.124 Y114.227 I-.38 J1.156 E.01994
G2 X83.231 Y115.24 I7.903 J-7.538 E.03903
G1 X83.231 Y119.118 E.10081
G1 X83.016 Y119.098 E.00564
G3 X81.954 Y118.366 I1.021 J-2.618 E.03381
G3 X81.616 Y118.386 I-.279 J-1.886 E.00882
G3 X80.494 Y119.841 I-1.427 J.06 E.05187
G3 X78.951 Y119.861 I-.888 J-8.851 E.04014
G3 X77.624 Y118.706 I.094 J-1.448 E.04913
G3 X75.991 Y119.108 I-1.312 J-1.807 E.04484
G1 X75.991 Y117.446 E.04321
; CHANGE_LAYER
; Z_HEIGHT: 5.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X75.991 Y119.108 E-.63181
G1 X76.326 Y119.14 E-.12786
G1 X76.327 Y119.14 E-.00033
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/38
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S107.1
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.4 I-.05 J1.216 P1  F42000
G1 X105.637 Y120.355 Z5.4
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.56 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.56
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.56 F4000
            G39.3 S1
            G0 Z5.56 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X108.67 Y112.842 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46937
G1 F9600
M204 S4000
G1 X110.295 Y112.831 E.04422
; WIPE_START
G1 X108.67 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.064 Y115.637 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F9600
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.49 Y113.194 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.26 E.0257
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.46 Y113.246 E.01043
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F9600
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469369
G1 F9600
M204 S4000
G1 X106.061 Y115.697 E.04422
; WIPE_START
G1 X106.072 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.595 Y118.155 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X106.265 Y117.756 E.01248
; LINE_WIDTH: 0.436931
G1 X106.168 Y117.539 E.00597
; LINE_WIDTH: 0.459197
G1 X106.072 Y117.323 E.0063
G1 X106.038 Y117.838 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y119.954 E.05104
G1 X108.291 Y119.954 E.05434
; LINE_WIDTH: 0.433056
G1 X108.579 Y119.941 E.00719
; LINE_WIDTH: 0.45047
G1 X108.867 Y119.928 E.0075
G1 X108.314 Y119.767 E.015
; LINE_WIDTH: 0.419996
G1 X107.838 Y119.397 E.01453
G1 X107.589 Y118.959 E.01216
G1 X107.526 Y118.467 E.01197
G1 X107.034 Y118.403 E.01197
G1 X106.647 Y118.184 E.01071
M204 S10000
G1 X106.424 Y118.503 F42000
G1 F9600
M204 S4000
G1 X106.424 Y119.569 E.0257
G1 X107.49 Y119.569 E.0257
G1 X107.209 Y119.045 E.01434
G1 X107.173 Y118.819 E.0055
G1 X106.853 Y118.744 E.00793
G1 X106.476 Y118.532 E.01043
M204 S10000
G1 X106.852 Y119.121 F42000
; LINE_WIDTH: 0.452456
G1 F9600
M204 S4000
G2 X106.844 Y119.212 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y119.212 E-.16808
G1 X106.773 Y119.167 E-.19731
G1 X106.8 Y119.121 E-.19731
G1 X106.852 Y119.121 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469373
G1 F9600
M204 S4000
G3 X108.927 Y119.931 I-.966 J-22.878 E.04423
; WIPE_START
G1 X110.553 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.184 Y117.726 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.435446
G1 F9600
M204 S4000
G1 X113.162 Y117.541 E.00469
; LINE_WIDTH: 0.455503
G1 X113.139 Y117.355 E.00492
G1 X112.958 Y117.756 E.01158
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.697 Y118.467 E.01197
G1 X111.633 Y118.959 E.01197
G1 X111.384 Y119.397 E.01216
G1 X110.986 Y119.728 E.01248
; LINE_WIDTH: 0.436936
G1 X110.769 Y119.824 E.00597
; LINE_WIDTH: 0.459209
G1 X110.553 Y119.92 E.0063
G1 X111.068 Y119.954 E.01371
; LINE_WIDTH: 0.419996
G1 X113.184 Y119.954 E.05104
G1 X113.184 Y117.786 E.05228
M204 S10000
G1 X112.799 Y118.503 F42000
G1 F9600
M204 S4000
G1 X112.274 Y118.784 E.01434
G1 X112.049 Y118.819 E.0055
G1 X111.974 Y119.139 E.00793
G1 X111.733 Y119.569 E.01188
G1 X112.799 Y119.569 E.0257
G1 X112.799 Y118.563 E.02426
M204 S10000
G1 X112.423 Y119.121 F42000
; LINE_WIDTH: 0.452496
G1 F9600
M204 S4000
G2 X112.415 Y119.212 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y119.212 E-.16812
G1 X112.344 Y119.167 E-.1973
G1 X112.37 Y119.121 E-.19732
G1 X112.423 Y119.121 E-.19726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.158 Y115.637 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466235
G1 F9600
M204 S4000
G1 X113.153 Y117.263 E.0439
; WIPE_START
G1 X113.158 Y115.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.355 Y112.834 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F9600
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.799 Y113.596 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X112.799 Y113.194 E.00969
G1 X111.733 Y113.194 E.0257
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.656 E.01456
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F9600
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.816 Y112.922 Z5.56 F42000
G1 X98.585 Y112.408 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.355 E.1754
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.525 Y112.408 E.205
; WIPE_START
G1 X98.585 Y113.606 E-.45611
G1 X98.585 Y114.406 E-.30389
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y111.591 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.171 E.18243
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.341 Y111.591 E.22957
M204 S10000
G1 X99 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X99 Y113.606 E.04196
G1 X99 Y120.771 E.1862
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X98.94 Y111.992 E.22661
; WIPE_START
G1 X99 Y113.606 E-.61392
G1 X99 Y113.991 E-.14608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y118.058 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
M73 P84 R2
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.935 Y114.705 E.01623
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.936 Y118.118 E.01467
; WIPE_START
G1 X92.311 Y118.041 E-.23964
G1 X91.876 Y117.846 E-.1809
G1 X91.599 Y117.515 E-.16397
G1 X91.5 Y117.223 E-.11734
G1 X91.487 Y117.07 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.471 Y117.241 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.531 Y117.241 E.02887
M204 S10000
G1 X95.872 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X95.271 Y112.831 E.04288
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.064 Y115.662 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459266
G1 F9600
M204 S4000
G1 X91.146 Y115.384 E.00771
; LINE_WIDTH: 0.421097
G1 X91.228 Y115.105 E.00702
G1 X91.601 Y114.628 E.01465
G1 X92.042 Y114.381 E.01223
G1 X92.55 Y114.32 E.01236
G1 X92.611 Y113.812 E.01236
G1 X92.858 Y113.371 E.01223
G1 X93.257 Y113.037 E.01258
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.05 Y115.342 E.00649
; LINE_WIDTH: 0.459266
G1 X91.062 Y115.602 E.00691
; WIPE_START
G1 X91.05 Y115.342 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.515 Y113.194 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.195 Y113.965 E.00819
G1 X92.269 Y113.634 E.00819
G1 X92.486 Y113.246 E.01071
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.072 Y117.298 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X91.061 Y115.722 E.04288
; WIPE_START
G1 X91.072 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.042 Y118.381 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X91.601 Y118.134 E.0122
G1 X91.267 Y117.735 E.01255
; LINE_WIDTH: 0.436941
G1 X91.17 Y117.516 E.00603
; LINE_WIDTH: 0.459218
G1 X91.072 Y117.298 E.00636
G1 X91.038 Y117.818 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y119.954 E.05151
G1 X93.312 Y119.954 E.05484
; LINE_WIDTH: 0.433081
G1 X93.602 Y119.941 E.00723
; LINE_WIDTH: 0.450528
G1 X93.892 Y119.928 E.00755
G1 X93.335 Y119.765 E.0151
; LINE_WIDTH: 0.419996
G1 X92.858 Y119.392 E.0146
G1 X92.611 Y118.95 E.0122
G1 X92.55 Y118.443 E.01233
G1 X92.102 Y118.388 E.01088
M204 S10000
G1 X91.864 Y118.723 F42000
G1 F9600
M204 S4000
G1 X91.424 Y118.477 E.01216
G1 X91.424 Y119.569 E.02632
G1 X92.515 Y119.569 E.02632
G1 X92.269 Y119.129 E.01216
G1 X92.195 Y118.797 E.00819
G1 X91.922 Y118.736 E.00674
M204 S10000
G1 X91.864 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X91.859 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y119.204 E-.17649
G1 X91.781 Y119.156 E-.1945
G1 X91.809 Y119.109 E-.19452
G1 X91.864 Y119.109 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.528 Y119.92 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.469499
G1 F9600
M204 S4000
G1 X93.952 Y119.931 E.04288
; WIPE_START
G1 X95.528 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.184 Y117.705 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.435431
G1 F9600
M204 S4000
G1 X98.161 Y117.518 E.00473
; LINE_WIDTH: 0.45547
G1 X98.139 Y117.331 E.00497
G1 X97.955 Y117.735 E.01169
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.673 Y118.443 E.01233
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
; LINE_WIDTH: 0.436941
G1 X95.746 Y119.823 E.00603
; LINE_WIDTH: 0.459218
G1 X95.528 Y119.92 E.00636
G1 X96.048 Y119.954 E.01385
; LINE_WIDTH: 0.419996
G1 X98.184 Y119.954 E.05151
G1 X98.184 Y117.765 E.05279
M204 S10000
G1 X97.799 Y118.477 F42000
G1 F9600
M204 S4000
G1 X97.358 Y118.723 E.01216
G1 X97.027 Y118.797 E.00819
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.537 E.02487
M204 S10000
G1 X97.413 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y119.204 E-.17646
G1 X97.331 Y119.156 E-.19451
G1 X97.359 Y119.109 E-.19453
G1 X97.413 Y119.109 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.158 Y115.662 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466245
G1 F9600
M204 S4000
G1 X98.153 Y117.238 E.04256
; WIPE_START
G1 X98.158 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.33 Y112.834 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459266
G1 F9600
M204 S4000
G1 X95.609 Y112.916 E.00771
; LINE_WIDTH: 0.421097
G1 X95.887 Y112.998 E.00702
G1 X96.364 Y113.371 E.01465
G1 X96.611 Y113.812 E.01223
G1 X96.673 Y114.32 E.01236
G1 X97.18 Y114.381 E.01236
G1 X97.621 Y114.628 E.01223
G1 X97.955 Y115.027 E.01258
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.65 Y112.82 E.00649
; LINE_WIDTH: 0.459266
G1 X95.39 Y112.832 E.00691
; WIPE_START
G1 X95.65 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.799 Y113.606 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X97.799 Y113.194 E.00995
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.027 Y113.965 E.00819
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.666 E.01493
M204 S10000
G1 X97.413 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F9600
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y113.654 E-.17646
G1 X97.331 Y113.606 E-.19451
G1 X97.359 Y113.559 E-.19453
G1 X97.413 Y113.559 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.807 Y112.926 Z5.56 F42000
G1 X83.585 Y112.408 Z5.56
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04156
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.16 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F9600
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
; WIPE_START
G1 X78.472 Y112.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.541 Y113.194 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
M204 S10000
G1 X76.876 Y113.567 F42000
; LINE_WIDTH: 0.494836
G1 F9600
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
; WIPE_START
M73 P85 R2
G1 X76.818 Y113.667 E-.18392
G1 X76.789 Y113.617 E-.19203
G1 X76.818 Y113.567 E-.19203
G1 X76.876 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.072 Y117.273 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X76.061 Y115.747 I17.533 J-.888 E.04156
; WIPE_START
G1 X76.072 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.916 Y119.928 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F9600
M204 S4000
G1 X78.636 Y119.845 E.00776
; LINE_WIDTH: 0.421098
G1 X78.356 Y119.763 E.00706
G1 X77.879 Y119.386 E.01472
G1 X77.633 Y118.942 E.01227
G3 X77.567 Y118.433 I2.152 J-.54 E.01242
G1 X77.051 Y118.359 E.01261
G1 X76.607 Y118.114 E.01227
G1 X76.269 Y117.714 E.01265
; LINE_WIDTH: 0.436936
G1 X76.171 Y117.493 E.00608
; LINE_WIDTH: 0.459204
G1 X76.072 Y117.273 E.00642
G1 X76.038 Y117.799 E.01399
; LINE_WIDTH: 0.419996
G1 X76.038 Y119.954 E.05198
G1 X78.333 Y119.954 E.05535
; LINE_WIDTH: 0.433101
G1 X78.595 Y119.943 E.00653
; LINE_WIDTH: 0.459311
G1 X78.857 Y119.931 E.00696
; WIPE_START
G1 X78.595 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.29 Y119.118 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X77.199 Y118.781 E.00841
G1 X76.875 Y118.702 E.00806
G1 X76.424 Y118.452 E.01243
G1 X76.424 Y119.569 E.02693
G1 X77.541 Y119.569 E.02693
G1 X77.32 Y119.17 E.01099
M204 S10000
G1 X76.876 Y119.096 F42000
; LINE_WIDTH: 0.494836
G1 F9600
M204 S4000
G2 X76.873 Y119.195 I-.029 J.049 E.00681
; WIPE_START
G1 X76.818 Y119.195 E-.18392
G1 X76.789 Y119.146 E-.19203
G1 X76.818 Y119.096 E-.19203
G1 X76.876 Y119.096 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.503 Y119.92 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.46959
G1 F9600
M204 S4000
G3 X78.976 Y119.931 I-.888 J-17.533 E.04156
; WIPE_START
G1 X80.503 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.171 Y118.359 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G3 X81.663 Y118.426 I-.54 J-2.152 E.01239
G1 X81.589 Y118.942 E.01257
G1 X81.344 Y119.386 E.01224
G1 X80.944 Y119.723 E.01261
; LINE_WIDTH: 0.436936
G1 X80.723 Y119.822 E.00608
; LINE_WIDTH: 0.459204
G1 X80.503 Y119.92 E.00642
G1 X81.028 Y119.954 E.01399
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.05198
G1 X83.184 Y117.685 E.05473
; LINE_WIDTH: 0.435411
G1 X83.161 Y117.495 E.00478
; LINE_WIDTH: 0.455425
G1 X83.139 Y117.306 E.00502
G1 X82.953 Y117.714 E.01181
; LINE_WIDTH: 0.419996
G1 X82.616 Y118.114 E.01261
G1 X82.224 Y118.33 E.01079
; WIPE_START
G1 X82.616 Y118.114 E-.35045
G1 X82.953 Y117.714 E-.40955
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.682 Y119.569 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.452 E.02693
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.711 Y119.516 E.01099
M204 S10000
G1 X82.404 Y119.096 F42000
; LINE_WIDTH: 0.494856
G1 F9600
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y119.195 E-.18392
G1 X82.318 Y119.146 E-.19203
G1 X82.347 Y119.096 E-.19203
G1 X82.404 Y119.096 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.466276
G1 F9600
M204 S4000
G1 X83.153 Y117.213 E.04123
; WIPE_START
G1 X83.158 Y115.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.171 Y114.404 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F9600
M204 S4000
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.055 Y115.368 E.00836
; LINE_WIDTH: 0.450997
G1 X83.158 Y115.687 E.00873
G1 X83.184 Y115.103 E.01521
; LINE_WIDTH: 0.419996
G1 X83.184 Y112.808 E.05535
G1 X80.889 Y112.808 E.05535
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.112 Y114.395 E.01112
; WIPE_START
G1 X81.655 Y114.329 E-.17528
G1 X81.589 Y113.821 E-.19479
G1 X81.344 Y113.377 E-.19285
G1 X80.937 Y113.055 E-.19707
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y113.617 Z5.56 F42000
G1 Z5.16
G1 E.8 F1800
G1 F9600
M204 S4000
G1 X82.798 Y113.194 E.0102
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.798 Y114.311 E.01243
G1 X82.798 Y113.677 E.01528
M204 S10000
G1 X82.404 Y113.567 F42000
; LINE_WIDTH: 0.494856
G1 F9600
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 5.32
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F9600
G1 X82.347 Y113.667 E-.18392
G1 X82.318 Y113.617 E-.19203
G1 X82.347 Y113.567 E-.19203
G1 X82.404 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/38
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S109.65
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.56 I-.341 J1.168 P1  F42000
G1 X105.637 Y120.355 Z5.56
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y117.266 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.496 E.02971
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.556 Y117.266 E.02827
M204 S10000
G1 X110.897 Y117.667 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.72 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.72
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.72 F4000
            G39.3 S1
            G0 Z5.72 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X106.852 Y119.121 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X106.424 Y118.503 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.424 Y119.569 E.0257
G1 X107.49 Y119.569 E.0257
G1 X107.209 Y119.045 E.01434
G1 X107.173 Y118.819 E.0055
G1 X106.853 Y118.744 E.00793
G1 X106.476 Y118.532 E.01043
; WIPE_START
G1 X106.853 Y118.744 E-.16438
G1 X107.173 Y118.819 E-.12492
G1 X107.209 Y119.045 E-.08671
G1 X107.49 Y119.569 E-.22599
G1 X107.074 Y119.569 E-.15801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467702
G1 F12000
M204 S4000
G1 X106.061 Y115.697 E.04405
; WIPE_START
G1 X106.072 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.32 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470801
G1 F12000
M204 S4000
G1 X106.055 Y117.58 E.00704
; LINE_WIDTH: 0.42094
G1 X106.038 Y117.838 E.00624
G1 X106.038 Y119.954 E.05117
G1 X108.291 Y119.954 E.05447
; LINE_WIDTH: 0.433056
G1 X108.579 Y119.941 E.00719
; LINE_WIDTH: 0.45047
G1 X108.867 Y119.928 E.0075
G1 X108.314 Y119.767 E.015
; LINE_WIDTH: 0.419996
G1 X107.838 Y119.397 E.01453
G1 X107.589 Y118.959 E.01216
G1 X107.526 Y118.467 E.01197
G1 X107.034 Y118.403 E.01197
G1 X106.595 Y118.155 E.01216
G1 X106.265 Y117.756 E.01248
; LINE_WIDTH: 0.436931
G1 X106.181 Y117.567 E.00521
; LINE_WIDTH: 0.470801
G1 X106.096 Y117.378 E.00565
; WIPE_START
G1 X106.181 Y117.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.064 Y115.637 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.424 Y114.26 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.49 Y113.194 E.01188
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.2 E.02425
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.67 Y112.842 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X110.295 Y112.831 E.04405
M204 S10000
G1 X110.355 Y112.834 F42000
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.733 Y113.194 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.194 E.0257
G1 X111.793 Y113.194 E.02426
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.158 Y115.637 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X113.153 Y117.263 E.04402
; WIPE_START
G1 X113.158 Y115.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.423 Y119.121 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X112.415 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X111.733 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.799 Y119.569 E.0257
G1 X112.799 Y118.503 E.0257
G1 X112.274 Y118.784 E.01434
G1 X112.049 Y118.819 E.0055
G1 X111.974 Y119.139 E.00793
G1 X111.762 Y119.516 E.01043
; WIPE_START
G1 X111.974 Y119.139 E-.16439
G1 X112.049 Y118.819 E-.12492
G1 X112.274 Y118.784 E-.0867
G1 X112.799 Y118.503 E-.226
M73 P86 R2
G1 X112.799 Y118.919 E-.15799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X108.927 Y119.931 E.04405
; WIPE_START
G1 X110.553 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.32 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X110.81 Y119.937 E.00704
; LINE_WIDTH: 0.420946
G1 X111.068 Y119.954 E.00624
G1 X113.184 Y119.954 E.05117
G1 X113.184 Y117.726 E.05386
; LINE_WIDTH: 0.435446
G1 X113.162 Y117.541 E.00469
; LINE_WIDTH: 0.455503
G1 X113.139 Y117.355 E.00492
G1 X112.958 Y117.756 E.01158
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.697 Y118.467 E.01197
G1 X111.633 Y118.959 E.01197
G1 X111.384 Y119.397 E.01216
G1 X110.986 Y119.728 E.01248
; LINE_WIDTH: 0.436936
G1 X110.797 Y119.812 E.00521
; LINE_WIDTH: 0.470816
G1 X110.608 Y119.896 E.00565
; WIPE_START
G1 X110.797 Y119.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.172 Y120.151 Z5.72 F42000
G1 X98.585 Y120.355 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.471 Y117.241 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.531 Y117.241 E.02887
M204 S10000
G1 X95.872 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.072 Y117.298 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X91.061 Y115.722 E.04272
; WIPE_START
G1 X91.072 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y118.443 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.042 Y118.381 E.01233
G1 X91.601 Y118.134 E.0122
G1 X91.267 Y117.735 E.01255
; LINE_WIDTH: 0.436941
G1 X91.17 Y117.516 E.00603
; LINE_WIDTH: 0.459218
G1 X91.072 Y117.298 E.00636
G1 X91.038 Y117.818 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y119.954 E.05151
G1 X93.312 Y119.954 E.05484
; LINE_WIDTH: 0.433081
G1 X93.602 Y119.941 E.00723
; LINE_WIDTH: 0.450528
G1 X93.892 Y119.928 E.00755
G1 X93.335 Y119.765 E.0151
; LINE_WIDTH: 0.419996
G1 X92.858 Y119.392 E.0146
G1 X92.611 Y118.95 E.0122
G1 X92.557 Y118.502 E.01088
M204 S10000
G1 X92.195 Y118.797 F42000
G1 F12000
M204 S4000
G1 X91.864 Y118.723 E.00819
G1 X91.424 Y118.477 E.01216
G1 X91.424 Y119.569 E.02632
G1 X92.515 Y119.569 E.02632
G1 X92.269 Y119.129 E.01216
G1 X92.208 Y118.856 E.00674
M204 S10000
G1 X91.864 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y119.204 E-.17649
G1 X91.781 Y119.156 E-.1945
G1 X91.809 Y119.109 E-.19452
G1 X91.864 Y119.109 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.528 Y119.92 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X93.952 Y119.931 E.04272
; WIPE_START
G1 X95.528 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y118.443 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
; LINE_WIDTH: 0.436941
G1 X95.746 Y119.823 E.00603
; LINE_WIDTH: 0.459218
G1 X95.528 Y119.92 E.00636
G1 X96.048 Y119.954 E.01385
; LINE_WIDTH: 0.419996
G1 X98.184 Y119.954 E.05151
G1 X98.184 Y117.705 E.05423
; LINE_WIDTH: 0.435431
G1 X98.161 Y117.518 E.00473
; LINE_WIDTH: 0.45547
G1 X98.139 Y117.331 E.00497
G1 X97.955 Y117.735 E.01169
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.732 Y118.435 E.01088
M204 S10000
G1 X97.027 Y118.797 F42000
G1 F12000
M204 S4000
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.477 E.02632
G1 X97.358 Y118.723 E.01216
G1 X97.086 Y118.784 E.00674
M204 S10000
G1 X97.413 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y119.204 E-.17646
G1 X97.331 Y119.156 E-.19451
G1 X97.359 Y119.109 E-.19453
G1 X97.413 Y119.109 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.158 Y115.662 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X98.153 Y117.238 E.04268
; WIPE_START
G1 X98.158 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y114.32 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X97.18 Y114.381 E.01233
G1 X97.621 Y114.628 E.0122
G1 X97.955 Y115.027 E.01255
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.62 Y112.821 E.00723
; LINE_WIDTH: 0.45054
G1 X95.33 Y112.834 E.00755
G1 X95.887 Y112.998 E.0151
; LINE_WIDTH: 0.419996
G1 X96.364 Y113.371 E.0146
G1 X96.611 Y113.812 E.0122
G1 X96.665 Y114.26 E.01088
M204 S10000
G1 X97.027 Y113.965 F42000
G1 F12000
M204 S4000
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.194 E.02632
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.014 Y113.907 E.00674
M204 S10000
G1 X97.413 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y113.654 E-.17646
G1 X97.331 Y113.606 E-.19451
G1 X97.359 Y113.559 E-.19453
G1 X97.413 Y113.559 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X95.271 Y112.831 E.04272
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y114.32 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.611 Y113.812 E.01233
G1 X92.858 Y113.371 E.0122
G1 X93.257 Y113.037 E.01255
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.051 Y115.372 E.00723
; LINE_WIDTH: 0.45054
G1 X91.064 Y115.662 E.00755
G1 X91.228 Y115.105 E.0151
; LINE_WIDTH: 0.419996
G1 X91.601 Y114.628 E.0146
G1 X92.042 Y114.381 E.0122
G1 X92.49 Y114.327 E.01088
M204 S10000
G1 X92.195 Y113.965 F42000
G1 F12000
M204 S4000
G1 X92.269 Y113.634 E.00819
G1 X92.515 Y113.194 E.01216
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.137 Y113.979 E.00674
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.304 Y112.508 Z5.72 F42000
G1 X83.585 Y112.408 Z5.72
G1 Z5.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
M204 S10000
G1 X78.375 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.847 Y117.617 E.02564
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.376 Y117.677 E.02408
; WIPE_START
G1 X77.494 Y117.617 E-.33596
G1 X77.321 Y117.591 E-.06651
G1 X77.133 Y117.495 E-.08023
G1 X76.969 Y117.3 E-.09693
G1 X76.9 Y117.023 E-.10809
G1 X76.9 Y116.833 E-.07228
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.072 Y117.273 Z5.72 F42000
G1 Z5.32
M73 P87 R2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X76.061 Y115.747 I17.533 J-.888 E.04139
; WIPE_START
G1 X76.072 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.876 Y119.096 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X77.541 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X77.29 Y119.118 E.01243
G1 X77.199 Y118.781 E.00841
G1 X76.875 Y118.702 E.00806
G1 X76.424 Y118.452 E.01243
G1 X76.424 Y119.569 E.02693
G1 X77.481 Y119.569 E.02549
; WIPE_START
G1 X76.424 Y119.569 E-.40161
G1 X76.424 Y118.625 E-.35839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.916 Y119.928 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F12000
M204 S4000
G1 X78.636 Y119.845 E.00776
; LINE_WIDTH: 0.421098
G1 X78.356 Y119.763 E.00706
G1 X77.879 Y119.386 E.01472
G1 X77.633 Y118.942 E.01227
G3 X77.567 Y118.433 I2.152 J-.54 E.01242
G1 X77.051 Y118.359 E.01261
G1 X76.607 Y118.114 E.01227
G1 X76.269 Y117.714 E.01265
; LINE_WIDTH: 0.436936
G1 X76.171 Y117.493 E.00608
; LINE_WIDTH: 0.459204
G1 X76.072 Y117.273 E.00642
G1 X76.038 Y117.799 E.01399
; LINE_WIDTH: 0.419996
G1 X76.038 Y119.954 E.05198
G1 X78.333 Y119.954 E.05535
; LINE_WIDTH: 0.433101
G1 X78.595 Y119.943 E.00653
; LINE_WIDTH: 0.459311
G1 X78.857 Y119.931 E.00696
; WIPE_START
G1 X78.595 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.503 Y119.92 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X78.976 Y119.931 I-.888 J-17.533 E.04139
; WIPE_START
G1 X80.503 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.404 Y119.096 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X82.798 Y118.452 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.682 Y119.569 E.01243
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.512 E.02549
M204 S10000
G1 X83.184 Y117.685 F42000
; LINE_WIDTH: 0.435411
G1 F12000
M204 S4000
G1 X83.161 Y117.495 E.00478
; LINE_WIDTH: 0.455425
G1 X83.139 Y117.306 E.00502
G1 X82.953 Y117.714 E.01181
; LINE_WIDTH: 0.419996
G1 X82.616 Y118.114 E.01261
G1 X82.171 Y118.359 E.01224
G3 X81.663 Y118.426 I-.54 J-2.152 E.01239
G1 X81.589 Y118.942 E.01257
G1 X81.344 Y119.386 E.01224
G1 X80.944 Y119.723 E.01261
; LINE_WIDTH: 0.436936
G1 X80.723 Y119.822 E.00608
; LINE_WIDTH: 0.459204
G1 X80.503 Y119.92 E.00642
G1 X81.028 Y119.954 E.01399
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.05198
G1 X83.184 Y117.745 E.05329
; WIPE_START
G1 X83.184 Y119.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467512
G1 F12000
M204 S4000
G1 X83.153 Y117.213 E.04134
; WIPE_START
G1 X83.158 Y115.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.32 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.459326
G1 F12000
M204 S4000
G1 X83.171 Y115.395 E.00776
; LINE_WIDTH: 0.42078
G1 X83.184 Y112.808 E.06251
G1 X80.889 Y112.808 E.05546
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.171 Y114.404 E.01257
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.046 Y115.339 E.00761
; LINE_WIDTH: 0.459326
G1 X83.14 Y115.629 E.00811
; WIPE_START
G1 X83.046 Y115.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y114.311 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.798 Y113.194 E.02693
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.746 Y114.282 E.01099
M204 S10000
G1 X82.404 Y113.567 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y113.667 E-.18392
G1 X82.318 Y113.617 E-.19203
G1 X82.347 Y113.567 E-.19203
G1 X82.404 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04139
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.32 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
; WIPE_START
G1 X78.472 Y112.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.541 Y113.194 Z5.72 F42000
G1 Z5.32
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
M204 S10000
G1 X76.876 Y113.567 F42000
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.818 Y113.667 E-.18392
G1 X76.789 Y113.617 E-.19203
G1 X76.818 Y113.567 E-.19203
G1 X76.876 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/38
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.72 I-.28 J1.184 P1  F42000
G1 X105.637 Y120.355 Z5.72
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
; WIPE_START
M204 S4000
G1 X111.728 Y115.496 E-.46878
G1 X111.847 Y115.537 E-.0478
G1 X111.921 Y115.689 E-.06416
G1 X111.921 Y116.161 E-.17926
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.897 Y117.667 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.897 Y115.096 E.02449
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.957 Y117.666 E.02293
; WIPE_START
G1 X110.897 Y118.498 E-.31705
G1 X110.869 Y118.679 E-.06942
G1 X110.771 Y118.864 E-.07974
G1 X110.576 Y119.025 E-.09594
G1 X110.303 Y119.092 E-.10671
G1 X110.063 Y119.092 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.88 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.88
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.88 F4000
            G39.3 S1
            G0 Z5.88 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X106.852 Y119.121 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X106.424 Y118.503 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.424 Y119.569 E.0257
G1 X107.49 Y119.569 E.0257
G1 X107.209 Y119.045 E.01434
G1 X107.173 Y118.819 E.0055
G1 X106.853 Y118.744 E.00793
G1 X106.476 Y118.532 E.01043
; WIPE_START
G1 X106.853 Y118.744 E-.16438
G1 X107.173 Y118.819 E-.12492
G1 X107.209 Y119.045 E-.08671
G1 X107.49 Y119.569 E-.22599
G1 X107.074 Y119.569 E-.15801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467702
G1 F12000
M204 S4000
G1 X106.061 Y115.697 E.04405
; WIPE_START
G1 X106.072 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.48 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470801
G1 F12000
M204 S4000
G1 X106.055 Y117.58 E.00704
; LINE_WIDTH: 0.42094
G1 X106.038 Y117.838 E.00624
G1 X106.038 Y119.954 E.05117
G1 X108.291 Y119.954 E.05447
; LINE_WIDTH: 0.433056
G1 X108.579 Y119.941 E.00719
; LINE_WIDTH: 0.45047
G1 X108.867 Y119.928 E.0075
G1 X108.314 Y119.767 E.015
; LINE_WIDTH: 0.419996
G1 X107.838 Y119.397 E.01453
G1 X107.589 Y118.959 E.01216
G1 X107.526 Y118.467 E.01197
G1 X107.034 Y118.403 E.01197
G1 X106.595 Y118.155 E.01216
G1 X106.265 Y117.756 E.01248
; LINE_WIDTH: 0.436931
G1 X106.181 Y117.567 E.00521
; LINE_WIDTH: 0.470801
G1 X106.096 Y117.378 E.00565
; WIPE_START
G1 X106.181 Y117.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.064 Y115.637 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.424 Y114.26 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.49 Y113.194 E.01188
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.2 E.02425
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.67 Y112.842 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X110.295 Y112.831 E.04405
M204 S10000
G1 X110.355 Y112.834 F42000
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.733 Y113.194 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
M73 P88 R2
G1 F12000
M204 S4000
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.194 E.0257
G1 X111.793 Y113.194 E.02426
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.158 Y115.637 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X113.153 Y117.263 E.04402
; WIPE_START
G1 X113.158 Y115.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.423 Y119.121 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X112.415 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X111.733 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.799 Y119.569 E.0257
G1 X112.799 Y118.503 E.0257
G1 X112.274 Y118.784 E.01434
G1 X112.049 Y118.819 E.0055
G1 X111.974 Y119.139 E.00793
G1 X111.762 Y119.516 E.01043
; WIPE_START
G1 X111.974 Y119.139 E-.16439
G1 X112.049 Y118.819 E-.12492
G1 X112.274 Y118.784 E-.0867
G1 X112.799 Y118.503 E-.226
G1 X112.799 Y118.919 E-.15799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X108.927 Y119.931 E.04405
; WIPE_START
G1 X110.553 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.48 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X110.81 Y119.937 E.00704
; LINE_WIDTH: 0.420946
G1 X111.068 Y119.954 E.00624
G1 X113.184 Y119.954 E.05117
G1 X113.184 Y117.726 E.05386
; LINE_WIDTH: 0.435446
G1 X113.162 Y117.541 E.00469
; LINE_WIDTH: 0.455503
G1 X113.139 Y117.355 E.00492
G1 X112.958 Y117.756 E.01158
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.697 Y118.467 E.01197
G1 X111.633 Y118.959 E.01197
G1 X111.384 Y119.397 E.01216
G1 X110.986 Y119.728 E.01248
; LINE_WIDTH: 0.436936
G1 X110.797 Y119.812 E.00521
; LINE_WIDTH: 0.470816
G1 X110.608 Y119.896 E.00565
; WIPE_START
G1 X110.797 Y119.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.172 Y120.151 Z5.88 F42000
G1 X98.585 Y120.355 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.471 Y117.241 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.751 Y115.521 E.03032
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.531 Y117.241 E.02887
M204 S10000
G1 X95.872 Y117.642 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.072 Y117.298 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X91.061 Y115.722 E.04272
; WIPE_START
G1 X91.072 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y118.443 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.042 Y118.381 E.01233
G1 X91.601 Y118.134 E.0122
G1 X91.267 Y117.735 E.01255
; LINE_WIDTH: 0.436941
G1 X91.17 Y117.516 E.00603
; LINE_WIDTH: 0.459218
G1 X91.072 Y117.298 E.00636
G1 X91.038 Y117.818 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y119.954 E.05151
G1 X93.312 Y119.954 E.05484
; LINE_WIDTH: 0.433081
G1 X93.602 Y119.941 E.00723
; LINE_WIDTH: 0.450528
G1 X93.892 Y119.928 E.00755
G1 X93.335 Y119.765 E.0151
; LINE_WIDTH: 0.419996
G1 X92.858 Y119.392 E.0146
G1 X92.611 Y118.95 E.0122
G1 X92.557 Y118.502 E.01088
M204 S10000
G1 X92.195 Y118.797 F42000
G1 F12000
M204 S4000
G1 X91.864 Y118.723 E.00819
G1 X91.424 Y118.477 E.01216
M73 P88 R1
G1 X91.424 Y119.569 E.02632
G1 X92.515 Y119.569 E.02632
G1 X92.269 Y119.129 E.01216
G1 X92.208 Y118.856 E.00674
M204 S10000
G1 X91.864 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y119.204 E-.17649
G1 X91.781 Y119.156 E-.1945
G1 X91.809 Y119.109 E-.19452
G1 X91.864 Y119.109 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.528 Y119.92 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X93.952 Y119.931 E.04272
; WIPE_START
G1 X95.528 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y118.443 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
; LINE_WIDTH: 0.436941
G1 X95.746 Y119.823 E.00603
; LINE_WIDTH: 0.459218
G1 X95.528 Y119.92 E.00636
G1 X96.048 Y119.954 E.01385
; LINE_WIDTH: 0.419996
G1 X98.184 Y119.954 E.05151
G1 X98.184 Y117.705 E.05423
; LINE_WIDTH: 0.435431
G1 X98.161 Y117.518 E.00473
; LINE_WIDTH: 0.45547
G1 X98.139 Y117.331 E.00497
G1 X97.955 Y117.735 E.01169
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.732 Y118.435 E.01088
M204 S10000
G1 X97.027 Y118.797 F42000
G1 F12000
M204 S4000
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.477 E.02632
G1 X97.358 Y118.723 E.01216
G1 X97.086 Y118.784 E.00674
M204 S10000
G1 X97.413 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y119.204 E-.17646
G1 X97.331 Y119.156 E-.19451
G1 X97.359 Y119.109 E-.19453
G1 X97.413 Y119.109 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.158 Y115.662 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X98.153 Y117.238 E.04268
; WIPE_START
G1 X98.158 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y114.32 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X97.18 Y114.381 E.01233
G1 X97.621 Y114.628 E.0122
G1 X97.955 Y115.027 E.01255
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.62 Y112.821 E.00723
; LINE_WIDTH: 0.45054
G1 X95.33 Y112.834 E.00755
G1 X95.887 Y112.998 E.0151
; LINE_WIDTH: 0.419996
G1 X96.364 Y113.371 E.0146
G1 X96.611 Y113.812 E.0122
G1 X96.665 Y114.26 E.01088
M204 S10000
G1 X97.027 Y113.965 F42000
G1 F12000
M204 S4000
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.194 E.02632
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.014 Y113.907 E.00674
M204 S10000
G1 X97.413 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y113.654 E-.17646
G1 X97.331 Y113.606 E-.19451
G1 X97.359 Y113.559 E-.19453
G1 X97.413 Y113.559 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X95.271 Y112.831 E.04272
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y114.32 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.611 Y113.812 E.01233
G1 X92.858 Y113.371 E.0122
G1 X93.257 Y113.037 E.01255
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.051 Y115.372 E.00723
; LINE_WIDTH: 0.45054
G1 X91.064 Y115.662 E.00755
G1 X91.228 Y115.105 E.0151
; LINE_WIDTH: 0.419996
G1 X91.601 Y114.628 E.0146
G1 X92.042 Y114.381 E.0122
G1 X92.49 Y114.327 E.01088
M204 S10000
G1 X92.195 Y113.965 F42000
G1 F12000
M204 S4000
G1 X92.269 Y113.634 E.00819
G1 X92.515 Y113.194 E.01216
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.137 Y113.979 E.00674
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.304 Y112.508 Z5.88 F42000
G1 X83.585 Y112.408 Z5.88
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y117.216 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.276 E.02947
; WIPE_START
M204 S4000
G1 X77.494 Y117.216 E-.48776
G1 X77.377 Y117.177 E-.04705
G1 X77.301 Y117.023 E-.06488
G1 X77.301 Y116.602 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z5.88 F42000
M73 P89 R1
G1 Z5.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.072 Y117.273 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X76.061 Y115.747 I17.533 J-.888 E.04139
; WIPE_START
G1 X76.072 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.876 Y119.096 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X77.541 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X77.29 Y119.118 E.01243
G1 X77.199 Y118.781 E.00841
G1 X76.875 Y118.702 E.00806
G1 X76.424 Y118.452 E.01243
G1 X76.424 Y119.569 E.02693
G1 X77.481 Y119.569 E.02549
; WIPE_START
G1 X76.424 Y119.569 E-.40161
G1 X76.424 Y118.625 E-.35839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.916 Y119.928 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F12000
M204 S4000
G1 X78.636 Y119.845 E.00776
; LINE_WIDTH: 0.421098
G1 X78.356 Y119.763 E.00706
G1 X77.879 Y119.386 E.01472
G1 X77.633 Y118.942 E.01227
G3 X77.567 Y118.433 I2.152 J-.54 E.01242
G1 X77.051 Y118.359 E.01261
G1 X76.607 Y118.114 E.01227
G1 X76.269 Y117.714 E.01265
; LINE_WIDTH: 0.436936
G1 X76.171 Y117.493 E.00608
; LINE_WIDTH: 0.459204
G1 X76.072 Y117.273 E.00642
G1 X76.038 Y117.799 E.01399
; LINE_WIDTH: 0.419996
G1 X76.038 Y119.954 E.05198
G1 X78.333 Y119.954 E.05535
; LINE_WIDTH: 0.433101
G1 X78.595 Y119.943 E.00653
; LINE_WIDTH: 0.459311
G1 X78.857 Y119.931 E.00696
; WIPE_START
G1 X78.595 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.503 Y119.92 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X78.976 Y119.931 I-.888 J-17.533 E.04139
; WIPE_START
G1 X80.503 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.404 Y119.096 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X82.798 Y118.452 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.682 Y119.569 E.01243
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.512 E.02549
M204 S10000
G1 X83.184 Y117.685 F42000
; LINE_WIDTH: 0.435411
G1 F12000
M204 S4000
G1 X83.161 Y117.495 E.00478
; LINE_WIDTH: 0.455425
G1 X83.139 Y117.306 E.00502
G1 X82.953 Y117.714 E.01181
; LINE_WIDTH: 0.419996
G1 X82.616 Y118.114 E.01261
G1 X82.171 Y118.359 E.01224
G3 X81.663 Y118.426 I-.54 J-2.152 E.01239
G1 X81.589 Y118.942 E.01257
G1 X81.344 Y119.386 E.01224
G1 X80.944 Y119.723 E.01261
; LINE_WIDTH: 0.436936
G1 X80.723 Y119.822 E.00608
; LINE_WIDTH: 0.459204
G1 X80.503 Y119.92 E.00642
G1 X81.028 Y119.954 E.01399
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.05198
G1 X83.184 Y117.745 E.05329
; WIPE_START
G1 X83.184 Y119.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467512
G1 F12000
M204 S4000
G1 X83.153 Y117.213 E.04134
; WIPE_START
G1 X83.158 Y115.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.48 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.459326
G1 F12000
M204 S4000
G1 X83.171 Y115.395 E.00776
; LINE_WIDTH: 0.42078
G1 X83.184 Y112.808 E.06251
G1 X80.889 Y112.808 E.05546
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.171 Y114.404 E.01257
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.046 Y115.339 E.00761
; LINE_WIDTH: 0.459326
G1 X83.14 Y115.629 E.00811
; WIPE_START
G1 X83.046 Y115.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y114.311 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.798 Y113.194 E.02693
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.746 Y114.282 E.01099
M204 S10000
G1 X82.404 Y113.567 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y113.667 E-.18392
G1 X82.318 Y113.617 E-.19203
G1 X82.347 Y113.567 E-.19203
G1 X82.404 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04139
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.48 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
; WIPE_START
G1 X78.472 Y112.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.541 Y113.194 Z5.88 F42000
G1 Z5.48
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
M204 S10000
G1 X76.876 Y113.567 F42000
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 5.64
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.818 Y113.667 E-.18392
G1 X76.789 Y113.617 E-.19203
G1 X76.818 Y113.567 E-.19203
G1 X76.876 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/38
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z5.88 I-.28 J1.184 P1  F42000
G1 X105.637 Y120.355 Z5.88
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
M204 S10000
G1 X110.897 Y115.096 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.04 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.04
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.04 F4000
            G39.3 S1
            G0 Z6.04 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X106.852 Y119.121 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X106.424 Y118.503 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.424 Y119.569 E.0257
G1 X107.49 Y119.569 E.0257
G1 X107.209 Y119.045 E.01434
G1 X107.173 Y118.819 E.0055
G1 X106.853 Y118.744 E.00793
G1 X106.476 Y118.532 E.01043
; WIPE_START
G1 X106.853 Y118.744 E-.16438
G1 X107.173 Y118.819 E-.12492
G1 X107.209 Y119.045 E-.08671
G1 X107.49 Y119.569 E-.22599
G1 X107.074 Y119.569 E-.15801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467702
G1 F12000
M204 S4000
G1 X106.061 Y115.697 E.04405
; WIPE_START
G1 X106.072 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.64 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470801
G1 F12000
M204 S4000
G1 X106.055 Y117.58 E.00704
; LINE_WIDTH: 0.42094
G1 X106.038 Y117.838 E.00624
G1 X106.038 Y119.954 E.05117
G1 X108.291 Y119.954 E.05447
; LINE_WIDTH: 0.433056
G1 X108.579 Y119.941 E.00719
; LINE_WIDTH: 0.45047
G1 X108.867 Y119.928 E.0075
G1 X108.314 Y119.767 E.015
; LINE_WIDTH: 0.419996
G1 X107.838 Y119.397 E.01453
G1 X107.589 Y118.959 E.01216
G1 X107.526 Y118.467 E.01197
G1 X107.034 Y118.403 E.01197
G1 X106.595 Y118.155 E.01216
G1 X106.265 Y117.756 E.01248
; LINE_WIDTH: 0.436931
G1 X106.181 Y117.567 E.00521
; LINE_WIDTH: 0.470801
G1 X106.096 Y117.378 E.00565
; WIPE_START
G1 X106.181 Y117.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.064 Y115.637 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.424 Y114.26 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.49 Y113.194 E.01188
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.2 E.02425
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.67 Y112.842 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X110.295 Y112.831 E.04405
M204 S10000
M73 P90 R1
G1 X110.355 Y112.834 F42000
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.733 Y113.194 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.194 E.0257
G1 X111.793 Y113.194 E.02426
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.158 Y115.637 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X113.153 Y117.263 E.04402
; WIPE_START
G1 X113.158 Y115.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.423 Y119.121 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X112.415 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X111.733 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.799 Y119.569 E.0257
G1 X112.799 Y118.503 E.0257
G1 X112.274 Y118.784 E.01434
G1 X112.049 Y118.819 E.0055
G1 X111.974 Y119.139 E.00793
G1 X111.762 Y119.516 E.01043
; WIPE_START
G1 X111.974 Y119.139 E-.16439
G1 X112.049 Y118.819 E-.12492
G1 X112.274 Y118.784 E-.0867
G1 X112.799 Y118.503 E-.226
G1 X112.799 Y118.919 E-.15799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X108.927 Y119.931 E.04405
; WIPE_START
G1 X110.553 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.64 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X110.81 Y119.937 E.00704
; LINE_WIDTH: 0.420946
G1 X111.068 Y119.954 E.00624
G1 X113.184 Y119.954 E.05117
G1 X113.184 Y117.726 E.05386
; LINE_WIDTH: 0.435446
G1 X113.162 Y117.541 E.00469
; LINE_WIDTH: 0.455503
G1 X113.139 Y117.355 E.00492
G1 X112.958 Y117.756 E.01158
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.697 Y118.467 E.01197
G1 X111.633 Y118.959 E.01197
G1 X111.384 Y119.397 E.01216
G1 X110.986 Y119.728 E.01248
; LINE_WIDTH: 0.436936
G1 X110.797 Y119.812 E.00521
; LINE_WIDTH: 0.470816
G1 X110.608 Y119.896 E.00565
; WIPE_START
G1 X110.797 Y119.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.172 Y120.151 Z6.04 F42000
G1 X98.585 Y120.355 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
; WIPE_START
M204 S4000
G1 X93.751 Y114.264 E-.47827
G1 X93.792 Y114.146 E-.04742
G1 X93.944 Y114.071 E-.06452
G1 X94.391 Y114.071 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.072 Y117.298 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X91.061 Y115.722 E.04272
; WIPE_START
G1 X91.072 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y118.443 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.042 Y118.381 E.01233
G1 X91.601 Y118.134 E.0122
G1 X91.267 Y117.735 E.01255
; LINE_WIDTH: 0.436941
G1 X91.17 Y117.516 E.00603
; LINE_WIDTH: 0.459218
G1 X91.072 Y117.298 E.00636
G1 X91.038 Y117.818 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y119.954 E.05151
G1 X93.312 Y119.954 E.05484
; LINE_WIDTH: 0.433081
G1 X93.602 Y119.941 E.00723
; LINE_WIDTH: 0.450528
G1 X93.892 Y119.928 E.00755
G1 X93.335 Y119.765 E.0151
; LINE_WIDTH: 0.419996
G1 X92.858 Y119.392 E.0146
G1 X92.611 Y118.95 E.0122
G1 X92.557 Y118.502 E.01088
M204 S10000
G1 X92.195 Y118.797 F42000
G1 F12000
M204 S4000
G1 X91.864 Y118.723 E.00819
G1 X91.424 Y118.477 E.01216
G1 X91.424 Y119.569 E.02632
G1 X92.515 Y119.569 E.02632
G1 X92.269 Y119.129 E.01216
G1 X92.208 Y118.856 E.00674
M204 S10000
G1 X91.864 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y119.204 E-.17649
G1 X91.781 Y119.156 E-.1945
G1 X91.809 Y119.109 E-.19452
G1 X91.864 Y119.109 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.528 Y119.92 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X93.952 Y119.931 E.04272
; WIPE_START
G1 X95.528 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y118.443 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
; LINE_WIDTH: 0.436941
G1 X95.746 Y119.823 E.00603
; LINE_WIDTH: 0.459218
G1 X95.528 Y119.92 E.00636
G1 X96.048 Y119.954 E.01385
; LINE_WIDTH: 0.419996
G1 X98.184 Y119.954 E.05151
G1 X98.184 Y117.705 E.05423
; LINE_WIDTH: 0.435431
G1 X98.161 Y117.518 E.00473
; LINE_WIDTH: 0.45547
G1 X98.139 Y117.331 E.00497
G1 X97.955 Y117.735 E.01169
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.732 Y118.435 E.01088
M204 S10000
G1 X97.027 Y118.797 F42000
G1 F12000
M204 S4000
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.477 E.02632
G1 X97.358 Y118.723 E.01216
G1 X97.086 Y118.784 E.00674
M204 S10000
G1 X97.413 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y119.204 E-.17646
G1 X97.331 Y119.156 E-.19451
G1 X97.359 Y119.109 E-.19453
G1 X97.413 Y119.109 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.158 Y115.662 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X98.153 Y117.238 E.04268
; WIPE_START
G1 X98.158 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y114.32 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X97.18 Y114.381 E.01233
G1 X97.621 Y114.628 E.0122
G1 X97.955 Y115.027 E.01255
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.62 Y112.821 E.00723
; LINE_WIDTH: 0.45054
G1 X95.33 Y112.834 E.00755
G1 X95.887 Y112.998 E.0151
; LINE_WIDTH: 0.419996
G1 X96.364 Y113.371 E.0146
G1 X96.611 Y113.812 E.0122
G1 X96.665 Y114.26 E.01088
M204 S10000
G1 X97.027 Y113.965 F42000
G1 F12000
M204 S4000
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.194 E.02632
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.014 Y113.907 E.00674
M204 S10000
G1 X97.413 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y113.654 E-.17646
G1 X97.331 Y113.606 E-.19451
G1 X97.359 Y113.559 E-.19453
G1 X97.413 Y113.559 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X95.271 Y112.831 E.04272
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y114.32 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.611 Y113.812 E.01233
G1 X92.858 Y113.371 E.0122
G1 X93.257 Y113.037 E.01255
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.051 Y115.372 E.00723
; LINE_WIDTH: 0.45054
G1 X91.064 Y115.662 E.00755
G1 X91.228 Y115.105 E.0151
; LINE_WIDTH: 0.419996
G1 X91.601 Y114.628 E.0146
G1 X92.042 Y114.381 E.0122
G1 X92.49 Y114.327 E.01088
M204 S10000
G1 X92.195 Y113.965 F42000
G1 F12000
M204 S4000
G1 X92.269 Y113.634 E.00819
G1 X92.515 Y113.194 E.01216
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.137 Y113.979 E.00674
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.304 Y112.508 Z6.04 F42000
G1 X83.585 Y112.408 Z6.04
G1 Z5.64
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.446 Y117.216 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
M73 P91 R1
G1 X81.728 Y117.216 E.00299
G1 X80.506 Y117.216 E.02947
M204 S10000
G1 X80.847 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.072 Y117.273 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X76.061 Y115.747 I17.533 J-.888 E.04139
; WIPE_START
G1 X76.072 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.876 Y119.096 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X77.541 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X77.29 Y119.118 E.01243
G1 X77.199 Y118.781 E.00841
G1 X76.875 Y118.702 E.00806
G1 X76.424 Y118.452 E.01243
G1 X76.424 Y119.569 E.02693
G1 X77.481 Y119.569 E.02549
; WIPE_START
G1 X76.424 Y119.569 E-.40161
G1 X76.424 Y118.625 E-.35839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.916 Y119.928 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F12000
M204 S4000
G1 X78.636 Y119.845 E.00776
; LINE_WIDTH: 0.421098
G1 X78.356 Y119.763 E.00706
G1 X77.879 Y119.386 E.01472
G1 X77.633 Y118.942 E.01227
G3 X77.567 Y118.433 I2.152 J-.54 E.01242
G1 X77.051 Y118.359 E.01261
G1 X76.607 Y118.114 E.01227
G1 X76.269 Y117.714 E.01265
; LINE_WIDTH: 0.436936
G1 X76.171 Y117.493 E.00608
; LINE_WIDTH: 0.459204
G1 X76.072 Y117.273 E.00642
G1 X76.038 Y117.799 E.01399
; LINE_WIDTH: 0.419996
G1 X76.038 Y119.954 E.05198
G1 X78.333 Y119.954 E.05535
; LINE_WIDTH: 0.433101
G1 X78.595 Y119.943 E.00653
; LINE_WIDTH: 0.459311
G1 X78.857 Y119.931 E.00696
; WIPE_START
G1 X78.595 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.503 Y119.92 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X78.976 Y119.931 I-.888 J-17.533 E.04139
; WIPE_START
G1 X80.503 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.404 Y119.096 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X82.798 Y118.452 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.682 Y119.569 E.01243
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.512 E.02549
M204 S10000
G1 X83.184 Y117.685 F42000
; LINE_WIDTH: 0.435411
G1 F12000
M204 S4000
G1 X83.161 Y117.495 E.00478
; LINE_WIDTH: 0.455425
G1 X83.139 Y117.306 E.00502
G1 X82.953 Y117.714 E.01181
; LINE_WIDTH: 0.419996
G1 X82.616 Y118.114 E.01261
G1 X82.171 Y118.359 E.01224
G3 X81.663 Y118.426 I-.54 J-2.152 E.01239
G1 X81.589 Y118.942 E.01257
G1 X81.344 Y119.386 E.01224
G1 X80.944 Y119.723 E.01261
; LINE_WIDTH: 0.436936
G1 X80.723 Y119.822 E.00608
; LINE_WIDTH: 0.459204
G1 X80.503 Y119.92 E.00642
G1 X81.028 Y119.954 E.01399
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.05198
G1 X83.184 Y117.745 E.05329
; WIPE_START
G1 X83.184 Y119.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467512
G1 F12000
M204 S4000
G1 X83.153 Y117.213 E.04134
; WIPE_START
G1 X83.158 Y115.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.64 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.459326
G1 F12000
M204 S4000
G1 X83.171 Y115.395 E.00776
; LINE_WIDTH: 0.42078
G1 X83.184 Y112.808 E.06251
G1 X80.889 Y112.808 E.05546
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.171 Y114.404 E.01257
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.046 Y115.339 E.00761
; LINE_WIDTH: 0.459326
G1 X83.14 Y115.629 E.00811
; WIPE_START
G1 X83.046 Y115.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y114.311 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.798 Y113.194 E.02693
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.746 Y114.282 E.01099
M204 S10000
G1 X82.404 Y113.567 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y113.667 E-.18392
G1 X82.318 Y113.617 E-.19203
G1 X82.347 Y113.567 E-.19203
G1 X82.404 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04139
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.64 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
; WIPE_START
G1 X78.472 Y112.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.541 Y113.194 Z6.04 F42000
G1 Z5.64
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
M204 S10000
G1 X76.876 Y113.567 F42000
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.818 Y113.667 E-.18392
G1 X76.789 Y113.617 E-.19203
G1 X76.818 Y113.567 E-.19203
G1 X76.876 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/38
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 300
M204 S10000
G17
G3 Z6.04 I-.28 J1.184 P1  F42000
G1 X105.637 Y120.355 Z6.04
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
M204 S10000
G1 X110.897 Y115.096 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
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
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
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


G1 X106.852 Y119.121 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X106.424 Y118.503 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.424 Y119.569 E.0257
G1 X107.49 Y119.569 E.0257
G1 X107.209 Y119.045 E.01434
G1 X107.173 Y118.819 E.0055
G1 X106.853 Y118.744 E.00793
G1 X106.476 Y118.532 E.01043
; WIPE_START
G1 X106.853 Y118.744 E-.16438
G1 X107.173 Y118.819 E-.12492
G1 X107.209 Y119.045 E-.08671
G1 X107.49 Y119.569 E-.22599
G1 X107.074 Y119.569 E-.15801
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467702
G1 F12000
M204 S4000
G1 X106.061 Y115.697 E.04405
; WIPE_START
G1 X106.072 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.072 Y117.323 Z5.8 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470801
G1 F12000
M204 S4000
G1 X106.055 Y117.58 E.00704
; LINE_WIDTH: 0.42094
G1 X106.038 Y117.838 E.00624
G1 X106.038 Y119.954 E.05117
G1 X108.291 Y119.954 E.05447
; LINE_WIDTH: 0.433056
G1 X108.579 Y119.941 E.00719
; LINE_WIDTH: 0.45047
G1 X108.867 Y119.928 E.0075
G1 X108.314 Y119.767 E.015
; LINE_WIDTH: 0.419996
G1 X107.838 Y119.397 E.01453
G1 X107.589 Y118.959 E.01216
G1 X107.526 Y118.467 E.01197
G1 X107.034 Y118.403 E.01197
G1 X106.595 Y118.155 E.01216
G1 X106.265 Y117.756 E.01248
; LINE_WIDTH: 0.436931
G1 X106.181 Y117.567 E.00521
; LINE_WIDTH: 0.470801
G1 X106.096 Y117.378 E.00565
; WIPE_START
G1 X106.181 Y117.567 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.064 Y115.637 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.424 Y114.26 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.49 Y113.194 E.01188
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.2 E.02425
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.67 Y112.842 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X110.295 Y112.831 E.04405
M204 S10000
G1 X110.355 Y112.834 F42000
; LINE_WIDTH: 0.459176
M73 P92 R1
G1 F12000
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.733 Y113.194 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.194 E.0257
G1 X111.793 Y113.194 E.02426
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.158 Y115.637 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467402
G1 F12000
M204 S4000
G1 X113.153 Y117.263 E.04402
; WIPE_START
G1 X113.158 Y115.637 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.423 Y119.121 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.452496
G1 F12000
M204 S4000
G2 X112.415 Y119.212 I-.026 J.043 E.00537
M204 S10000
G1 X111.733 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.799 Y119.569 E.0257
G1 X112.799 Y118.503 E.0257
G1 X112.274 Y118.784 E.01434
G1 X112.049 Y118.819 E.0055
G1 X111.974 Y119.139 E.00793
G1 X111.762 Y119.516 E.01043
; WIPE_START
G1 X111.974 Y119.139 E-.16439
G1 X112.049 Y118.819 E-.12492
G1 X112.274 Y118.784 E-.0867
G1 X112.799 Y118.503 E-.226
G1 X112.799 Y118.919 E-.15799
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467705
G1 F12000
M204 S4000
G1 X108.927 Y119.931 E.04405
; WIPE_START
G1 X110.553 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.553 Y119.92 Z5.8 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X110.81 Y119.937 E.00704
; LINE_WIDTH: 0.420946
G1 X111.068 Y119.954 E.00624
G1 X113.184 Y119.954 E.05117
G1 X113.184 Y117.726 E.05386
; LINE_WIDTH: 0.435446
G1 X113.162 Y117.541 E.00469
; LINE_WIDTH: 0.455503
G1 X113.139 Y117.355 E.00492
G1 X112.958 Y117.756 E.01158
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.697 Y118.467 E.01197
G1 X111.633 Y118.959 E.01197
G1 X111.384 Y119.397 E.01216
G1 X110.986 Y119.728 E.01248
; LINE_WIDTH: 0.436936
G1 X110.797 Y119.812 E.00521
; LINE_WIDTH: 0.470816
G1 X110.608 Y119.896 E.00565
; WIPE_START
G1 X110.797 Y119.812 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.172 Y120.151 Z6.2 F42000
G1 X98.585 Y120.355 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
; WIPE_START
M204 S4000
G1 X93.751 Y114.264 E-.47827
G1 X93.792 Y114.146 E-.04742
G1 X93.944 Y114.071 E-.06452
G1 X94.391 Y114.071 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.072 Y117.298 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X91.061 Y115.722 E.04272
; WIPE_START
G1 X91.072 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y118.443 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.042 Y118.381 E.01233
G1 X91.601 Y118.134 E.0122
G1 X91.267 Y117.735 E.01255
; LINE_WIDTH: 0.436941
G1 X91.17 Y117.516 E.00603
; LINE_WIDTH: 0.459218
G1 X91.072 Y117.298 E.00636
G1 X91.038 Y117.818 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y119.954 E.05151
G1 X93.312 Y119.954 E.05484
; LINE_WIDTH: 0.433081
G1 X93.602 Y119.941 E.00723
; LINE_WIDTH: 0.450528
G1 X93.892 Y119.928 E.00755
G1 X93.335 Y119.765 E.0151
; LINE_WIDTH: 0.419996
G1 X92.858 Y119.392 E.0146
G1 X92.611 Y118.95 E.0122
G1 X92.557 Y118.502 E.01088
M204 S10000
G1 X92.195 Y118.797 F42000
G1 F12000
M204 S4000
G1 X91.864 Y118.723 E.00819
G1 X91.424 Y118.477 E.01216
G1 X91.424 Y119.569 E.02632
G1 X92.515 Y119.569 E.02632
G1 X92.269 Y119.129 E.01216
G1 X92.208 Y118.856 E.00674
M204 S10000
G1 X91.864 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y119.204 E-.17649
G1 X91.781 Y119.156 E-.1945
G1 X91.809 Y119.109 E-.19452
G1 X91.864 Y119.109 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.528 Y119.92 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X93.952 Y119.931 E.04272
; WIPE_START
G1 X95.528 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y118.443 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
; LINE_WIDTH: 0.436941
G1 X95.746 Y119.823 E.00603
; LINE_WIDTH: 0.459218
G1 X95.528 Y119.92 E.00636
G1 X96.048 Y119.954 E.01385
; LINE_WIDTH: 0.419996
G1 X98.184 Y119.954 E.05151
G1 X98.184 Y117.705 E.05423
; LINE_WIDTH: 0.435431
G1 X98.161 Y117.518 E.00473
; LINE_WIDTH: 0.45547
G1 X98.139 Y117.331 E.00497
G1 X97.955 Y117.735 E.01169
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.732 Y118.435 E.01088
M204 S10000
G1 X97.027 Y118.797 F42000
G1 F12000
M204 S4000
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.477 E.02632
G1 X97.358 Y118.723 E.01216
G1 X97.086 Y118.784 E.00674
M204 S10000
G1 X97.413 Y119.109 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y119.204 E-.17646
G1 X97.331 Y119.156 E-.19451
G1 X97.359 Y119.109 E-.19453
G1 X97.413 Y119.109 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.158 Y115.662 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467448
G1 F12000
M204 S4000
G1 X98.153 Y117.238 E.04268
; WIPE_START
G1 X98.158 Y115.662 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.673 Y114.32 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X97.18 Y114.381 E.01233
G1 X97.621 Y114.628 E.0122
G1 X97.955 Y115.027 E.01255
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.62 Y112.821 E.00723
; LINE_WIDTH: 0.45054
G1 X95.33 Y112.834 E.00755
G1 X95.887 Y112.998 E.0151
; LINE_WIDTH: 0.419996
G1 X96.364 Y113.371 E.0146
G1 X96.611 Y113.812 E.0122
G1 X96.665 Y114.26 E.01088
M204 S10000
G1 X97.027 Y113.965 F42000
G1 F12000
M204 S4000
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.194 E.02632
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.014 Y113.907 E.00674
M204 S10000
G1 X97.413 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X97.359 Y113.654 E-.17646
G1 X97.331 Y113.606 E-.19451
G1 X97.359 Y113.559 E-.19453
G1 X97.413 Y113.559 E-.1945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X95.271 Y112.831 E.04272
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y114.32 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.611 Y113.812 E.01233
G1 X92.858 Y113.371 E.0122
G1 X93.257 Y113.037 E.01255
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.051 Y115.372 E.00723
; LINE_WIDTH: 0.45054
G1 X91.064 Y115.662 E.00755
G1 X91.228 Y115.105 E.0151
; LINE_WIDTH: 0.419996
G1 X91.601 Y114.628 E.0146
G1 X92.042 Y114.381 E.0122
G1 X92.49 Y114.327 E.01088
M204 S10000
G1 X92.195 Y113.965 F42000
G1 F12000
M204 S4000
G1 X92.269 Y113.634 E.00819
G1 X92.515 Y113.194 E.01216
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.137 Y113.979 E.00674
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.304 Y112.508 Z6.2 F42000
G1 X83.585 Y112.408 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.355 E.17513
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.525 Y112.408 E.205
; WIPE_START
G1 X83.585 Y113.617 E-.46014
G1 X83.585 Y114.406 E-.29986
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y111.591 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.171 E.18217
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.341 Y111.591 E.22957
M204 S10000
G1 X84 Y111.992 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X84 Y113.617 E.04224
G1 X84 Y120.771 E.18593
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X83.94 Y111.992 E.22661
; WIPE_START
G1 X84 Y113.617 E-.61795
G1 X84 Y113.991 E-.14206
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y118.033 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.96 Y114.73 E.01676
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.961 Y118.093 E.0152
; WIPE_START
G1 X77.315 Y118.017 E-.24718
G1 X76.88 Y117.825 E-.18068
G1 X76.601 Y117.493 E-.16481
G1 X76.5 Y117.198 E-.11854
G1 X76.489 Y117.07 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.446 Y117.216 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.776 Y115.546 E.03092
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
M73 P93 R1
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.506 Y117.216 E.02947
M204 S10000
G1 X80.847 Y117.617 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.072 Y117.273 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X76.061 Y115.747 I17.533 J-.888 E.04139
; WIPE_START
G1 X76.072 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.876 Y119.096 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X77.541 Y119.569 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X77.29 Y119.118 E.01243
G1 X77.199 Y118.781 E.00841
G1 X76.875 Y118.702 E.00806
G1 X76.424 Y118.452 E.01243
G1 X76.424 Y119.569 E.02693
G1 X77.481 Y119.569 E.02549
; WIPE_START
G1 X76.424 Y119.569 E-.40161
G1 X76.424 Y118.625 E-.35839
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.916 Y119.928 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.459311
G1 F12000
M204 S4000
G1 X78.636 Y119.845 E.00776
; LINE_WIDTH: 0.421098
G1 X78.356 Y119.763 E.00706
G1 X77.879 Y119.386 E.01472
G1 X77.633 Y118.942 E.01227
G3 X77.567 Y118.433 I2.152 J-.54 E.01242
G1 X77.051 Y118.359 E.01261
G1 X76.607 Y118.114 E.01227
G1 X76.269 Y117.714 E.01265
; LINE_WIDTH: 0.436936
G1 X76.171 Y117.493 E.00608
; LINE_WIDTH: 0.459204
G1 X76.072 Y117.273 E.00642
G1 X76.038 Y117.799 E.01399
; LINE_WIDTH: 0.419996
G1 X76.038 Y119.954 E.05198
G1 X78.333 Y119.954 E.05535
; LINE_WIDTH: 0.433101
G1 X78.595 Y119.943 E.00653
; LINE_WIDTH: 0.459311
G1 X78.857 Y119.931 E.00696
; WIPE_START
G1 X78.595 Y119.943 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.503 Y119.92 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X78.976 Y119.931 I-.888 J-17.533 E.04139
; WIPE_START
G1 X80.503 Y119.92 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.404 Y119.096 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
M204 S10000
G1 X82.798 Y118.452 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.682 Y119.569 E.01243
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.512 E.02549
M204 S10000
G1 X83.184 Y117.685 F42000
; LINE_WIDTH: 0.435411
G1 F12000
M204 S4000
G1 X83.161 Y117.495 E.00478
; LINE_WIDTH: 0.455425
G1 X83.139 Y117.306 E.00502
G1 X82.953 Y117.714 E.01181
; LINE_WIDTH: 0.419996
G1 X82.616 Y118.114 E.01261
G1 X82.171 Y118.359 E.01224
G3 X81.663 Y118.426 I-.54 J-2.152 E.01239
G1 X81.589 Y118.942 E.01257
G1 X81.344 Y119.386 E.01224
G1 X80.944 Y119.723 E.01261
; LINE_WIDTH: 0.436936
G1 X80.723 Y119.822 E.00608
; LINE_WIDTH: 0.459204
G1 X80.503 Y119.92 E.00642
G1 X81.028 Y119.954 E.01399
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.05198
G1 X83.184 Y117.745 E.05329
; WIPE_START
G1 X83.184 Y119.745 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467512
G1 F12000
M204 S4000
G1 X83.153 Y117.213 E.04134
; WIPE_START
G1 X83.158 Y115.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z5.8 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.459326
G1 F12000
M204 S4000
G1 X83.171 Y115.395 E.00776
; LINE_WIDTH: 0.42078
G1 X83.184 Y112.808 E.06251
G1 X80.889 Y112.808 E.05546
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.171 Y114.404 E.01257
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.046 Y115.339 E.00761
; LINE_WIDTH: 0.459326
G1 X83.14 Y115.629 E.00811
; WIPE_START
G1 X83.046 Y115.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y114.311 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.798 Y113.194 E.02693
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.746 Y114.282 E.01099
M204 S10000
G1 X82.404 Y113.567 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y113.667 E-.18392
G1 X82.318 Y113.617 E-.19203
G1 X82.347 Y113.567 E-.19203
G1 X82.404 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04139
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z5.8 F42000
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
; WIPE_START
G1 X78.472 Y112.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.541 Y113.194 Z6.2 F42000
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
M204 S10000
G1 X76.876 Y113.567 F42000
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
; CHANGE_LAYER
; Z_HEIGHT: 5.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X76.818 Y113.667 E-.18392
G1 X76.789 Y113.617 E-.19203
G1 X76.818 Y113.567 E-.19203
G1 X76.876 Y113.567 E-.19202
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/38
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
M106 S107.1
; OBJECT_ID: 300
M204 S10000
G17
G3 Z6.2 I-.28 J1.184 P1  F42000
G1 X105.637 Y120.355 Z6.2
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.637 Y112.408 E.20656
G1 X113.585 Y112.408 E.20656
G1 X113.585 Y113.596 E.03088
G1 X113.585 Y120.355 E.17568
G1 X105.697 Y120.355 E.205
; WIPE_START
G1 X105.682 Y118.355 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.821 Y121.171 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.596 E.04834
G1 X114.401 Y121.171 E.18268
G1 X104.881 Y121.171 E.22957
M204 S10000
G1 X105.222 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X105.222 Y111.992 E.22817
G1 X114 Y111.992 E.22817
G1 X114 Y113.596 E.04169
G1 X114 Y120.771 E.18648
G1 X105.282 Y120.771 E.22661
; WIPE_START
G1 X105.268 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.312 Y114.68 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X111.917 Y114.698 E.01571
G1 X112.351 Y114.895 E.01239
G1 X112.625 Y115.225 E.01116
G1 X112.737 Y115.689 E.01241
G1 X112.737 Y117.073 E.03598
G3 X112.625 Y117.537 I-1.009 J0 E.01253
G1 X112.351 Y117.868 E.01116
G1 X111.917 Y118.065 E.01239
G1 X111.312 Y118.083 E.01571
G1 X111.295 Y118.687 E.01571
G1 X111.098 Y119.121 E.01239
G1 X110.767 Y119.395 E.01116
G3 X110.303 Y119.508 I-.464 J-.896 E.01253
G1 X108.919 Y119.508 E.03598
G1 X108.455 Y119.395 E.01241
G1 X108.125 Y119.121 E.01116
G1 X107.928 Y118.687 E.01239
G1 X107.91 Y118.083 E.01571
G1 X107.306 Y118.065 E.01571
G1 X106.872 Y117.868 E.01239
G1 X106.598 Y117.537 E.01116
G3 X106.485 Y117.073 I.896 J-.464 E.01253
G1 X106.485 Y115.689 E.03598
G1 X106.598 Y115.225 E.01241
G1 X106.872 Y114.895 E.01116
G1 X107.306 Y114.698 E.01239
G1 X107.91 Y114.68 E.01571
G1 X107.928 Y114.076 E.01571
G1 X108.125 Y113.642 E.01239
G1 X108.455 Y113.368 E.01116
G3 X108.919 Y113.255 I.464 J.896 E.01253
G1 X110.303 Y113.255 E.03598
G1 X110.767 Y113.368 E.01241
G1 X111.098 Y113.642 E.01116
G1 X111.295 Y114.076 E.01239
G1 X111.311 Y114.62 E.01415
; WIPE_START
G1 X111.917 Y114.698 E-.23214
G1 X112.351 Y114.895 E-.18109
G1 X112.625 Y115.225 E-.16313
G1 X112.737 Y115.689 E-.18145
G1 X112.737 Y115.695 E-.00219
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X110.496 Y115.496 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X111.728 Y115.496 E.02971
G1 X111.847 Y115.537 E.00303
G1 X111.921 Y115.689 E.00407
G1 X111.921 Y117.073 E.03338
G1 X111.847 Y117.225 E.00407
G1 X111.728 Y117.266 E.00303
G1 X110.496 Y117.266 E.02971
G1 X110.496 Y118.498 E.02971
G1 X110.455 Y118.617 E.00303
G1 X110.303 Y118.691 E.00407
G1 X108.919 Y118.691 E.03338
G1 X108.767 Y118.617 E.00407
G1 X108.726 Y118.498 E.00303
G1 X108.726 Y117.266 E.02971
G1 X107.494 Y117.266 E.02971
G1 X107.375 Y117.225 E.00303
G1 X107.301 Y117.073 E.00407
G1 X107.301 Y115.689 E.03338
G1 X107.375 Y115.537 E.00407
G1 X107.494 Y115.496 E.00303
G1 X108.726 Y115.496 E.02971
G1 X108.726 Y114.264 E.02971
G1 X108.767 Y114.145 E.00303
G1 X108.919 Y114.071 E.00407
G1 X110.303 Y114.071 E.03338
G1 X110.455 Y114.145 E.00407
G1 X110.496 Y114.264 E.00303
G1 X110.496 Y115.436 E.02827
M204 S10000
G1 X110.897 Y115.096 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X111.728 Y115.096 E.02161
G3 X112.094 Y115.222 I0 J.594 E.01025
G1 X112.255 Y115.416 E.00656
G1 X112.322 Y115.689 E.0073
G1 X112.322 Y117.073 E.03598
G1 X112.255 Y117.346 E.0073
G1 X112.094 Y117.541 E.00656
G1 X111.839 Y117.657 E.00728
G1 X110.897 Y117.667 E.02449
G1 X110.897 Y118.498 E.02161
G3 X110.771 Y118.864 I-.594 J0 E.01025
G1 X110.576 Y119.025 E.00656
G1 X110.303 Y119.092 E.0073
G1 X108.919 Y119.092 E.03598
G1 X108.646 Y119.025 E.0073
G1 X108.452 Y118.864 E.00656
G1 X108.336 Y118.609 E.00728
G1 X108.325 Y117.667 E.02449
G1 X107.494 Y117.667 E.02161
G3 X107.128 Y117.541 I0 J-.594 E.01025
G1 X106.967 Y117.346 E.00656
G1 X106.9 Y117.073 E.0073
G1 X106.9 Y115.689 E.03598
G1 X106.967 Y115.416 E.0073
G1 X107.128 Y115.222 E.00656
G1 X107.383 Y115.106 E.00728
G1 X108.325 Y115.096 E.02449
G1 X108.325 Y114.264 E.02161
G3 X108.452 Y113.898 I.594 J0 E.01025
G1 X108.646 Y113.737 E.00656
G1 X108.919 Y113.671 E.0073
G1 X110.303 Y113.671 E.03598
G1 X110.576 Y113.737 E.0073
G1 X110.771 Y113.898 E.00656
G1 X110.886 Y114.153 E.00728
G1 X110.896 Y115.036 E.02293
; WIPE_START
G1 X111.728 Y115.096 E-.31705
G1 X111.909 Y115.124 E-.06942
G1 X112.094 Y115.222 E-.07974
G1 X112.255 Y115.416 E-.09594
G1 X112.322 Y115.689 E-.10671
G1 X112.322 Y115.929 E-.09115
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.36 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.36
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.36 F4000
            G39.3 S1
            G0 Z6.36 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X112.072 Y119.389 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X111.497 Y118.813 E.01962
G1 X111.319 Y119.181
G1 X112.101 Y119.964 E.02668
G1 X111.72 Y120.128
G1 X111.045 Y119.453 E.02301
G1 X110.701 Y119.654
G1 X111.175 Y120.128 E.01615
G1 X110.629 Y120.128
G1 X110.236 Y119.735 E.01341
G1 X110.084 Y120.128
G1 X109.691 Y119.735 E.01341
G1 X108.993 Y120.128
G1 X108.498 Y119.633 E.01688
G1 X107.742 Y118.877
G1 X107.115 Y118.25 E.02139
; WIPE_START
M204 S4000
G1 X107.742 Y118.877 E-.33702
G1 X108.498 Y119.633 E-.40606
G1 X108.529 Y119.664 E-.01692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.865 Y117.545 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X108.445 Y120.126 E.08801
G1 X107.902 Y120.128
G1 X105.865 Y118.09 E.06949
G1 X105.865 Y118.636
G1 X107.357 Y120.128 E.05089
G1 X106.811 Y120.128
G1 X105.865 Y119.181 E.03229
G1 X105.865 Y119.726
G1 X106.259 Y120.121 E.01345
; WIPE_START
M204 S4000
G1 X105.865 Y119.726 E-.21196
G1 X105.865 Y119.181 E-.20726
G1 X106.499 Y119.815 E-.34078
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.358 Y117.469 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.128709
G1 F15000
M204 S4000
G1 X106.032 Y117.377 E.002
G2 X105.845 Y117.456 I-.004 J.252 E.00123
; WIPE_START
G1 X105.975 Y117.383 E-.20829
G1 X106.032 Y117.377 E-.07966
G1 X106.358 Y117.469 E-.47205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.053 Y118.313 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.191591
G1 F15000
M204 S4000
G1 X106.888 Y118.191 E.00201
; LINE_WIDTH: 0.142939
G3 X106.711 Y118.059 I.589 J-.97 E.0015
G1 X106.362 Y117.675 E.00352
; LINE_WIDTH: 0.170821
G1 X106.094 Y117.319 E.00381
; WIPE_START
G1 X106.362 Y117.675 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.115 Y119.838 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.0859786
G1 F15000
M204 S4000
G3 X108.887 Y119.725 I.812 J-1.932 E.00082
; WIPE_START
G1 X109.115 Y119.838 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.063 Y117.115 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466078
G1 F12000
M204 S4000
G3 X106.061 Y115.697 I21.05 J-.73 E.03829
M204 S10000
G1 X106.064 Y115.637 F42000
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X106.145 Y115.361 E.00766
; LINE_WIDTH: 0.4211
G1 X106.226 Y115.084 E.00697
G1 X106.595 Y114.608 E.01457
G1 X107.034 Y114.359 E.01219
G1 X107.526 Y114.296 E.012
G1 X107.589 Y113.804 E.012
G1 X107.838 Y113.365 E.01219
G1 X108.236 Y113.035 E.01252
; LINE_WIDTH: 0.436931
G1 X108.453 Y112.938 E.00597
; LINE_WIDTH: 0.459197
G1 X108.67 Y112.842 E.0063
G1 X108.155 Y112.808 E.01371
; LINE_WIDTH: 0.419996
G1 X106.038 Y112.808 E.05104
G1 X106.038 Y115.061 E.05434
; LINE_WIDTH: 0.433056
G1 X106.05 Y115.319 E.00644
; LINE_WIDTH: 0.459176
G1 X106.062 Y115.577 E.00686
; WIPE_START
G1 X106.05 Y115.319 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.424 Y114.26 Z6.36 F42000
M73 P94 R1
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X106.948 Y113.979 E.01434
G1 X107.173 Y113.943 E.0055
G1 X107.248 Y113.623 E.00793
G1 X107.49 Y113.194 E.01188
G1 X106.424 Y113.194 E.0257
G1 X106.424 Y114.2 E.02425
M204 S10000
G1 X106.852 Y113.551 F42000
; LINE_WIDTH: 0.452456
G1 F12000
M204 S4000
G2 X106.844 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X106.8 Y113.641 E-.16808
G1 X106.773 Y113.596 E-.19731
G1 X106.8 Y113.551 E-.19731
G1 X106.852 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.67 Y112.842 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467703
G1 F12000
M204 S4000
G1 X110.295 Y112.831 E.04405
M204 S10000
G1 X110.355 Y112.834 F42000
; LINE_WIDTH: 0.459176
G1 F12000
M204 S4000
G1 X110.632 Y112.915 E.00766
; LINE_WIDTH: 0.4211
G1 X110.908 Y112.996 E.00697
G1 X111.384 Y113.365 E.01457
G1 X111.633 Y113.804 E.01219
G1 X111.697 Y114.296 E.012
G1 X112.189 Y114.359 E.012
G1 X112.627 Y114.608 E.01219
G1 X112.958 Y115.007 E.01252
; LINE_WIDTH: 0.433061
G1 X113.058 Y115.322 E.00825
; LINE_WIDTH: 0.450891
G1 X113.158 Y115.637 E.00862
G1 X113.184 Y115.061 E.01501
; LINE_WIDTH: 0.419996
G1 X113.184 Y112.808 E.05434
G1 X110.931 Y112.808 E.05434
; LINE_WIDTH: 0.433056
G1 X110.673 Y112.82 E.00644
; LINE_WIDTH: 0.459176
G1 X110.415 Y112.832 E.00686
; WIPE_START
G1 X110.673 Y112.82 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.733 Y113.194 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X112.014 Y113.718 E.01434
G1 X112.049 Y113.943 E.0055
G1 X112.369 Y114.018 E.00793
G1 X112.799 Y114.26 E.01188
G1 X112.799 Y113.194 E.0257
G1 X111.793 Y113.194 E.02426
M204 S10000
G1 X112.423 Y113.551 F42000
; LINE_WIDTH: 0.452476
G1 F12000
M204 S4000
G2 X112.415 Y113.641 I-.026 J.043 E.00537
; WIPE_START
G1 X112.37 Y113.641 E-.16808
G1 X112.344 Y113.596 E-.19731
G1 X112.37 Y113.551 E-.19731
G1 X112.423 Y113.551 E-.1973
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P94 R0
G1 X113.15 Y117.323 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467704
G1 F12000
M204 S4000
G1 X113.161 Y115.697 E.04405
; WIPE_START
G1 X113.15 Y117.323 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X111.705 Y118.466 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X111.729 Y118.561 E.00237
G1 X111.974 Y118.729 E.00717
G3 X112.3 Y119.954 I-1.259 J.991 E.03143
G1 X113.184 Y119.954 E.02132
G1 X113.184 Y117.726 E.05373
; LINE_WIDTH: 0.436931
G1 X113.167 Y117.525 E.00509
; LINE_WIDTH: 0.458933
G1 X113.15 Y117.323 E.00537
G1 X112.958 Y117.756 E.01258
; LINE_WIDTH: 0.419996
G1 X112.627 Y118.155 E.01248
G1 X112.189 Y118.403 E.01216
G1 X111.764 Y118.458 E.01032
M204 S10000
G1 X112.398 Y118.708 F42000
; LINE_WIDTH: 0.406716
G1 F12000
M204 S4000
G1 X112.479 Y118.84 E.0036
; LINE_WIDTH: 0.453316
G1 X112.561 Y118.971 E.00405
; LINE_WIDTH: 0.499916
G1 X112.642 Y119.103 E.0045
; LINE_WIDTH: 0.546516
G1 X112.724 Y119.234 E.00495
G1 X112.747 Y119.12 E.00374
; LINE_WIDTH: 0.499916
G1 X112.77 Y119.005 E.0034
; LINE_WIDTH: 0.453316
G1 X112.794 Y118.891 E.00306
; LINE_WIDTH: 0.386608
G2 X112.817 Y118.465 I-1.035 J-.27 E.00946
G1 X112.45 Y118.678 E.00936
M204 S10000
G1 X112.745 Y119.515 F42000
; LINE_WIDTH: 0.548396
G1 F12000
M204 S4000
G1 X112.728 Y119.294 E.00713
; WIPE_START
G1 X112.745 Y119.515 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.126 Y119.967 Z6.36 F42000
G1 X98.585 Y120.355 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.637 Y120.355 E.20656
G1 X90.637 Y112.408 E.20656
G1 X98.585 Y112.408 E.20656
G1 X98.585 Y113.606 E.03116
G1 X98.585 Y120.295 E.17384
; WIPE_START
G1 X96.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X89.821 Y121.171 E.23102
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.606 E.04859
G1 X99.401 Y121.111 E.18098
M204 S10000
G1 X99 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X90.222 Y120.771 E.22817
G1 X90.222 Y111.992 E.22817
G1 X99 Y111.992 E.22817
G1 X99 Y113.606 E.04196
G1 X99 Y120.711 E.18465
; WIPE_START
G1 X97.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.935 Y114.705 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X92.952 Y114.081 E.01623
G1 X93.146 Y113.646 E.01237
G1 X93.477 Y113.369 E.01122
G3 X93.944 Y113.255 I.467 J.895 E.01261
G1 X95.278 Y113.255 E.03468
G1 X95.745 Y113.369 E.01249
G1 X96.076 Y113.646 E.01122
G1 X96.271 Y114.081 E.01237
G1 X96.287 Y114.705 E.01623
G1 X96.912 Y114.722 E.01623
G1 X97.346 Y114.916 E.01237
G1 X97.623 Y115.247 E.01122
G1 X97.737 Y115.714 E.01249
G1 X97.737 Y117.048 E.03468
G3 X97.623 Y117.515 I-1.009 J0 E.01261
G1 X97.346 Y117.846 E.01122
G1 X96.912 Y118.041 E.01237
G1 X96.287 Y118.058 E.01623
G1 X96.271 Y118.682 E.01623
G1 X96.076 Y119.116 E.01237
G1 X95.745 Y119.393 E.01122
G3 X95.278 Y119.508 I-.467 J-.895 E.01261
G1 X93.944 Y119.508 E.03468
G1 X93.477 Y119.393 E.01249
G1 X93.146 Y119.116 E.01122
G1 X92.952 Y118.682 E.01237
G1 X92.935 Y118.058 E.01623
G1 X92.311 Y118.041 E.01623
G1 X91.876 Y117.846 E.01237
G1 X91.599 Y117.515 E.01122
G3 X91.485 Y117.048 I.895 J-.467 E.01261
G1 X91.485 Y115.714 E.03468
G1 X91.599 Y115.247 E.01249
G1 X91.876 Y114.916 E.01122
G1 X92.311 Y114.722 E.01237
G1 X92.875 Y114.707 E.01467
; WIPE_START
G1 X92.952 Y114.081 E-.23964
G1 X93.146 Y113.646 E-.1809
G1 X93.477 Y113.369 E-.16397
G1 X93.77 Y113.27 E-.11734
G1 X93.922 Y113.257 E-.05815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.751 Y115.521 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.751 Y114.264 E.03032
G1 X93.792 Y114.146 E.00301
G1 X93.944 Y114.071 E.00409
G1 X95.278 Y114.071 E.03218
G1 X95.431 Y114.146 E.00409
G1 X95.471 Y114.264 E.00301
G1 X95.471 Y115.521 E.03032
G1 X96.728 Y115.521 E.03032
G1 X96.846 Y115.562 E.00301
G1 X96.921 Y115.714 E.00409
G1 X96.921 Y117.048 E.03218
G1 X96.846 Y117.201 E.00409
G1 X96.728 Y117.241 E.00301
G1 X95.471 Y117.241 E.03032
G1 X95.471 Y118.498 E.03032
G1 X95.431 Y118.617 E.00301
G1 X95.278 Y118.691 E.00409
G1 X93.944 Y118.691 E.03218
G1 X93.792 Y118.617 E.00409
G1 X93.751 Y118.498 E.00301
G1 X93.751 Y117.241 E.03032
G1 X92.494 Y117.241 E.03032
G1 X92.376 Y117.201 E.00301
G1 X92.301 Y117.048 E.00409
G1 X92.301 Y115.714 E.03218
G1 X92.376 Y115.562 E.00409
G1 X92.494 Y115.521 E.00301
G1 X93.691 Y115.521 E.02887
; WIPE_START
M204 S4000
G1 X93.751 Y114.264 E-.47827
G1 X93.792 Y114.146 E-.04742
G1 X93.944 Y114.071 E-.06452
G1 X94.391 Y114.071 E-.16979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.872 Y117.642 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X95.872 Y118.498 E.02226
G3 X95.748 Y118.862 I-.593 J0 E.01017
G1 X95.553 Y119.025 E.0066
G1 X95.278 Y119.092 E.00735
G1 X93.944 Y119.092 E.03468
G1 X93.669 Y119.025 E.00735
G1 X93.475 Y118.862 E.0066
G1 X93.36 Y118.606 E.00728
G1 X93.35 Y117.642 E.02507
G1 X92.494 Y117.642 E.02226
G3 X92.131 Y117.518 I0 J-.593 E.01017
G1 X91.968 Y117.323 E.0066
G1 X91.9 Y117.048 E.00735
G1 X91.9 Y115.714 E.03468
G1 X91.968 Y115.44 E.00735
G1 X92.131 Y115.245 E.0066
G1 X92.386 Y115.13 E.00728
G1 X93.35 Y115.121 E.02507
G1 X93.35 Y114.264 E.02226
G3 X93.475 Y113.901 I.593 J0 E.01017
G1 X93.669 Y113.738 E.0066
G1 X93.944 Y113.671 E.00735
G1 X95.278 Y113.671 E.03468
G1 X95.553 Y113.738 E.00735
G1 X95.748 Y113.901 E.0066
G1 X95.862 Y114.156 E.00728
G1 X95.872 Y115.121 E.02507
G1 X96.728 Y115.121 E.02226
G3 X97.092 Y115.245 I0 J.594 E.01017
G1 X97.255 Y115.44 E.0066
G1 X97.322 Y115.714 E.00735
G1 X97.322 Y117.048 E.03468
G1 X97.255 Y117.323 E.00735
G1 X97.092 Y117.518 E.0066
G1 X96.836 Y117.632 E.00728
G1 X95.932 Y117.641 E.02351
; WIPE_START
G1 X95.872 Y118.498 E-.32651
G1 X95.845 Y118.675 E-.06796
G1 X95.748 Y118.862 E-.07999
G1 X95.553 Y119.025 E-.09643
G1 X95.278 Y119.092 E-.1074
G1 X95.063 Y119.092 E-.08172
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.413 Y119.109 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y119.204 I-.027 J.046 E.00606
M204 S10000
G1 X97.027 Y118.797 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X96.953 Y119.129 E.00819
G1 X96.707 Y119.569 E.01216
G1 X97.799 Y119.569 E.02632
G1 X97.799 Y118.477 E.02632
G1 X97.358 Y118.723 E.01216
G1 X97.086 Y118.784 E.00674
M204 S10000
G1 X96.673 Y118.443 F42000
G1 F12000
M204 S4000
G1 X96.611 Y118.95 E.01233
G1 X96.364 Y119.392 E.0122
G1 X95.965 Y119.725 E.01255
G1 X95.81 Y119.792 E.00407
G1 X95.801 Y119.954 E.00393
G1 X98.184 Y119.954 E.05746
G1 X98.184 Y117.705 E.05423
; LINE_WIDTH: 0.436931
G1 X98.167 Y117.502 E.00515
; LINE_WIDTH: 0.458935
G1 X98.15 Y117.298 E.00543
G1 X97.955 Y117.735 E.01271
; LINE_WIDTH: 0.419996
G1 X97.621 Y118.134 E.01255
G1 X97.18 Y118.381 E.0122
G1 X96.732 Y118.435 E.01088
; WIPE_START
G1 X97.18 Y118.381 E-.23213
G1 X97.621 Y118.134 E-.26017
G1 X97.955 Y117.735 E-.2677
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.15 Y117.298 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467756
G1 F12000
M204 S4000
G1 X98.161 Y115.722 E.04271
; WIPE_START
G1 X98.15 Y117.298 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X97.413 Y113.559 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X97.408 Y113.654 I-.027 J.046 E.00606
M204 S10000
G1 X97.027 Y113.965 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X97.358 Y114.039 E.00819
G1 X97.799 Y114.285 E.01216
G1 X97.799 Y113.194 E.02632
G1 X96.707 Y113.194 E.02632
G1 X96.953 Y113.634 E.01216
G1 X97.014 Y113.907 E.00674
M204 S10000
G1 X96.673 Y114.32 F42000
G1 F12000
M204 S4000
G1 X97.18 Y114.381 E.01233
G1 X97.621 Y114.628 E.0122
G1 X97.955 Y115.027 E.01255
; LINE_WIDTH: 0.433081
G1 X98.057 Y115.345 E.0083
; LINE_WIDTH: 0.450938
G1 X98.158 Y115.662 E.00868
G1 X98.184 Y115.082 E.01511
; LINE_WIDTH: 0.419996
G1 X98.184 Y112.808 E.05484
G1 X95.91 Y112.808 E.05484
; LINE_WIDTH: 0.433086
G1 X95.62 Y112.821 E.00723
; LINE_WIDTH: 0.45054
G1 X95.33 Y112.834 E.00755
G1 X95.887 Y112.998 E.0151
; LINE_WIDTH: 0.419996
G1 X96.364 Y113.371 E.0146
G1 X96.611 Y113.812 E.0122
G1 X96.665 Y114.26 E.01088
; WIPE_START
G1 X96.611 Y113.812 E-.21947
G1 X96.364 Y113.371 E-.24599
G1 X95.887 Y112.998 E-.29454
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.695 Y112.842 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467777
G1 F12000
M204 S4000
G1 X95.271 Y112.831 E.04272
; WIPE_START
G1 X93.695 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.55 Y114.32 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X92.611 Y113.812 E.01233
G1 X92.858 Y113.371 E.0122
G1 X93.257 Y113.037 E.01255
; LINE_WIDTH: 0.436941
G1 X93.476 Y112.94 E.00603
; LINE_WIDTH: 0.459218
G1 X93.695 Y112.842 E.00636
G1 X93.174 Y112.808 E.01385
; LINE_WIDTH: 0.419996
G1 X91.038 Y112.808 E.05151
G1 X91.038 Y115.082 E.05484
; LINE_WIDTH: 0.433086
G1 X91.051 Y115.372 E.00723
; LINE_WIDTH: 0.45054
G1 X91.064 Y115.662 E.00755
G1 X91.228 Y115.105 E.0151
; LINE_WIDTH: 0.419996
G1 X91.601 Y114.628 E.0146
G1 X92.042 Y114.381 E.0122
G1 X92.49 Y114.327 E.01088
M204 S10000
G1 X92.195 Y113.965 F42000
G1 F12000
M204 S4000
G1 X92.269 Y113.634 E.00819
G1 X92.515 Y113.194 E.01216
G1 X91.424 Y113.194 E.02632
G1 X91.424 Y114.285 E.02632
G1 X91.864 Y114.039 E.01216
G1 X92.137 Y113.979 E.00674
M204 S10000
G1 X91.864 Y113.559 F42000
; LINE_WIDTH: 0.473636
G1 F12000
M204 S4000
G2 X91.859 Y113.654 I-.027 J.046 E.00606
; WIPE_START
G1 X91.809 Y113.654 E-.17649
G1 X91.781 Y113.606 E-.1945
G1 X91.809 Y113.559 E-.19452
G1 X91.864 Y113.559 E-.19449
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.062 Y117.115 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.466119
G1 F12000
M204 S4000
G3 X91.061 Y115.722 I34.916 J-.73 E.03761
; WIPE_START
G1 X91.062 Y117.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.965 Y119.735 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X95.358 Y120.128 E.01341
G1 X94.813 Y120.128
G1 X94.419 Y119.735 E.01341
G1 X93.852 Y119.713
G1 X94.267 Y120.128 E.01416
G1 X93.722 Y120.128
G1 X90.962 Y117.368 E.09411
G1 X90.865 Y117.816
G1 X93.176 Y120.128 E.07884
G1 X92.631 Y120.128
G1 X90.865 Y118.361 E.06024
G1 X90.865 Y118.907
G1 X92.085 Y120.128 E.04164
G1 X91.54 Y120.128
G1 X90.865 Y119.452 E.02304
; WIPE_START
M204 S4000
G1 X91.54 Y120.128 E-.36304
G1 X92.085 Y120.128 E-.20725
G1 X91.732 Y119.775 E-.18971
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.739 Y118.545 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.161084
G1 F15000
M204 S4000
G1 X92.11 Y118.231 E.00558
M204 S10000
G1 X92.762 Y118.883 F42000
; LINE_WIDTH: 0.161083
G1 F15000
M204 S4000
G1 X92.447 Y118.253 E.00558
; WIPE_START
G1 X92.762 Y118.883 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.226 Y120.092 Z6.36 F42000
G1 X83.585 Y120.355 Z6.36
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.637 Y120.355 E.20656
G1 X75.637 Y112.408 E.20656
G1 X83.585 Y112.408 E.20656
G1 X83.585 Y113.617 E.03143
G1 X83.585 Y120.295 E.17357
; WIPE_START
G1 X81.585 Y120.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.401 Y121.171 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X74.821 Y121.171 E.23102
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.617 E.04885
G1 X84.401 Y121.111 E.18072
M204 S10000
G1 X84 Y120.771 F42000
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X75.222 Y120.771 E.22817
G1 X75.222 Y111.992 E.22817
G1 X84 Y111.992 E.22817
G1 X84 Y113.617 E.04224
G1 X84 Y120.711 E.18437
; WIPE_START
G1 X82.001 Y120.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.96 Y114.73 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
G1 F9000
M204 S4000
G1 X77.976 Y114.085 E.01676
G1 X78.168 Y113.65 E.01236
G1 X78.499 Y113.371 E.01127
G1 X78.795 Y113.27 E.00811
G1 X78.969 Y113.255 E.00455
G1 X80.253 Y113.255 E.03338
G1 X80.723 Y113.371 E.01257
G1 X81.054 Y113.65 E.01127
G1 X81.247 Y114.085 E.01236
G1 X81.262 Y114.73 E.01676
G1 X81.907 Y114.746 E.01676
G1 X82.342 Y114.938 E.01236
G1 X82.622 Y115.269 E.01127
G1 X82.737 Y115.739 E.01257
G1 X82.737 Y117.023 E.03338
G1 X82.722 Y117.198 E.00455
G1 X82.622 Y117.493 E.00811
M73 P95 R0
G1 X82.342 Y117.825 E.01127
G1 X81.907 Y118.017 E.01236
G1 X81.262 Y118.033 E.01676
G1 X81.247 Y118.677 E.01676
G1 X81.054 Y119.112 E.01236
G1 X80.723 Y119.392 E.01127
G1 X80.428 Y119.492 E.00811
G1 X80.253 Y119.508 E.00455
G1 X78.969 Y119.508 E.03338
G1 X78.499 Y119.392 E.01257
G1 X78.168 Y119.112 E.01127
G1 X77.976 Y118.677 E.01236
G1 X77.96 Y118.033 E.01676
G1 X77.315 Y118.017 E.01676
G1 X76.88 Y117.825 E.01236
G1 X76.601 Y117.493 E.01127
G1 X76.5 Y117.198 E.00811
G1 X76.485 Y117.023 E.00455
G1 X76.485 Y115.739 E.03338
G1 X76.601 Y115.27 E.01257
G1 X76.88 Y114.938 E.01127
G1 X77.315 Y114.746 E.01236
G1 X77.9 Y114.731 E.0152
; WIPE_START
G1 X77.976 Y114.085 E-.24718
G1 X78.168 Y113.65 E-.18068
G1 X78.499 Y113.371 E-.16481
G1 X78.795 Y113.27 E-.11854
G1 X78.923 Y113.259 E-.04879
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.776 Y115.546 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X78.776 Y114.264 E.03092
G1 X78.816 Y114.147 E.00299
G1 X78.969 Y114.071 E.00412
G1 X80.253 Y114.071 E.03097
G1 X80.406 Y114.147 E.00412
G1 X80.446 Y114.264 E.00299
G1 X80.446 Y115.546 E.03092
G1 X81.728 Y115.546 E.03092
G1 X81.846 Y115.586 E.00299
G1 X81.921 Y115.739 E.00412
G1 X81.921 Y117.023 E.03097
G1 X81.846 Y117.177 E.00412
G1 X81.728 Y117.216 E.00299
G1 X80.446 Y117.216 E.03092
G1 X80.446 Y118.498 E.03092
G1 X80.406 Y118.616 E.00299
G1 X80.253 Y118.691 E.00412
G1 X78.969 Y118.691 E.03097
G1 X78.816 Y118.616 E.00412
G1 X78.776 Y118.498 E.00299
G1 X78.776 Y117.216 E.03092
G1 X77.494 Y117.216 E.03092
G1 X77.377 Y117.177 E.00299
G1 X77.301 Y117.023 E.00412
G1 X77.301 Y115.739 E.03097
G1 X77.377 Y115.586 E.00412
G1 X77.494 Y115.546 E.00299
G1 X78.716 Y115.546 E.02947
; WIPE_START
M204 S4000
G1 X78.776 Y114.264 E-.48776
G1 X78.816 Y114.147 E-.04705
G1 X78.969 Y114.071 E-.06488
G1 X79.391 Y114.071 E-.16032
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.847 Y117.617 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449996
G1 F9000
M204 S4000
G1 X80.847 Y118.498 E.02291
G3 X80.724 Y118.859 I-.593 J0 E.01008
G1 X80.529 Y119.024 E.00663
G1 X80.253 Y119.092 E.00739
G1 X78.969 Y119.092 E.03338
G1 X78.693 Y119.024 E.00739
G1 X78.498 Y118.859 E.00663
G1 X78.385 Y118.604 E.00727
G1 X78.375 Y117.617 E.02564
G1 X77.494 Y117.617 E.02291
G3 X77.133 Y117.495 I0 J-.593 E.01008
G1 X76.969 Y117.3 E.00663
G1 X76.9 Y117.023 E.00739
G1 X76.9 Y115.739 E.03338
G1 X76.969 Y115.463 E.00739
G1 X77.133 Y115.268 E.00663
G1 X77.389 Y115.155 E.00727
G1 X78.375 Y115.146 E.02564
G1 X78.375 Y114.264 E.02291
G3 X78.498 Y113.903 I.593 J0 E.01008
G1 X78.693 Y113.739 E.00663
G1 X78.969 Y113.671 E.00739
G1 X80.253 Y113.671 E.03338
G1 X80.529 Y113.739 E.00739
G1 X80.724 Y113.903 E.00663
G1 X80.837 Y114.159 E.00727
G1 X80.847 Y115.146 E.02564
G1 X81.728 Y115.146 E.02291
G3 X82.089 Y115.268 I0 J.593 E.01008
G1 X82.254 Y115.463 E.00663
G1 X82.322 Y115.739 E.00739
G1 X82.322 Y117.023 E.03338
G1 X82.254 Y117.3 E.00739
G1 X82.089 Y117.495 E.00663
G1 X81.833 Y117.608 E.00727
G1 X80.907 Y117.616 E.02408
; WIPE_START
G1 X80.847 Y118.498 E-.33597
G1 X80.821 Y118.672 E-.06651
G1 X80.724 Y118.859 E-.08023
G1 X80.529 Y119.024 E-.09693
G1 X80.253 Y119.092 E-.10809
G1 X80.063 Y119.092 E-.07227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.012 Y118.144 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X77.849 Y118.981 E.02855
G1 X78.483 Y119.615
G1 X78.996 Y120.128 E.01748
G1 X78.45 Y120.128
G1 X75.865 Y117.542 E.08819
G1 X75.865 Y118.087
G1 X77.905 Y120.128 E.06959
G1 X77.36 Y120.128
G1 X75.865 Y118.633 E.05098
G1 X75.865 Y119.178
G1 X76.814 Y120.128 E.03238
G1 X76.26 Y120.119
G1 X75.865 Y119.724 E.01349
; WIPE_START
M204 S4000
G1 X76.26 Y120.119 E-.21255
G1 X76.814 Y120.128 E-.21056
G1 X76.187 Y119.501 E-.33689
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.752 Y118.401 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.126284
G1 F15000
M204 S4000
G1 X77.376 Y118.235 E.00236
M204 S10000
G1 X77.757 Y118.616 F42000
; LINE_WIDTH: 0.126283
G1 F15000
M204 S4000
G1 X77.592 Y118.24 E.00236
; WIPE_START
G1 X77.757 Y118.616 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.377 Y117.473 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.126227
G1 F15000
M204 S4000
G1 X76.031 Y117.376 E.00206
G2 X75.845 Y117.455 I-.003 J.251 E.00119
; WIPE_START
G1 X75.976 Y117.381 E-.2024
G1 X76.031 Y117.376 E-.07378
G1 X76.377 Y117.473 E-.48382
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.949 Y118.207 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.199673
G1 F15000
M204 S4000
G1 X76.837 Y118.125 E.00143
; LINE_WIDTH: 0.174492
G3 X76.708 Y118.028 I.429 J-.706 E.00142
G1 X76.354 Y117.643 E.00459
; LINE_WIDTH: 0.202732
G1 X76.107 Y117.317 E.00431
M204 S10000
G1 X76.063 Y117.115 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466148
G1 F12000
M204 S4000
G3 X76.061 Y115.747 I37.371 J-.73 E.03694
; WIPE_START
G1 X76.063 Y117.115 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.876 Y113.567 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.494836
G1 F12000
M204 S4000
G2 X76.873 Y113.667 I-.029 J.049 E.00681
M204 S10000
G1 X77.541 Y113.194 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X76.424 Y113.194 E.02693
G1 X76.424 Y114.311 E.02693
G1 X76.875 Y114.061 E.01243
G1 X77.211 Y113.969 E.00841
G1 X77.29 Y113.645 E.00806
G1 X77.512 Y113.246 E.01099
; WIPE_START
G1 X77.29 Y113.645 E-.17312
G1 X77.211 Y113.969 E-.12705
G1 X76.875 Y114.061 E-.13245
G1 X76.424 Y114.311 E-.19593
G1 X76.424 Y113.965 E-.13145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.72 Y112.842 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.470816
G1 F12000
M204 S4000
G1 X78.457 Y112.825 E.00719
; LINE_WIDTH: 0.420943
G1 X78.194 Y112.808 E.00637
G1 X76.038 Y112.808 E.05211
G1 X76.038 Y115.103 E.05548
; LINE_WIDTH: 0.433106
G1 X76.051 Y115.395 E.00728
; LINE_WIDTH: 0.450586
G1 X76.064 Y115.687 E.0076
G1 X76.23 Y115.127 E.0152
; LINE_WIDTH: 0.419996
G1 X76.607 Y114.649 E.01468
G1 X77.051 Y114.404 E.01224
G3 X77.559 Y114.337 I.54 J2.152 E.01239
G1 X77.633 Y113.821 E.01257
G1 X77.879 Y113.377 E.01224
G1 X78.278 Y113.039 E.01261
; LINE_WIDTH: 0.436936
G1 X78.472 Y112.953 E.00533
; LINE_WIDTH: 0.470816
G1 X78.665 Y112.867 E.00578
M204 S10000
G1 X78.72 Y112.842 F42000
; LINE_WIDTH: 0.467813
G1 F12000
M204 S4000
G3 X80.246 Y112.831 I.888 J17.533 E.04139
; WIPE_START
G1 X78.72 Y112.842 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.404 Y113.567 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y113.667 I-.029 J.049 E.00681
M204 S10000
G1 X82.798 Y114.311 F42000
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.798 Y113.194 E.02693
G1 X81.682 Y113.194 E.02693
G1 X81.932 Y113.645 E.01243
G1 X82.023 Y113.981 E.00841
G1 X82.348 Y114.061 E.00806
G1 X82.746 Y114.282 E.01099
; WIPE_START
G1 X82.348 Y114.061 E-.17313
G1 X82.023 Y113.981 E-.12704
G1 X81.932 Y113.645 E-.13245
G1 X81.682 Y113.194 E-.19593
G1 X82.028 Y113.194 E-.13145
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.158 Y115.687 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.459326
G1 F12000
M204 S4000
G1 X83.171 Y115.395 E.00776
; LINE_WIDTH: 0.42078
G1 X83.184 Y112.808 E.06251
G1 X80.889 Y112.808 E.05546
; LINE_WIDTH: 0.433101
G1 X80.597 Y112.821 E.00728
; LINE_WIDTH: 0.450575
G1 X80.306 Y112.834 E.0076
G1 X80.866 Y113 E.0152
; LINE_WIDTH: 0.419996
G1 X81.344 Y113.377 E.01468
G1 X81.589 Y113.821 E.01224
G3 X81.655 Y114.329 I-2.153 J.54 E.01239
G1 X82.171 Y114.404 E.01257
G1 X82.616 Y114.649 E.01224
G1 X82.953 Y115.048 E.01261
; LINE_WIDTH: 0.433106
G1 X83.046 Y115.339 E.00761
; LINE_WIDTH: 0.459326
G1 X83.14 Y115.629 E.00811
; WIPE_START
G1 X83.046 Y115.339 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.15 Y117.273 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.470786
G1 F12000
M204 S4000
G1 X83.052 Y117.493 E.00659
; LINE_WIDTH: 0.421222
G1 X82.953 Y117.714 E.00585
G1 X82.616 Y118.114 E.01265
G1 X82.171 Y118.359 E.01228
G3 X81.663 Y118.426 I-.54 J-2.152 E.01243
G1 X81.589 Y118.942 E.01261
G1 X81.344 Y119.386 E.01228
G1 X80.944 Y119.723 E.01265
; LINE_WIDTH: 0.435421
G1 X80.741 Y119.823 E.00567
; LINE_WIDTH: 0.453661
G1 X80.538 Y119.923 E.00593
G1 X81.551 Y119.954 E.02658
; LINE_WIDTH: 0.419996
G1 X83.184 Y119.954 E.03937
G1 X83.184 Y117.685 E.05473
; LINE_WIDTH: 0.436926
G1 X83.17 Y117.509 E.00444
; LINE_WIDTH: 0.470786
G1 X83.155 Y117.333 E.00482
M204 S10000
G1 X83.15 Y117.273 F42000
; LINE_WIDTH: 0.467827
G1 F12000
M204 S4000
G2 X83.161 Y115.746 I-17.572 J-.888 E.04139
; WIPE_START
G1 X83.15 Y117.273 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.798 Y118.452 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.419996
G1 F12000
M204 S4000
G1 X82.348 Y118.702 E.01243
G1 X82.011 Y118.793 E.00841
G1 X81.932 Y119.118 E.00806
G1 X81.682 Y119.569 E.01243
G1 X82.798 Y119.569 E.02693
G1 X82.798 Y118.512 E.02549
M204 S10000
G1 X82.404 Y119.096 F42000
; LINE_WIDTH: 0.494856
G1 F12000
M204 S4000
G2 X82.402 Y119.195 I-.029 J.049 E.00681
; WIPE_START
G1 X82.347 Y119.195 E-.18392
G1 X82.318 Y119.146 E-.19203
G1 X82.347 Y119.096 E-.19203
G1 X82.404 Y119.096 E-.19202
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.329 Y119.931 Z6.36 F42000
G1 Z5.96
G1 E.8 F1800
; LINE_WIDTH: 0.467887
G1 F12000
M204 S4000
G2 X80.443 Y119.923 I.462 J-12.787 E.0302
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F12000
G1 X79.329 Y119.931 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/38
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
M106 S99.45
; OBJECT_ID: 300
M204 S10000
G17
G3 Z6.36 I-.059 J1.216 P1  F42000
G1 X104.821 Y121.171 Z6.36
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X104.821 Y111.591 E.23102
G1 X114.401 Y111.591 E.23102
G1 X114.401 Y113.557 E.0474
G1 X114.401 Y121.171 E.18362
G1 X110.608 Y121.171 E.09148
; LINE_WIDTH: 0.451006
G1 X110.019 Y121.156 E.01534
; LINE_WIDTH: 0.49278
G1 X109.836 Y121.135 E.00527
; LINE_WIDTH: 0.534553
G1 X109.654 Y121.114 E.00575
; LINE_WIDTH: 0.576326
G2 X109.313 Y121.113 I-.173 J.704 E.01165
; LINE_WIDTH: 0.537244
G1 X109.155 Y121.132 E.005
; LINE_WIDTH: 0.498161
G1 X108.998 Y121.152 E.00461
; LINE_WIDTH: 0.459079
G1 X108.84 Y121.171 E.00422
; LINE_WIDTH: 0.457784
G1 X108.681 Y121.152 E.00424
; LINE_WIDTH: 0.495571
G1 X108.522 Y121.133 E.00462
; LINE_WIDTH: 0.533359
G1 X108.363 Y121.115 E.005
; LINE_WIDTH: 0.571146
G2 X108.037 Y121.112 I-.168 J.734 E.01103
; LINE_WIDTH: 0.537683
G1 X107.87 Y121.129 E.00528
; LINE_WIDTH: 0.50422
G1 X107.703 Y121.146 E.00493
; LINE_WIDTH: 0.470756
G1 X107.019 Y121.156 E.01866
; LINE_WIDTH: 0.49278
G1 X106.836 Y121.135 E.00527
; LINE_WIDTH: 0.534553
G1 X106.654 Y121.114 E.00575
; LINE_WIDTH: 0.576326
G2 X106.324 Y121.113 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X106.177 Y121.132 E.00467
; LINE_WIDTH: 0.498161
G1 X106.03 Y121.152 E.0043
; LINE_WIDTH: 0.459079
G1 X105.882 Y121.171 E.00394
; LINE_WIDTH: 0.419996
G1 X104.881 Y121.171 E.02415
; WIPE_START
M204 S4000
G1 X104.869 Y119.171 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.656 Y117.336 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X107.424 Y117.336 E.02971
G1 X107.291 Y117.283 E.00345
G1 X107.231 Y117.143 E.00367
G1 X107.231 Y115.619 E.03675
G1 X107.306 Y115.467 E.0041
G1 X107.424 Y115.426 E.003
G1 X108.656 Y115.426 E.02971
G1 X108.656 Y114.194 E.02971
G1 X108.696 Y114.077 E.003
G1 X108.849 Y114.001 E.0041
G1 X110.373 Y114.001 E.03675
G1 X110.526 Y114.077 E.0041
G1 X110.566 Y114.194 E.003
G1 X110.566 Y115.426 E.02971
G1 X111.798 Y115.426 E.02971
G1 X111.916 Y115.467 E.003
G1 X111.991 Y115.619 E.0041
G1 X111.991 Y117.143 E.03675
G1 X111.916 Y117.296 E.0041
G1 X111.798 Y117.336 E.003
G1 X110.566 Y117.336 E.02971
G1 X110.566 Y118.568 E.02971
G1 X110.493 Y118.719 E.00403
G1 X110.373 Y118.761 E.00307
G1 X109.703 Y118.745 E.01617
; LINE_WIDTH: 0.435366
G1 X109.369 Y118.769 E.00839
; LINE_WIDTH: 0.482496
G1 X109.036 Y118.792 E.00937
; LINE_WIDTH: 0.518621
G1 X108.9 Y118.803 E.00413
; LINE_WIDTH: 0.554746
G1 X108.764 Y118.814 E.00443
G1 X108.763 Y118.789 E.0008
; LINE_WIDTH: 0.50983
G1 X108.762 Y118.765 E.00073
; LINE_WIDTH: 0.464913
G1 X108.761 Y118.74 E.00067
; LINE_WIDTH: 0.419996
G1 X108.66 Y118.607 E.00403
G1 X108.657 Y117.396 E.0292
; WIPE_START
M204 S4000
G1 X107.424 Y117.336 E-.46885
G1 X107.291 Y117.283 E-.05434
G1 X107.231 Y117.143 E-.05782
G1 X107.231 Y116.672 E-.179
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.315 Y119.831 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X107.195 Y120.176 E.0088
; LINE_WIDTH: 0.451006
G1 X106.924 Y120.43 E.0097
; LINE_WIDTH: 0.489706
G1 X106.82 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X106.715 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X106.611 Y120.565 E.00378
G1 X106.454 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X106.296 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X106.136 Y120.265 E.00646
; LINE_WIDTH: 0.445376
G1 X105.977 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X105.908 Y119.831 E.00646
G1 X105.977 Y119.473 E.00881
G1 X106.216 Y119.197 E.0088
G1 X106.606 Y119.071 E.00987
G1 X106.974 Y119.171 E.0092
G1 X107.245 Y119.473 E.00979
G1 X107.303 Y119.772 E.00736
; WIPE_START
M204 S4000
G1 X107.195 Y120.176 E-.1589
G1 X106.924 Y120.43 E-.14141
G1 X106.82 Y120.475 E-.0431
G1 X106.715 Y120.52 E-.0431
G1 X106.611 Y120.565 E-.0431
G1 X106.454 Y120.502 E-.06441
G1 X106.296 Y120.44 E-.06441
G1 X106.136 Y120.265 E-.09002
G1 X105.977 Y120.09 E-.09002
G1 X105.962 Y120.035 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.902 Y119.798 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X108.821 Y119.798 E.00196
G1 X108.695 Y120.176 E.00961
; LINE_WIDTH: 0.451006
G1 X108.424 Y120.43 E.00969
; LINE_WIDTH: 0.489706
G1 X108.32 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X108.215 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X108.111 Y120.565 E.00378
G1 X107.954 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X107.796 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X107.636 Y120.265 E.00647
; LINE_WIDTH: 0.445376
G1 X107.477 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X107.408 Y119.731 E.00881
G1 X107.527 Y119.386 E.0088
G1 X107.803 Y119.147 E.0088
G1 X108.161 Y119.078 E.00881
G1 X108.486 Y119.179 E.00821
; LINE_WIDTH: 0.464913
G1 X108.509 Y119.169 E.00067
; LINE_WIDTH: 0.50983
G1 X108.531 Y119.159 E.00073
; LINE_WIDTH: 0.554746
G1 X108.554 Y119.149 E.0008
G1 X108.81 Y119.455 E.013
G1 X108.861 Y119.644 E.00637
G1 X108.979 Y119.339 E.01066
G1 X109.087 Y119.257 E.0044
; LINE_WIDTH: 0.518621
G1 X109.194 Y119.175 E.00409
; LINE_WIDTH: 0.482496
G1 X109.425 Y119.134 E.00659
; LINE_WIDTH: 0.435366
G1 X109.657 Y119.093 E.00589
; LINE_WIDTH: 0.419996
G1 X110.006 Y119.197 E.00879
G1 X110.245 Y119.473 E.0088
G1 X110.315 Y119.831 E.00881
G1 X110.195 Y120.176 E.0088
; LINE_WIDTH: 0.451006
G1 X109.924 Y120.43 E.0097
; LINE_WIDTH: 0.489706
G1 X109.82 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X109.715 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X109.611 Y120.565 E.00378
G1 X109.454 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X109.296 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X109.136 Y120.265 E.00647
; LINE_WIDTH: 0.445376
G1 X108.977 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X108.917 Y119.856 E.00582
; WIPE_START
M204 S4000
G1 X108.821 Y119.798 E-.04268
G1 X108.695 Y120.176 E-.15138
G1 X108.424 Y120.43 E-.1414
G1 X108.32 Y120.475 E-.0431
G1 X108.215 Y120.52 E-.0431
G1 X108.111 Y120.565 E-.0431
G1 X107.954 Y120.502 E-.06441
G1 X107.796 Y120.44 E-.06441
G1 X107.636 Y120.265 E-.09003
G1 X107.501 Y120.116 E-.0764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.52
G1 X0 Y116.381 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.52 F4000
            G39.3 S1
            G0 Z6.52 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X113.758 Y120.959 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X114.189 Y120.528 E.01469
G1 X114.189 Y119.983
G1 X113.213 Y120.959 E.03329
G1 X112.667 Y120.959
G1 X114.189 Y119.438 E.05189
G1 X114.189 Y118.892
G1 X112.122 Y120.959 E.07049
G1 X111.577 Y120.959
G1 X114.189 Y118.347 E.08909
G1 X114.189 Y117.801
G1 X111.031 Y120.959 E.10769
G1 X110.486 Y120.959
G1 X114.189 Y117.256 E.12629
G1 X114.189 Y116.711
G1 X109.986 Y120.914 E.14335
G1 X110.523 Y119.831
G1 X114.189 Y116.165 E.12502
G1 X114.189 Y115.62
G1 X110.432 Y119.377 E.12813
G1 X110.778 Y118.485
G1 X111.721 Y117.543 E.03215
G1 X111.172 Y117.546
G1 X110.778 Y117.94 E.01344
; WIPE_START
M204 S4000
G1 X111.172 Y117.546 E-.21184
G1 X111.721 Y117.543 E-.20844
G1 X111.089 Y118.175 E-.33973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.198 Y117.066 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X114.189 Y115.074 E.06791
G1 X114.189 Y114.529
G1 X112.2 Y116.518 E.06784
G1 X112.202 Y115.971
M73 P96 R0
G1 X114.189 Y113.984 E.06777
G1 X114.189 Y113.438
G1 X112.165 Y115.462 E.06903
G1 X111.861 Y115.221
G1 X114.189 Y112.893 E.07939
G1 X114.189 Y112.347
G1 X111.319 Y115.218 E.09789
G1 X110.778 Y115.213
G1 X114.188 Y111.803 E.11628
G1 X113.642 Y111.803
G1 X110.778 Y114.668 E.09768
G1 X110.769 Y114.131
G1 X113.097 Y111.803 E.0794
G1 X112.551 Y111.803
G1 X110.528 Y113.827 E.06901
G1 X110.02 Y113.789
G1 X112.006 Y111.803 E.06773
G1 X111.461 Y111.803
G1 X109.475 Y113.789 E.06773
G1 X108.929 Y113.789
G1 X110.915 Y111.803 E.06773
; WIPE_START
M204 S4000
G1 X109.501 Y113.218 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.447 Y114.817 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X108.047 Y115.217 E.01362
G1 X107.499 Y115.22
G1 X108.45 Y114.269 E.03243
; WIPE_START
M204 S4000
G1 X107.499 Y115.22 E-.51108
G1 X108.047 Y115.217 E-.20844
G1 X108.123 Y115.141 E-.04048
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.444 Y118.092 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X107.323 Y119.214 E.03825
G1 X107.026 Y118.965
G1 X108.443 Y117.548 E.04831
G1 X107.9 Y117.546
G1 X106.583 Y118.863 E.04492
; WIPE_START
M204 S4000
G1 X107.9 Y117.546 E-.70788
G1 X108.037 Y117.546 E-.05212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X106.048 Y120.488 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X105.577 Y120.959 E.01607
G1 X105.033 Y120.958
G1 X105.795 Y120.196 E.02599
G1 X105.699 Y119.746
G1 X105.033 Y120.412 E.02271
G1 X105.033 Y119.867
G1 X107.358 Y117.543 E.07927
G1 X107.058 Y117.297
G1 X105.033 Y119.322 E.06904
G1 X105.033 Y118.776
G1 X107.019 Y116.79 E.06773
G1 X107.019 Y116.245
G1 X105.033 Y118.231 E.06773
G1 X105.033 Y117.685
G1 X107.019 Y115.699 E.06773
; WIPE_START
M204 S4000
G1 X105.605 Y117.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.033 Y117.14 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X110.37 Y111.803 E.182
G1 X109.824 Y111.803
G1 X105.033 Y116.594 E.1634
G1 X105.033 Y116.049
G1 X109.279 Y111.803 E.1448
G1 X108.734 Y111.803
G1 X105.033 Y115.504 E.1262
G1 X105.033 Y114.958
G1 X108.188 Y111.803 E.1076
G1 X107.643 Y111.803
G1 X105.033 Y114.413 E.08899
G1 X105.033 Y113.867
G1 X107.097 Y111.803 E.07039
G1 X106.552 Y111.803
G1 X105.033 Y113.322 E.05179
G1 X105.033 Y112.777
G1 X106.007 Y111.803 E.03319
G1 X105.461 Y111.803
G1 X105.033 Y112.231 E.01459
; WIPE_START
M204 S4000
G1 X105.461 Y111.803 E-.22994
G1 X106.007 Y111.803 E-.20725
G1 X105.406 Y112.404 E-.32281
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.402 Y119.771 Z6.52 F42000
G1 X107.615 Y120.557 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X107.227 Y120.946 E.01325
; WIPE_START
M204 S4000
G1 X107.615 Y120.557 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X109.184 Y120.624 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X108.852 Y120.957 E.01133
; WIPE_START
M204 S4000
G1 X109.184 Y120.624 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X112.045 Y117.464 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.095733
G1 F15000
M204 S4000
G1 X111.967 Y117.518 E.00036
; LINE_WIDTH: 0.130493
G3 X111.868 Y117.583 I-.355 J-.433 E.00072
; LINE_WIDTH: 0.15941
G1 X111.792 Y117.614 E.00064
M204 S10000
G1 X112.294 Y117.162 F42000
; LINE_WIDTH: 0.0869006
G1 F15000
M204 S4000
G3 X112.096 Y117.409 I-1.408 J-.926 E.00104
M204 S10000
G1 X112.27 Y117.137 F42000
; LINE_WIDTH: 0.153546
G1 F15000
M204 S4000
G3 X112.148 Y117.388 I-1.651 J-.645 E.00208
; WIPE_START
G1 X112.27 Y117.137 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.838 Y113.698 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.0888456
G1 F15000
M204 S4000
G2 X108.566 Y113.911 I.779 J1.273 E.00118
M204 S10000
G1 X108.938 Y113.798 F42000
; LINE_WIDTH: 0.121653
G1 F15000
M204 S4000
G1 X108.722 Y113.724 E.00125
M204 S10000
G1 X108.53 Y113.942 F42000
; LINE_WIDTH: 0.096268
G1 F15000
M204 S4000
G1 X108.475 Y114.023 E.00038
; LINE_WIDTH: 0.13216
G2 X108.408 Y114.125 I.445 J.365 E.00075
; LINE_WIDTH: 0.160587
G1 X108.378 Y114.197 E.00062
; WIPE_START
G1 X108.408 Y114.125 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.427 Y115.148 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.158125
G1 F15000
M204 S4000
G2 X107.333 Y115.19 I.161 J.489 E.0008
; LINE_WIDTH: 0.127558
G1 X107.252 Y115.245 E.00057
; LINE_WIDTH: 0.0962597
G1 X107.172 Y115.301 E.00038
M204 S10000
G1 X106.954 Y115.492 F42000
; LINE_WIDTH: 0.121686
G1 F15000
M204 S4000
G1 X107.028 Y115.708 E.00124
M204 S10000
G1 X107.141 Y115.336 F42000
; LINE_WIDTH: 0.0888472
G1 F15000
M204 S4000
G2 X106.928 Y115.608 I1.055 J1.047 E.00118
; WIPE_START
G1 X107.141 Y115.336 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X105.638 Y119.535 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.112235
G1 F15000
M204 S4000
G1 X105.71 Y119.757 E.00113
; WIPE_START
G1 X105.638 Y119.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X108.96 Y120.38 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.315234
G1 F15000
M204 S4000
G3 X108.61 Y120.714 I-2.552 J-2.331 E.00851
; LINE_WIDTH: 0.354711
G1 X108.556 Y120.787 E.00181
; LINE_WIDTH: 0.340697
G1 X108.607 Y120.832 E.00131
; LINE_WIDTH: 0.299663
G1 X108.658 Y120.877 E.00113
; LINE_WIDTH: 0.258629
G1 X108.709 Y120.923 E.00096
; LINE_WIDTH: 0.217595
G1 X108.76 Y120.968 E.00078
; WIPE_START
G1 X108.709 Y120.923 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.426 Y120.347 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.22288
G1 F15000
M204 S4000
G3 X107.014 Y120.733 I-2.888 J-2.668 E.00666
; LINE_WIDTH: 0.269484
G1 X106.965 Y120.791 E.00112
; LINE_WIDTH: 0.264642
G1 X106.999 Y120.829 E.00073
; LINE_WIDTH: 0.200174
G2 X107.18 Y120.961 I.339 J-.274 E.00235
; WIPE_START
G1 X106.999 Y120.829 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X99.401 Y121.171 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X93.84 Y121.171 E.13411
; LINE_WIDTH: 0.457784
G1 X93.681 Y121.152 E.00424
; LINE_WIDTH: 0.495571
G1 X93.522 Y121.133 E.00462
; LINE_WIDTH: 0.533359
G1 X93.363 Y121.115 E.005
; LINE_WIDTH: 0.571146
G2 X93.037 Y121.112 I-.168 J.734 E.01103
; LINE_WIDTH: 0.537683
G1 X92.87 Y121.129 E.00528
; LINE_WIDTH: 0.50422
G1 X92.703 Y121.146 E.00493
; LINE_WIDTH: 0.470756
G1 X92.019 Y121.156 E.01866
; LINE_WIDTH: 0.49278
G1 X91.836 Y121.135 E.00527
; LINE_WIDTH: 0.534553
G1 X91.654 Y121.114 E.00575
; LINE_WIDTH: 0.576326
G2 X91.324 Y121.113 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X91.177 Y121.132 E.00467
; LINE_WIDTH: 0.498161
G1 X91.03 Y121.152 E.0043
; LINE_WIDTH: 0.459079
G1 X90.882 Y121.171 E.00394
; LINE_WIDTH: 0.419996
G1 X89.821 Y121.171 E.02559
G1 X89.821 Y111.591 E.23102
G1 X99.401 Y111.591 E.23102
G1 X99.401 Y113.568 E.04766
G1 X99.401 Y121.111 E.18191
; WIPE_START
M204 S4000
G1 X97.401 Y121.133 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X95.541 Y117.311 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X95.541 Y118.568 E.03032
G1 X95.501 Y118.685 E.00298
G1 X95.348 Y118.761 E.00413
G1 X93.874 Y118.761 E.03554
G1 X93.723 Y118.687 E.00406
G1 X93.681 Y118.568 E.00304
G1 X93.681 Y117.311 E.03032
G1 X92.424 Y117.311 E.03032
G1 X92.293 Y117.259 E.00341
G1 X92.231 Y117.118 E.0037
G1 X92.231 Y115.644 E.03554
G1 X92.307 Y115.491 E.00413
G1 X92.424 Y115.451 E.00298
G1 X93.681 Y115.451 E.03032
G1 X93.681 Y114.194 E.03032
G1 X93.721 Y114.077 E.00298
G1 X93.874 Y114.001 E.00413
G1 X95.348 Y114.001 E.03554
G1 X95.501 Y114.077 E.00413
G1 X95.541 Y114.194 E.00298
G1 X95.541 Y115.451 E.03032
G1 X96.798 Y115.451 E.03032
G1 X96.915 Y115.491 E.00298
G1 X96.991 Y115.644 E.00413
G1 X96.991 Y117.118 E.03554
G1 X96.915 Y117.272 E.00413
G1 X96.798 Y117.311 E.00298
G1 X95.601 Y117.311 E.02887
; WIPE_START
M204 S4000
G1 X95.541 Y118.568 E-.47827
G1 X95.501 Y118.685 E-.04688
G1 X95.348 Y118.761 E-.06503
G1 X94.901 Y118.761 E-.16982
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.815 Y119.831 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X93.695 Y120.176 E.0088
; LINE_WIDTH: 0.451006
G1 X93.424 Y120.43 E.0097
; LINE_WIDTH: 0.489706
G1 X93.32 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X93.215 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X93.111 Y120.565 E.00378
G1 X92.954 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X92.796 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X92.636 Y120.265 E.00646
; LINE_WIDTH: 0.445376
G1 X92.477 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X92.408 Y119.731 E.00881
G1 X92.527 Y119.386 E.0088
G1 X92.803 Y119.147 E.0088
G1 X93.161 Y119.078 E.00881
G1 X93.506 Y119.197 E.0088
G1 X93.745 Y119.473 E.0088
G1 X93.803 Y119.772 E.00736
; WIPE_START
M204 S4000
G1 X93.695 Y120.176 E-.1589
G1 X93.424 Y120.43 E-.14141
G1 X93.32 Y120.475 E-.0431
G1 X93.215 Y120.52 E-.0431
G1 X93.111 Y120.565 E-.0431
G1 X92.954 Y120.502 E-.06441
G1 X92.796 Y120.44 E-.06441
G1 X92.636 Y120.265 E-.09002
G1 X92.477 Y120.09 E-.09002
G1 X92.466 Y120.034 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.315 Y119.831 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X92.195 Y120.176 E.0088
; LINE_WIDTH: 0.451006
G1 X91.924 Y120.43 E.0097
; LINE_WIDTH: 0.489706
G1 X91.82 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X91.715 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X91.611 Y120.565 E.00378
G1 X91.454 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X91.296 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X91.136 Y120.265 E.00646
; LINE_WIDTH: 0.445376
G1 X90.977 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X90.908 Y119.831 E.00646
G1 X90.977 Y119.473 E.00881
G1 X91.216 Y119.197 E.0088
G1 X91.606 Y119.071 E.00988
G1 X91.973 Y119.171 E.00918
G1 X92.245 Y119.473 E.00981
G1 X92.303 Y119.772 E.00736
; WIPE_START
M204 S4000
G1 X92.195 Y120.176 E-.1589
G1 X91.924 Y120.43 E-.14141
G1 X91.82 Y120.475 E-.0431
G1 X91.715 Y120.52 E-.0431
G1 X91.611 Y120.565 E-.0431
G1 X91.454 Y120.502 E-.06441
G1 X91.296 Y120.44 E-.06441
G1 X91.136 Y120.265 E-.09002
G1 X90.977 Y120.09 E-.09002
G1 X90.962 Y120.035 E-.02152
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X98.592 Y120.241 Z6.52 F42000
G1 X99.189 Y120.257 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X98.487 Y120.959 E.02394
G1 X97.942 Y120.959
G1 X99.189 Y119.712 E.04255
G1 X99.189 Y119.166
G1 X97.396 Y120.959 E.06115
G1 X96.851 Y120.959
G1 X99.189 Y118.621 E.07975
G1 X99.189 Y118.075
G1 X96.305 Y120.959 E.09835
G1 X95.76 Y120.959
G1 X99.189 Y117.53 E.11695
G1 X99.189 Y116.985
G1 X95.215 Y120.959 E.13555
G1 X94.669 Y120.959
G1 X99.189 Y116.439 E.15415
G1 X99.189 Y115.894
G1 X94.124 Y120.959 E.17275
G1 X93.601 Y120.936
G1 X99.189 Y115.348 E.19056
G1 X99.189 Y114.803
G1 X97.203 Y116.789 E.06773
G1 X97.203 Y116.244
G1 X99.189 Y114.258 E.06773
G1 X99.189 Y113.712
G1 X97.203 Y115.698 E.06773
G1 X97.037 Y115.319
G1 X99.189 Y113.167 E.07339
G1 X99.189 Y112.621
G1 X96.567 Y115.244 E.08943
G1 X96.024 Y115.241
M73 P97 R0
G1 X99.189 Y112.076 E.10794
G1 X98.916 Y111.803
G1 X95.751 Y114.968 E.10793
G1 X95.749 Y114.426
G1 X98.371 Y111.803 E.08943
G1 X97.825 Y111.803
G1 X95.674 Y113.955 E.07339
G1 X95.294 Y113.789
G1 X97.28 Y111.803 E.06773
G1 X96.735 Y111.803
G1 X94.749 Y113.789 E.06773
G1 X94.203 Y113.789
G1 X96.189 Y111.803 E.06773
; WIPE_START
M204 S4000
G1 X94.775 Y113.218 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.473 Y117.519 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X95.749 Y118.243 E.02468
G1 X95.023 Y118.969
G1 X93.986 Y120.006 E.03538
G1 X93.967 Y119.48
G1 X94.476 Y118.971 E.01735
G1 X93.473 Y118.337
G1 X92.91 Y118.9 E.01921
G1 X92.183 Y119.082
G1 X93.471 Y117.794 E.04392
G1 X93.199 Y117.521
G1 X91.813 Y118.906 E.04725
G1 X91.213 Y118.962
G1 X92.658 Y117.516 E.0493
; WIPE_START
M204 S4000
G1 X91.244 Y118.93 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.749 Y115.243 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X93.469 Y114.523 E.02455
; WIPE_START
M204 S4000
G1 X92.749 Y115.243 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.851 Y120.959 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X91.186 Y120.625 E.01141
G1 X90.912 Y120.353
G1 X90.306 Y120.959 E.02068
G1 X90.033 Y120.686
G1 X90.735 Y119.985 E.02394
G1 X90.791 Y119.383
G1 X90.033 Y120.141 E.02586
G1 X90.033 Y119.596
G1 X92.187 Y117.442 E.07346
G1 X92.025 Y117.059
G1 X90.033 Y119.05 E.06791
G1 X90.033 Y118.505
G1 X92.023 Y116.515 E.06784
G1 X92.02 Y115.972
G1 X90.033 Y117.959 E.06777
G1 X90.033 Y117.414
G1 X95.644 Y111.803 E.19135
G1 X95.098 Y111.803
G1 X90.033 Y116.869 E.17274
G1 X90.033 Y116.323
G1 X94.553 Y111.803 E.15414
G1 X94.008 Y111.803
G1 X90.033 Y115.778 E.13554
G1 X90.033 Y115.232
G1 X93.462 Y111.803 E.11694
G1 X92.917 Y111.803
G1 X90.033 Y114.687 E.09834
G1 X90.033 Y114.142
G1 X92.371 Y111.803 E.07974
G1 X91.826 Y111.803
G1 X90.033 Y113.596 E.06114
G1 X90.033 Y113.051
G1 X91.281 Y111.803 E.04254
G1 X90.735 Y111.803
G1 X90.033 Y112.505 E.02394
; WIPE_START
M204 S4000
G1 X90.735 Y111.803 E-.37724
G1 X91.281 Y111.803 E-.20725
G1 X90.954 Y112.13 E-.17551
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.333 Y119.637 Z6.52 F42000
G1 X92.477 Y120.424 Z6.52
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X91.987 Y120.914 E.01673
M204 S10000
G1 X91.86 Y120.739 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0814363
G1 F15000
M204 S4000
G1 X91.833 Y120.761 E.0001
; LINE_WIDTH: 0.0963416
G1 X91.822 Y120.787 E.00011
; LINE_WIDTH: 0.135828
G1 X91.811 Y120.813 E.00018
G1 X91.946 Y120.902 E.00102
; WIPE_START
G1 X91.811 Y120.813 E-.64761
G1 X91.822 Y120.787 E-.11239
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.15 Y118.899 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.207702
G1 F15000
M204 S4000
G2 X90.729 Y119.32 I1.341 J1.762 E.00648
; WIPE_START
G1 X90.831 Y119.19 E-.20988
G1 X91.02 Y119.001 E-.34023
G1 X91.15 Y118.899 E-.20988
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.052 Y120.072 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.184463
G1 F15000
M204 S4000
G3 X93.992 Y120.174 I-.789 J-.393 E.00112
; LINE_WIDTH: 0.160181
G1 X93.931 Y120.254 E.00079
; LINE_WIDTH: 0.132775
G1 X93.869 Y120.334 E.00062
G3 X93.418 Y120.752 I-3.921 J-3.784 E.00379
; LINE_WIDTH: 0.182936
G1 X93.38 Y120.803 E.00059
G1 X93.528 Y120.948 E.00193
; WIPE_START
G1 X93.38 Y120.803 E-.58209
G1 X93.418 Y120.752 E-.17791
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.793 Y121.107 Z6.52 F42000
G1 X84.401 Y121.171 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.419996
G1 F3600
M204 S2000
G1 X77.608 Y121.171 E.16383
; LINE_WIDTH: 0.451006
G1 X77.019 Y121.156 E.01534
; LINE_WIDTH: 0.49278
G1 X76.836 Y121.135 E.00527
; LINE_WIDTH: 0.534553
G1 X76.654 Y121.114 E.00575
; LINE_WIDTH: 0.576326
G2 X76.324 Y121.113 I-.168 J.657 E.01129
; LINE_WIDTH: 0.537244
G1 X76.177 Y121.132 E.00467
; LINE_WIDTH: 0.498161
G1 X76.03 Y121.152 E.0043
; LINE_WIDTH: 0.459079
G1 X75.882 Y121.171 E.00394
; LINE_WIDTH: 0.419996
G1 X74.821 Y121.171 E.02559
G1 X74.821 Y111.591 E.23102
G1 X84.401 Y111.591 E.23102
G1 X84.401 Y113.578 E.04792
G1 X84.401 Y121.111 E.18166
; WIPE_START
M204 S4000
G1 X82.401 Y121.129 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.516 Y117.286 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X80.516 Y118.568 E.03092
G1 X80.477 Y118.684 E.00295
G1 X80.323 Y118.761 E.00415
G1 X78.899 Y118.761 E.03434
G1 X78.751 Y118.692 E.00394
G1 X78.706 Y118.568 E.00317
G1 X78.706 Y117.286 E.03092
G1 X77.424 Y117.286 E.03092
G1 X77.294 Y117.235 E.00338
G1 X77.231 Y117.093 E.00374
G1 X77.231 Y115.669 E.03434
G1 X77.308 Y115.515 E.00415
G1 X77.424 Y115.476 E.00295
G1 X78.706 Y115.476 E.03092
G1 X78.706 Y114.194 E.03092
G1 X78.745 Y114.078 E.00295
G1 X78.899 Y114.001 E.00415
G1 X80.323 Y114.001 E.03434
G1 X80.477 Y114.078 E.00415
G1 X80.516 Y114.194 E.00295
G1 X80.516 Y115.476 E.03092
G1 X81.798 Y115.476 E.03092
G1 X81.914 Y115.515 E.00295
G1 X81.991 Y115.669 E.00415
G1 X81.991 Y117.093 E.03434
G1 X81.914 Y117.247 E.00415
G1 X81.798 Y117.286 E.00295
G1 X80.576 Y117.286 E.02947
; WIPE_START
M204 S4000
G1 X80.516 Y118.568 E-.48776
G1 X80.477 Y118.684 E-.0465
G1 X80.323 Y118.761 E-.06539
G1 X79.901 Y118.761 E-.16035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.245 Y119.473 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F3600
M204 S2000
G1 X77.315 Y119.831 E.00881
G1 X77.195 Y120.176 E.0088
; LINE_WIDTH: 0.451006
G1 X76.924 Y120.43 E.0097
; LINE_WIDTH: 0.489706
G1 X76.82 Y120.475 E.00323
; LINE_WIDTH: 0.528406
G1 X76.715 Y120.52 E.0035
; LINE_WIDTH: 0.567106
G1 X76.611 Y120.565 E.00378
G1 X76.454 Y120.502 E.00565
; LINE_WIDTH: 0.518931
G1 X76.296 Y120.44 E.00514
; LINE_WIDTH: 0.470756
G1 X76.136 Y120.265 E.00646
; LINE_WIDTH: 0.445376
G1 X75.977 Y120.09 E.00609
; LINE_WIDTH: 0.419996
G1 X75.908 Y119.831 E.00646
G1 X75.977 Y119.473 E.00881
G1 X76.216 Y119.197 E.0088
G1 X76.606 Y119.071 E.00988
G1 X76.989 Y119.182 E.00961
G1 X77.206 Y119.428 E.00791
; WIPE_START
M204 S4000
G1 X77.315 Y119.831 E-.15883
G1 X77.195 Y120.176 E-.13874
G1 X76.924 Y120.43 E-.14141
G1 X76.82 Y120.475 E-.0431
G1 X76.715 Y120.52 E-.0431
G1 X76.611 Y120.565 E-.0431
G1 X76.454 Y120.502 E-.06441
G1 X76.296 Y120.44 E-.06441
G1 X76.185 Y120.318 E-.06289
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.761 Y120.959 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F9000
M204 S2000
G1 X84.189 Y120.531 E.0146
G1 X84.189 Y119.986
G1 X83.216 Y120.959 E.0332
G1 X82.67 Y120.959
G1 X84.189 Y119.44 E.0518
G1 X84.189 Y118.895
G1 X82.125 Y120.959 E.0704
G1 X81.579 Y120.959
G1 X84.189 Y118.35 E.089
G1 X84.189 Y117.804
G1 X81.034 Y120.959 E.1076
G1 X80.489 Y120.959
G1 X84.189 Y117.259 E.1262
G1 X84.189 Y116.713
G1 X79.943 Y120.959 E.1448
G1 X79.398 Y120.959
G1 X84.189 Y116.168 E.1634
G1 X84.189 Y115.622
G1 X78.852 Y120.959 E.182
G1 X78.307 Y120.959
G1 X80.298 Y118.968 E.06792
G1 X79.751 Y118.97
G1 X77.762 Y120.959 E.06784
G1 X77.227 Y120.948
G1 X79.203 Y118.972 E.0674
G1 X78.71 Y118.92
G1 X77.404 Y120.225 E.04451
G1 X77.493 Y119.591
G1 X78.5 Y118.585 E.03432
G1 X78.497 Y118.042
G1 X77.318 Y119.221 E.0402
G1 X77.028 Y118.966
G1 X78.494 Y117.499 E.05002
G1 X77.955 Y117.494
G1 X76.586 Y118.862 E.04667
; WIPE_START
M204 S4000
G1 X77.955 Y117.494 E-.73542
G1 X78.019 Y117.494 E-.02458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.05 Y120.489 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X75.58 Y120.959 E.01602
G1 X75.034 Y120.959
G1 X75.796 Y120.198 E.02598
G1 X75.695 Y119.753
G1 X75.033 Y120.415 E.02256
G1 X75.033 Y119.87
G1 X77.414 Y117.489 E.08118
G1 X77.07 Y117.287
G1 X75.033 Y119.324 E.06947
G1 X75.033 Y118.779
G1 X77.024 Y116.788 E.06788
G1 X77.021 Y116.245
G1 X75.033 Y118.233 E.06781
G1 X75.033 Y117.688
G1 X77.019 Y115.702 E.06774
; WIPE_START
M204 S4000
G1 X75.605 Y117.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.494 Y114.772 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X78 Y115.267 E.01686
G1 X77.452 Y115.27
G1 X78.494 Y114.227 E.03556
; WIPE_START
M204 S4000
G1 X77.452 Y115.27 E-.56027
G1 X77.977 Y115.267 E-.19973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.773 Y117.493 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X80.723 Y118.543 E.03582
G1 X80.725 Y117.995
G1 X81.225 Y117.496 E.01704
G1 X82.203 Y117.063
G1 X84.189 Y115.077 E.06773
G1 X84.189 Y114.532
G1 X82.203 Y116.518 E.06773
G1 X82.203 Y115.972
G1 X84.189 Y113.986 E.06773
G1 X84.189 Y113.441
G1 X82.154 Y115.476 E.06941
G1 X81.815 Y115.27
G1 X84.189 Y112.895 E.08097
G1 X84.189 Y112.35
G1 X81.272 Y115.267 E.09948
G1 X80.729 Y115.264
G1 X84.189 Y111.805 E.11799
G1 X83.645 Y111.803
G1 X80.725 Y114.723 E.09957
G1 X80.723 Y114.18
G1 X83.1 Y111.803 E.08106
G1 X82.554 Y111.803
G1 X80.518 Y113.84 E.06945
G1 X80.023 Y113.789
G1 X82.009 Y111.803 E.06773
G1 X81.463 Y111.803
G1 X79.477 Y113.789 E.06773
G1 X78.932 Y113.789
G1 X80.918 Y111.803 E.06773
G1 X80.372 Y111.803
G1 X75.033 Y117.143 E.18209
G1 X75.033 Y116.597
G1 X79.827 Y111.803 E.16349
G1 X79.282 Y111.803
G1 X75.033 Y116.052 E.14489
G1 X75.033 Y115.506
G1 X78.736 Y111.803 E.12629
G1 X78.191 Y111.803
G1 X75.033 Y114.961 E.10769
G1 X75.033 Y114.416
G1 X77.645 Y111.803 E.08909
G1 X77.1 Y111.803
G1 X75.033 Y113.87 E.07049
G1 X75.033 Y113.325
G1 X76.555 Y111.803 E.05189
G1 X76.009 Y111.803
G1 X75.033 Y112.779 E.03328
G1 X75.033 Y112.234
G1 X75.464 Y111.803 E.01468
; WIPE_START
M204 S4000
G1 X75.033 Y112.234 E-.23139
G1 X75.033 Y112.779 E-.20726
G1 X75.631 Y112.181 E-.32136
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.669 Y116.851 Z6.52 F42000
G1 X82.229 Y117.283 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106249
G1 F15000
M204 S4000
G2 X82.046 Y117.437 I.493 J.771 E.00108
; LINE_WIDTH: 0.128413
G1 X81.978 Y117.484 E.00048
; LINE_WIDTH: 0.147802
G1 X81.909 Y117.53 E.00058
G3 X81.773 Y117.492 I.128 J-.734 E.00101
; WIPE_START
G1 X81.909 Y117.53 E-.48085
G1 X81.978 Y117.484 E-.27915
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.848 Y113.706 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.123349
G1 F15000
M204 S4000
G2 X78.475 Y114.058 I.677 J1.088 E.00288
; LINE_WIDTH: 0.167915
G2 X78.424 Y114.157 I.598 J.373 E.00093
; WIPE_START
G1 X78.475 Y114.058 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.452 Y115.27 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.142812
M73 P98 R0
G1 F15000
M204 S4000
G2 X77.315 Y115.232 I-.266 J.695 E.00096
; LINE_WIDTH: 0.158179
G1 X77.246 Y115.279 E.00065
; LINE_WIDTH: 0.121165
G2 X76.936 Y115.618 I.723 J.974 E.00251
; WIPE_START
G1 X77.05 Y115.46 E-.32058
G1 X77.164 Y115.337 E-.27413
G1 X77.246 Y115.279 E-.16529
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.722 Y118.543 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.141133
G1 F15000
M204 S4000
G3 X80.76 Y118.68 I-.698 J.265 E.00095
; LINE_WIDTH: 0.159301
G1 X80.713 Y118.748 E.00064
; LINE_WIDTH: 0.122424
G3 X80.386 Y119.055 I-1.042 J-.784 E.00249
; WIPE_START
G1 X80.656 Y118.829 E-.5921
G1 X80.713 Y118.748 E-.1679
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.392 Y120.213 Z6.52 F42000
G1 Z6.12
G1 E.8 F1800
; LINE_WIDTH: 0.223323
G1 F15000
M204 S4000
G1 X77.41 Y120.362 E.00177
G3 X77.013 Y120.734 I-3.712 J-3.557 E.00644
; LINE_WIDTH: 0.270763
G1 X76.966 Y120.791 E.0011
; LINE_WIDTH: 0.264433
G1 X77 Y120.83 E.00074
; LINE_WIDTH: 0.198362
G2 X77.182 Y120.963 I.336 J-.267 E.00234
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X77 Y120.83 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.52 I1.217 J0 P1  F42000
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
G1 Z6.52 F900 ; lower z a little
G1 X0 Y116.381 F18000 ; move to safe pos
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

    G1 Z106.12 F600
    G1 Z104.12

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

