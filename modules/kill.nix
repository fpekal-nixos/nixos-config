{
  # Add a funny text when using `kill` with no arguments

  programs.bash.promptInit = ''
    		function kill() {
    			if [ $# -eq 0 ]; then
    				echo -e "\e[0;31myou need to specify whom to kill.\e[0m"
    			else
    				builtin kill "$@"
    			fi
    		}
    	'';
}
