# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems versionator

MY_PV="0.8.0"
MY_PN="pg"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="A Ruby interface to PostgreSQL which supersedes the old postgres module"
HOMEPAGE="http://rubyforge.org/projects/ruby-pg"
SRC_URI="mirror://rubyforge/gems/${MY_P}.gem"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
USE_RUBY="ruby18 ruby19"

RDEPEND="virtual/postgresql-base"
DEPEND="${RDEPEND}
	>=dev-ruby/rubygems-0.9.0-r1"

