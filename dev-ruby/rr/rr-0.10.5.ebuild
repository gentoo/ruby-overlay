# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/syntax/syntax-1.0.0-r1.ebuild,v 1.2 2009/12/23 12:28:51 flameeyes Exp $

EAPI=2

USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.rdoc"

inherit ruby-fakegem

DESCRIPTION="A double framework that features a rich selection of double techniques and a terse syntax"
HOMEPAGE="http://pivotallabs.com/"
SRC_URI="http://github.com/btakita/${PN}/tarball/v${PV} -> ${P}.tar.gz"

S="${WORKDIR}/btakita-${PN}-32c343a"

LICENSE="as-is" # actually no license information provided :(
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend test "dev-ruby/rspec dev-ruby/session"
