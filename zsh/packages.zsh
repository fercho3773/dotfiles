# xbps helper
# To do:
# 1. Add more distros (pacman,dnf,apt,etc)
# 2. Declare this packages as variables
# install_cmd
# remove_cmd
# preview_cmd
# update_cmd
# list_cmd
# pkg_manager
# 3. Improve every function

die() {
    echo "Error: $1" >&2
    exit 1
}

#if [ -x apt ]; then
#  install_cmd="apt get install"
#  remove_cmd="apt remove"
#elif [ -x dnf]; then
#  dnf remove
#elif [ -x pacman]; then
#  pacman -Syyu
#elif [ -x xbps]; then
#  xbps-install
#  xbps-remove
#  xbps-query
#else
#  echo ""
#  echo "Package manager is not supported (apt,dnf,pacman or xbps) :(" 
#  die
#fi

# list manually installed
pal() { 
  xpkg -m | column
}

# hold a package
pam() { 
  xbps-pkgdb -m $@
}
# package cleanup
pac() {
  echo "xbps-remove -yo && xbps-remove -OO && vkpurge rm all" 
  xbps-remove -yo && xbps-remove -OO && vkpurge rm all ; 
}

# package information
#paq() { [ -n "$1" ] && xbps-query -RS $@ ; } #query
paq() {
  if [ -z "$1" ]; then 
    clear 
    echo ""
    echo "View package information (xbps-query -R)"
    PACKAGE="$(xpkg | fzf --multi --query="$1" --preview="xbps-query -RS {}")"
    [ -n "$PACKAGE" ] && xbps-query -RS $PACKAGE
  else
    echo "View package information (xbps-query -RS)"
    echo ""
    xbps-query -RS "$1"
  fi
}

# pkg number
pan() {
  echo "Number of packages installed: (xpkg | wc -l)"
  xpkg | wc -l
}

# update
pau() { 
  echo "Update (xbps-install -Suy)"
  xbps-install -Suy
}

# remove
par() {
  if [ -z "$1" ]; then 
    clear
    echo ""
    echo "Removing a package (xbps-remove -Ry)"
    PACKAGE="$(xpkg | fzf --multi --query="$*" --preview="xbps-query -RS {}")"
    [ -n "$PACKAGE" ] && xbps-remove -Ry $PACKAGE
  else
    clear
    echo  ""
    echo  "Removing a package (xbps-query -Ry $@)"
    xbps-remove -Ry "$@"
  fi
}

# find or install
paf() {
  if [ -z "$1" ]; then
    clear 
    echo  ""
    echo  "Find package to install (xbps-install -Sy)"
    PACKAGE="$(xpkg -a | fzf --multi --query="$*" --preview="xbps-query -RS {}")"
    [ -n "$PACKAGE" ] && xbps-install -Sy $PACKAGE
  else
    clear
    echo  ""
    echo  "Installing a package (xbps-query -Sy $@)"
    xbps-install -Sy "$@"
  fi
}
