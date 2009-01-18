# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit ruby ruby-gnome2 eutils

DESCRIPTION="Ruby Glib2 bindings"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""
USE_RUBY="ruby18"
RDEPEND=">=dev-libs/glib-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

# Hotfix for ruby19 as default symlink
src_compile() {
	ruby() { /usr/bin/ruby18 "$@" ; }

	ruby-gnome2_src_compile
}
