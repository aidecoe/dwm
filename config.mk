# dwm version
VERSION = 6.0-patched

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# Xinerama
XINERAMA_LIBS = -lXinerama
XINERAMA_CPPFLAGS = -DXINERAMA

# Xft
XFT_INCS = -I/usr/include/freetype2
XFT_LIBS = -lXft

# includes and libs
INCS = -I. ${XFT_INCS}
LIBS = -lX11 ${XINERAMA_LIBS} ${XFT_LIBS}

ifeq (${HOSTNAME},ittemni)
HOST_ID := 1
else ifeq (${HOSTNAME},freja)
HOST_ID = 2
else
HOST_ID := 0
endif

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" ${XINERAMA_CPPFLAGS} -DHOST_ID=$(HOST_ID)
#CFLAGS = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS = -std=c99 -pedantic -Wall -O3 -march=native ${INCS} ${CPPFLAGS}
#LDFLAGS = -g ${LIBS}
LDFLAGS = -s ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc
