
#OS
NAME=$(uname -v | cut -d "-" -f 2 | cut -d " " -f 1)
VERSION=$(uname -v | cut -d "~" -f 2 | cut -d "-" -f 1)
T=$(uname -v | cut -d "-" -f 2 | cut -d " " -f 2)
echo "OS:" $NAME $VERSION $T $(uname -m)

#Kernel
echo "Kernel:" $(uname -r)

#Uptime
echo "Uptime:"$(uptime -p | cut -d "p" -f 2)

#Packages
echo "Packages:" $(dpkg -l | grep -c $)

#Shell
echo "Shell:" $(cat /proc/$$/cmdline | cut -d "." -f 1)

#Resolution
echo "Resolution:" $(xdpyinfo | grep "dimensions" | cut -d " " -f 7)

#Desktop Environment
echo "Desktop Environment:" $(printenv | grep XDG_CURRENT_DESKTOP | cut -d "=" -f 2)

#Window Manager
echo "Window Manager:" $(systemctl status display-manager | grep "Main PID" | cut -d "(" -f 2 | cut -d ")" -f 1)

#Theme
echo "Theme:" $(gsettings get org.gnome.desktop.interface gtk-theme | cut -d "'" -f 2)

#Icons
echo "Icons:" $(gsettings get org.gnome.desktop.interface icon-theme | cut -d "'" -f 2)

#CPU
echo "CPU:"$(cat /proc/cpuinfo | grep "model name" | cut -d ":" -f 2)

#GPU
echo "GPU:"$(lspci | grep VGA | cut -d ":" -f 3)

#Memory
USED=$(free -h | cut -d " " -f 20)
TOTAL=$(free -h | cut -d " " -f 12)
echo "Memory:" $USED / $TOTAL


