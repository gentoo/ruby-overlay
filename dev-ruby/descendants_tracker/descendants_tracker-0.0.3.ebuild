# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/github_api/github_api-0.10.2.ebuild,v 1.1 2013/12/25 13:08:09 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Module that adds descendant tracking to a class"
HOMEPAGE="https://github.com/dkubb/descendants_tracker"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_prepare() {
	# Remove dependency on devtools
	sed -i -e '/devtools\/spec_helper/d' spec/spec_helper.rb || die
	sed -i -e '/it_should_behave_like/d' \
		spec/unit/descendants_tracker/add_descendant_spec.rb || die
	sed -i -e '/it_should_behave_like/d' \
		spec/unit/descendants_tracker/descendants_spec.rb || die
}
