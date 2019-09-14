# set -gx GDK_BACKEND wayland
# set -gx CLUTTER_BACKEND wayland
# set -gx QT_QPA_PLATFORM wayland-egl
set -gx GTK_THEME "Arc-Darker"
set -gx MOZ_ENABLE_WAYLAND 1

if test (tty) = "/dev/tty1"
  exec sway 2>&1 >> $HOME/sway.log
end
