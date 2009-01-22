# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator eutils autotools

EAPI="2"

MY_PV=$(replace_version_separator 3 '-')
S="${WORKDIR}/${PN}-${MY_PV}/source"

DESCRIPTION="Ruby Enterprise Edition is a branch of Ruby including various enhancements"
HOMEPAGE="http://www.rubyenterpriseedition.com/"
SRC_URI="mirror://rubyforge/emm-ruby/${PN}-${MY_PV}.tar.gz"

LICENSE="|| ( Ruby GPL-2 )"
SLOT="18"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/openssl
	>=app-admin/eselect-ruby-20081211"
RDEPEND=""
PDEPEND="dev-ruby/rubygems-ee"

src_unpack() {
	unpack "${A}"

	cd "${S}"

	epatch "${FILESDIR}/libdir.patch"
	epatch "${FILESDIR}/mkconfig.patch"
	epatch "${FILESDIR}/openssl.patch"
	eautoreconf
}

src_configure() {
	cd "${S}"
	econf --program-suffix="ee"
}

src_install() {
	export RUBYOPT=""

	cd "${S}"
	emake DESTDIR="${D}" install 
}

pkg_postinst() {
	ewarn
	ewarn "Warning! Do NOT use for production environments"
	ewarn "This is a work-in-progress ebuild"
	ewarn
	ewarn "Especially when it comes to RubyGems with binaries,"
	ewarn "this version can show unexpected behaviour (crashes!)"
	ewarn
}
