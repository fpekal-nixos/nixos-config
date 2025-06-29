{ config, pkgs, ... }:
{
	services.phpfpm.pools.nginx = {
    user = "nginx";
		settings = {
			pm = "dynamic";
			"listen.owner" = config.services.nginx.user;
			"pm.max_children" = 5;
			"pm.start_servers" = 2;
			"pm.min_spare_servers" = 1;
			"pm.max_spare_servers" = 3;
			"pm.max_requests" = 500;
		};
	};
	services.nginx = {
		enable = true;
		clientMaxBodySize = "512m";

		virtualHosts = {
      "everest.stream" = {
				default = true;
				addSSL = true;
				enableACME = true;
				root = "/srv/www/html";

				locations = {
					"/" = {
						extraConfig = ''
							add_header 'Cross-Origin-Embedder-Policy' 'require-corp';
							add_header 'Cross-Origin-Opener-Policy' 'same-origin';
						'';
					};
					"~ \\.php"  = {
						index = "index.php";
						extraConfig = ''
						include ${config.services.nginx.package}/conf/fastcgi_params;
						autoindex off;

						# regex to split $uri to $fastcgi_script_name and $fastcgi_path
						fastcgi_split_path_info ^(.+?\.php)(/.*)$;

						# Check that the PHP script exists before passing it
						# try_files $fastcgi_script_name =404;

						# Bypass the fact that try_files resets $fastcgi_path_info
						# see: http://trac.nginx.org/nginx/ticket/321
						set $path_info $fastcgi_path_info;
						fastcgi_param PATH_INFO $path_info;

						fastcgi_index index.php;
						fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;
						include ${pkgs.nginx}/conf/fastcgi.conf;

						fastcgi_pass unix:${config.services.phpfpm.pools.nginx.socket};
						fastcgi_param PHP_VALUE "upload_max_filesize=512M \n post_max_size=512M";
						'';
					};
				};
			};




			"kebab.everest.stream" = {
				addSSL = true;
				enableACME = true;
				root = "/srv/www/html/kebab";

				locations = {
					"/" = {
						index = "index.php";
						extraConfig = ''
							# First attempt to serve request as file, then
							# as directory, then fall back to displaying a 404.
																												
							# try_files $uri $uri/ =404;		
							# autoindex on;
							# autoindex off;
							try_files $uri $uri/ =404;
						'';
					};
					"~ \\.php"  = {
						index = "index.php";
						extraConfig = ''
						include ${config.services.nginx.package}/conf/fastcgi_params;
						autoindex off;

						# regex to split $uri to $fastcgi_script_name and $fastcgi_path
						fastcgi_split_path_info ^(.+?\.php)(/.*)$;

						# Check that the PHP script exists before passing it
						# try_files $fastcgi_script_name =404;

						# Bypass the fact that try_files resets $fastcgi_path_info
						# see: http://trac.nginx.org/nginx/ticket/321
						set $path_info $fastcgi_path_info;
						fastcgi_param PATH_INFO $path_info;

						fastcgi_index index.php;
						fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;
						include ${pkgs.nginx}/conf/fastcgi.conf;

						fastcgi_pass unix:${config.services.phpfpm.pools.nginx.socket};
						fastcgi_param PHP_VALUE "upload_max_filesize=512M \n post_max_size=512M";
						'';
					};
				};
			};





      "streambase.everest.stream" = {
				addSSL = true;
				enableACME = true;
				root = "/srv/www/html/filip/streambase";
			};
			"media.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "https://localhost:32400";
				};
			};
			"cohouse.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "http://localhost:1234";
				};
			};
			"test.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "https://localhost:47990";
				};
			};
			"launchpad.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "http://localhost:${toString config.services.launchpad.port}";
				};
			};
			"ai.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "http://localhost:9000";
				};
			};
			"sync.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "http://localhost:8384";
				};
			};
			"picochat.everest.stream" = {
				addSSL = true;
				enableACME = true;
				locations = {
					"/".proxyPass = "http://10.0.0.4:5002";
				};
			};

			"everest.goose-manta.ts.net" = {
				locations = {
					"/".proxyPass = "http://localhost:9091";
				};
			};
		};
	};

	security.acme = {
		acceptTerms = true;
		defaults.email = "proxy154d@gmail.com";
	};
}
