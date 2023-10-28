{

services.udev = {
  enable = true;
  extraRules =  ''

ACTION=="change", \
SUBSYSTEM=="power_supply", \
ATTR{status}=="Discharging", \
ATTR{capacity}=="[0-9]", \
RUN+="~/.bin/discharge \"$env{POWER_SUPPLY_NAME}\" \"$attr{capacity}\""
  '';
  };

}
