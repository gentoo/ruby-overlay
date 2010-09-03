# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="rdoc"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A scripting framework that replaces rake and sake"
HOMEPAGE="http://yehudakatz.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

all_ruby_prepare() {
	# Fixed upstream, to be removed on next version bump.
	echo ${PV} > VERSION || die "Failed to add missing VERSION file"
	mkdir spec/fixtures/doc/components || die
	touch spec/fixtures/doc/components/.empty_directory || die
}

all_ruby_compile() {
	ruby -Ilib -S bin/thor rdoc || die "Failed to create documentation"
}

each_ruby_test() {
	${RUBY} -Ilib -S bin/thor spec || die "Failed to run specs"
}
