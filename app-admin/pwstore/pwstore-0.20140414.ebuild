# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit ruby-single

COMMIT="38745c9f91034d64aa182c1b3b20cb7ffb006f3e"

DESCRIPTION="Stores passwords in a set of encrypted files"
HOMEPAGE="http://github.com/formorer/pwstore"
SRC_URI="https://github.com/formorer/pwstore/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

IUSE=""

S="${WORKDIR}/${PN}-${COMMIT}"

RDEPEND="app-crypt/gnupg ${RUBY_DEPS}"
DEPEND=""

src_install() {
	dodoc README.asciidoc TODO
	dobin pws
}
