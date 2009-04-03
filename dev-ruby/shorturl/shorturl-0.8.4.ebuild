# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems

DESCRIPTION="A very simple library to use URL shortening services such as TinyURL or RubyURL."
HOMEPAGE="http://shorturl.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~x86-fbsd"
IUSE=""

USE_RUBY="ruby18 ruby19"
GEM_PATCHES="${FILESDIR}/${P}-19compat.patch"
