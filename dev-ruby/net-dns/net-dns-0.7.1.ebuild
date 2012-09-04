# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

USE_RUBY="ruby18 ruby19 jruby ree18"

RUBY_FAKEGEM_TASK_DOC="yardoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.rdoc THANKS.rdoc"

inherit ruby-fakegem

DESCRIPTION="Net::DNS is a pure Ruby DNS library, with a clean OO interface and an extensible API"
HOMEPAGE="http://github.com/bluemonk/net-dns"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rake dev-ruby/yard )"
