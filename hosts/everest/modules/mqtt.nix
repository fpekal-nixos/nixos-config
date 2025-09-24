{
  services.mosquitto = {
    enable = true;
    logType = [ "all" ];
    listeners = [
      {
        users = {
          ibujak = {
            password = "zaq1@WSX";
            acl = [
              "readwrite notification"
              "readwrite #"
            ];
          };

        };

        acl = [
          "pattern readwrite #"
          "topic readwrite notification"
        ];
      }
    ];
  };
}
