# set -gx GDK_BACKEND wayland
# set -gx CLUTTER_BACKEND wayland
# set -gx QT_QPA_PLATFORM wayland-egl
set -gx GTK_THEME "Arc-Darker"

if test (tty) = "/dev/tty1"
  exec sway
end
