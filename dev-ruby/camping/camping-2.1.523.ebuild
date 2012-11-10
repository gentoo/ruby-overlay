# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
#jruby -> need rack-test to support jruby
USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG COPYING README.md"

inherit ruby-fakegem

DESCRIPTION="Minature rails for stay-at-home moms"
HOMEPAGE="http://camping.io/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

ruby_add_bdepend "test? ( dev-ruby/rake dev-ruby/rack-test )"

ruby_add_rdepend ">=dev-ruby/rack-1.0 dev-ruby/mab"

each_ruby_test() {
	${RUBY} -S testrb test/app_*.rb || die
}
