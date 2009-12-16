# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/will_paginate/will_paginate-2.3.11-r1.ebuild,v 1.2 2009/12/15 19:59:15 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18 ruby19 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="Pure ruby scoped configuration files"
HOMEPAGE="http://github.com/ahoward/configuration/tree/master"

# We hope, I've contacted upstream on this matter
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
