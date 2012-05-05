# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="Search tool for GNOME 3"
HOMEPAGE="https://live.gnome.org/GnomeUtils"

LICENSE="GPL-2 FDL-1.1"
SLOT="0"
IUSE=""
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux"
fi

COMMON_DEPEND="dev-libs/atk
	>=dev-libs/glib-2.30.0:2
	gnome-base/gconf:2
	sys-apps/grep
	x11-libs/gdk-pixbuf
	>=x11-libs/gtk+-3.0.0:3
	x11-libs/libICE
	x11-libs/libSM"
RDEPEND="${COMMON_DEPEND}
	sys-apps/findutils
	|| ( sys-apps/mlocate sys-freebsd/freebsd-ubin )
	!<gnome-extra/gnome-utils-3.4"
# ${PN} was part of gnome-utils before 3.4
DEPEND="${COMMON_DEPEND}
	app-text/gnome-doc-utils
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.17
	virtual/pkgconfig"

# xml doesn't validate with LINGUAS=ja
RESTRICT="test"

pkg_setup() {
	DOCS="AUTHORS NEWS"
	G2CONF="${G2CONF} --disable-schemas-compile"
}
