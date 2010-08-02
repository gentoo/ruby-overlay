# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CONTRIBUTING FAQ History.txt QUICKLINKS README.txt SPECS TODO"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="An Object/Relational Mapper for Ruby"
HOMEPAGE="http://datamapper.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# Requires do_sqlite3 which we do not have packaged yet.
RESTRICT="test"

ruby_add_bdepend "doc? ( dev-ruby/hoe )"

ruby_add_rdepend "
	>=dev-ruby/data_objects-0.9.7
	>=dev-ruby/extlib-0.9.8
	>=dev-ruby/rspec-1.1.3
	>=dev-ruby/addressable-1.0.4"
