# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/will_paginate/will_paginate-2.3.11-r1.ebuild,v 1.2 2009/12/15 19:59:15 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby ree18"

RUBY_FAKEGEM_TASK_DOC="doc:rdoc"
RUBY_FAKEGEM_TASK_TEST="test"

RAKE_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README HISTORY"

inherit ruby-fakegem

DESCRIPTION="Helper class for launching cross-platform applications."
HOMEPAGE="http://copiousfreetime.rubyforge.org/launchy/"

LICENSE="ISC"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.2.6"

ruby_add_bdepend ">=dev-ruby/bones-3.7.0"
#ruby_add_bdepend "test? ( >=dev-ruby/rcov-0.9.9 >=dev-ruby/minitest-2.3.1 )"

# Tests fail, reported upstream. (Note for 2.0.3: can't find bug
# report. Tests still fail). Wrong tests run on wrong OS. spoon
# dependency unpackaged.
RESTRICT=test
