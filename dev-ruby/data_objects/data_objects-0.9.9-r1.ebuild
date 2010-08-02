# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/flexmock/flexmock-0.8.0.ebuild,v 1.1 2008/05/17 12:58:04 graaff Exp $

EAPI=3

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="History.txt README.txt TODO"

inherit ruby-fakegem

DESCRIPTION="The Core DataObjects class"
HOMEPAGE="http://rubyforge.org/projects/dorb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec )"

ruby_add_rdepend "
	>=dev-ruby/extlib-0.9.8
	>=dev-ruby/addressable-2.0.0"
