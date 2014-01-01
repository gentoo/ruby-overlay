# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rake/rake-0.9.6.ebuild,v 1.5 2013/09/05 15:46:18 jer Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.rdoc TODO"

RUBY_FAKEGEM_TASK_TEST=""

inherit bash-completion-r1 ruby-fakegem

DESCRIPTION="Make-like scripting in Ruby"
HOMEPAGE="http://rake.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="${DEPEND} app-arch/gzip"
RDEPEND="${RDEPEND}"

#This fix is already on upstream and will be fixed on next release
#https://github.com/jimweirich/rake/commit/514da2cec2ef3ca821c444f6b7b24f51bdd6e5d4
RUBY_PATCHES=( "${P}-ruby-1.8-fix.patch" )

ruby_add_bdepend "doc? ( dev-ruby/rdoc )
	test? ( virtual/ruby-minitest )"

all_ruby_prepare() {
	# Decompress the file. The compressed version has errors, ignore them.
	zcat doc/rake.1.gz > doc/rake.1
}

each_ruby_prepare() {
	case ${RUBY} in
		*jruby)
			# Remove failing test. This works on jruby 1.7, is a
			# known bug on 1.6 and also fails on rake-0.9.6.
			sed -i -e '/test_signal_propagation_in_tests/,/^  end/ s:^:#:' test/test_rake_functional.rb || die
			;;
	esac
}

all_ruby_compile() {
	if use doc; then
		ruby -Ilib bin/rake rdoc || die "doc generation failed"
	fi
}

each_ruby_test() {
	${RUBY} -Ilib bin/rake || die
}

all_ruby_install() {
	ruby_fakegem_binwrapper rake

	if use doc; then
		pushd html
		dohtml -r *
		popd
	fi

	doman doc/rake.1

	newbashcomp "${FILESDIR}"/rake.bash-completion ${PN}
}
