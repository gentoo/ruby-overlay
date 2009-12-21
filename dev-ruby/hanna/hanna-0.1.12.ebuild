# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/haml/haml-2.2.15.ebuild,v 1.1 2009/12/08 06:50:56 graaff Exp $

EAPI=2

USE_RUBY="ruby18 ruby19 jruby"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="RDoc implemented in Haml, making its source clean and maintainable"
HOMEPAGE="http://github.com/mislav/hanna"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend '>=dev-ruby/rdoc-2.3.0'

all_ruby_prepare() {
	# Kill the stupid killswitch on rdoc fixed dependency
	cp "${FILESDIR}"/gentoo-version.rb "${S}"/lib/hanna/version.rb
}
