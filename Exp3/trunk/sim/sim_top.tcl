	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"TB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"1 us"
	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/ANDmodule.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Counter6Bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Counter8bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/DDS.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Mux_2_to_1_6bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Mux_2_to_1_8bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/NORmodule.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/PWM.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Resulator.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/SineController.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Twos_complement.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/TopModule.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Counter4Bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Counter10Bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/frq_div.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/ld_frq_div.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Message_controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Message_process.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Mux_2_to_1_1bit.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Shift_reg.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Top_frq.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/TwosComplement8Bit.v



	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v

	file copy -force $hdl_path/sine.mem ./sine.mem
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 
	