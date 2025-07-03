{	config,	options,	lib,	...	}:
{
	options	=	{
		hardware.power_saving	=	lib.mkOption	{
			type	=	lib.types.bool;
			default	=	false;
			example	=	true;
		};
	};

	config	=
		let
			cond	=	config.hardware.power_saving;
		in	{
			powerManagement.enable	=	true;

			powerManagement.scsiLinkPolicy	=
				if	cond	then
					#"med_power_with_dipm"
					"min_power"
				else
					"max_performance";

			powerManagement.cpuFreqGovernor	=
				if	cond	then
					"powersave"
				else
					"ondemand";

			hardware.nvidia.prime	=
				if	cond	then
					{
					# offload	=	{
					# 	enable	=	true;
					# 	enableOffloadCmd	=	true;
					# };
					# sync.enable = lib.mkForce false;
				}
				else
					{
					#	sync.enable	=	true;
				};

			services.xserver.videoDrivers	=
				if	cond	then
					[]
				else
					[	"nvidia"	];
		};
}
