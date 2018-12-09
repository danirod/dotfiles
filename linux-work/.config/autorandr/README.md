# Profiles

* casa-* => profiles for home (i.e. HDMI2 EDID is my home screen)
* oficina-* => profiles for work (i.e. HDMI2 EDID is my work screen)
* single => profiles for no HDMI screen attached.

* -left => the internal display of the laptop is on the left.
* -close => the lid of the laptop is down.

## Additional scripts

Most -left and -close profiles have a block script file to detect whether
the lid is up or down. I still have to figure out if Linux offers a better
way to detect when the lid goes up and down.

The idea is that the -left blockscripts only succeed if the lid is up,
and the -close blockscripts only succeed if the lid is down, so that
autorandr can choose a profile depending on the state of the lid (as well
as the EDID of the display that is currently connected to the HDMI port).
