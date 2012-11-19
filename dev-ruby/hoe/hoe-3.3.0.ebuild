# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ree18 ruby19 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt Manifest.txt README.txt Hoe.pdf"

RUBY_FAKEGEM_TASK_TEST="test"

RUBY_FAKEGEM_EXTRAINSTALL="template"

inherit ruby-fakegem

DESCRIPTION="Hoe extends rake to provide full project automation."
HOMEPAGE="http://seattlerb.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest dev-ruby/rdoc )"

ruby_add_rdepend ">=dev-ruby/rake-0.8"

all_ruby_prepare() {
	#Fix issue with hoe trying to run the wrong rdoc executable.
	#https://github.com/seattlerb/hoe/issues/25
	rdoc --title seattlerb\'s ${P} Documentation -o doc --main README.txt \
		lib History.txt Manifest.txt README.txt || die
}
