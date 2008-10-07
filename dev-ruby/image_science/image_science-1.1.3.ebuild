# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems

DESCRIPTION="A clean and happy Ruby library that generates thumbnails"
HOMEPAGE="http://seattlerb.rubyforge.org/ImageScience.html"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/freeimage
	dev-ruby/ruby-inline"

USE_RUBY="ruby18 ruby19"
