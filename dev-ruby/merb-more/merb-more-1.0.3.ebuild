# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems
USE_RUBY="ruby18"

DESCRIPTION="Full stack of Merb, a lightweight, fast Ruby MVC framework"
HOMEPAGE="http://merbivore.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
	>=dev-ruby/merb-core-${PV}
	>=dev-ruby/merb-action-args-${PV}
	>=dev-ruby/merb-assets-${PV}
	>=dev-ruby/merb-slices-${PV}
	>=dev-ruby/merb-auth-${PV}
	>=dev-ruby/merb-cache-${PV}
	>=dev-ruby/merb-exceptions-${PV}
	>=dev-ruby/merb-gen-${PV}
	>=dev-ruby/merb-haml-${PV}
	>=dev-ruby/merb-helpers-${PV}
	>=dev-ruby/merb-param-protection-${PV}
	>=dev-ruby/merb-mailer-${PV}
	>=dev-ruby/merb_datamapper-${PV}"
