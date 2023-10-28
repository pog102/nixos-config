{

services.udev = {
  enable = true;
  extraRules =  ''

ACTION=="change", \
SUBSYSTEM=="power_supply", \
ATTR{status}=="Discharging", \
ATTR{capacity}=="[0-9]", \
RUN+=\"${pkgs.dunst}/bin/dunstify \"WARNING LOW BATTERY\"\n"
  '';
  };

}
