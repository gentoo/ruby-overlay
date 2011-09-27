# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/commons-lang/commons-lang-2.6.ebuild,v 1.5 2011/07/17 20:21:38 halcy0n Exp $

EAPI=4
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Service Platform Core API (Companion Code)"
HOMEPAGE="http://www.osgi.org/Specifications/HomePage"
SRC_URI="http://www.osgi.org/download/r4v43/osgi.core.jar"
IUSE=""

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/OSGI-OPT"

JAVA_SRC_DIR="src"

src_unpack() {
	default

	rm -rf ${WORKDIR}/org || die
}
