# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/will_paginate/will_paginate-2.3.11-r1.ebuild,v 1.2 2009/12/15 19:59:15 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

RUBY_FAKEGEM_TASK_DOC="doc:rdoc"
# tests fail right now because they require files that are not in the
# distribution, contacted upstream about it.
RUBY_FAKEGEM_TASK_TEST=""

RAKE_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README HISTORY"

inherit ruby-fakegem

DESCRIPTION="Helper class for launching cross-platform applications."
HOMEPAGE="http://copiousfreetime.rubyforge.org/launchy/"

# The LICENSE file contains a 3-clause BSD license; the README file
# contains a standard as-is license; need to clear this up with the
# author I guess.
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend dev-ruby/configuration
