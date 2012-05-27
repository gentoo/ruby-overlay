# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_TASK_DOC="docs"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt Manifest.txt README.txt Hoe.pdf"

RUBY_FAKEGEM_EXTRAINSTALL="template"

inherit ruby-fakegem

DESCRIPTION="Hoe extends rake to provide full project automation."
HOMEPAGE="http://seattlerb.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/rdoc )"

ruby_add_bdepend "test? ( dev-ruby/rdoc dev-ruby/minitest )"

ruby_add_rdepend ">=dev-ruby/rake-0.8"
