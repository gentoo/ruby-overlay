# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.9.7.4.ebuild,v 1.2 2012/01/28 07:56:27 graaff Exp $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry is a powerful alternative to the standard IRB shell for Ruby."
HOMEPAGE="https://github.com/pry/pry/wiki"
IUSE=""
SLOT="0"

LICENSE="MIT"
KEYWORDS="~amd64"

ruby_add_rdepend ">=dev-ruby/ruby_parser-2.0.5
	>=dev-ruby/coderay-1.0.5
	>=dev-ruby/slop-2.4.4:0
	>=dev-ruby/method_source-0.7.1-r1"

ruby_add_bdepend "test? ( >=dev-ruby/bacon-1.1 >=dev-ruby/open4-1.3 )"

all_ruby_prepare() {
	# Make version dependencies more lenient to avoid problems with
	# compatible upgrades.
	sed -i \
		-e '/coderay/s:~>:>=:'        \
		-e '/slop/s:~> 2.4.4:>= 2.4:' \
		-e '/method_source/s:~>:>=:'  \
		${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} -S bacon -Itest -a || die
}
