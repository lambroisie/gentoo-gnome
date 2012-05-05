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

DESCRIPTION="Font viewer for GNOME 3"
HOMEPAGE="https://live.gnome.org/GnomeUtils"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux"
fi

COMMON_DEPEND=">=dev-libs/glib-2.31.0:2
	media-libs/freetype:2
	x11-libs/cairo
	>=x11-libs/gtk+-3.0.3:3
	x11-libs/pango"
RDEPEND="${COMMON_DEPEND}
	!<gnome-extra/gnome-utils-3.4"
# ${PN} was part of gnome-utils before 3.4
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.17
	virtual/pkgconfig"

pkg_setup() {
	DOCS="NEWS"
	G2CONF="${G2CONF} --disable-schemas-compile"
}
