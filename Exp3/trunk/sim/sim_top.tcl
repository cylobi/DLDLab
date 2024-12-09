	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"TransmiterTB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"1 us"
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/topModule.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Datanum_shr.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/DatanumCnt.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/DataTrans_cnt.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/SSD.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/counter.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Mux_4_to_1.v
	# vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Onepulser_controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/PortNumCnt.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/PortNumShReg.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/SSD.v

	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
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
	