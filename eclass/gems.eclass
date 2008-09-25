# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/gems.eclass,v 1.21 2008/02/17 08:49:19 rbrown Exp $
#
# Author: Rob Cakebread <pythonhead@gentoo.org>
# Current Maintainer: Ruby Herd <ruby@gentoo.org>
#
# The gems eclass is designed to allow easier installation of
# gems-based ruby packagess and their incorporation into
# the Gentoo Linux system.
#
# - Features:
# gems_location()	  - Set ${GEMSDIR} with gem install dir and ${GEM_SRC} with
# 						path to gem to install. Optionally takes a ruby version string, like 
#						"ruby18" as a parameter.
# gems_src_unpack()	  - Does nothing.
# gems_src_compile()  - Does nothing.
# gems_src_install()  - installs a gem into ${D} using each ruby version that is both 
# 						installed and specified in USE_RUBY.
#
# NOTE:
# See http://dev.gentoo.org/~pythonhead/ruby/gems.html for notes on using gems with portage


inherit eutils ruby

SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

IUSE="doc"

DEPEND="
	>=dev-ruby/rubygems-0.9.4
	!dev-ruby/rdoc
"
RDEPEND="${DEPEND}"

gems_location() {
	local sitelibdir
	local ruby_version
	if [[ -z "$1" ]]; then
		ruby_version="ruby"
	else
		ruby_version=$1
	fi
	sitelibdir=$(/usr/bin/${ruby_version} -r rbconfig -e 'print Config::CONFIG["sitelibdir"]')
	export GEMSDIR=${sitelibdir/site_ruby/gems}
}

gems_src_unpack() {
	true
}

gems_src_compile() {
	true
}

gems_src_install() {
	local myconf
	if use doc; then
		myconf="--rdoc --ri"
	else
		myconf="--no-rdoc --no-ri"
	fi

	# I'm not sure how many ebuilds have correctly set USE_RUBY - let's assume
	# ruby18 if they haven't, since even pure Ruby gems that have been written
	# against 1.8 can explode under 1.9.
	if [[ -z "${USE_RUBY}" ]]; then
		USE_RUBY="ruby18"
	elif [[ "${USE_RUBY}" == "any" ]]; then
		# Get the installed versions.
		USE_RUBY=`ls /usr/bin/ruby* | grep -E 'ruby1(8|9)' | sed -e 's@/usr/bin/@@g'`
	fi

	local num_ruby_slots=$(echo "${USE_RUBY}" | wc -w)

	for ruby_version in ${USE_RUBY} ; do
		# Checking that we actually have that version installed
		[[ -e /usr/bin/${ruby_version} ]] || continue

		einfo "Installing for ${ruby_version}..."
		gems_location ${ruby_version}
		dodir ${GEMSDIR}

		if [[ -z "${MY_P}" ]]; then
			[[ -z "${GEM_SRC}" ]] && GEM_SRC="${DISTDIR}/${P}"
			spec_path="${D}/${GEMSDIR}/specifications/${P}.gemspec"
		else
			[[ -z "${GEM_SRC}" ]] && GEM_SRC="${DISTDIR}/${MY_P}"
			spec_path="${D}/${GEMSDIR}/specifications/${MY_P}.gemspec"
		fi
	
		# Bug #230136 haunts us here again
		export GEM_HOME="${D}/${GEMSDIR}"
		
		/usr/bin/${ruby_version} /usr/bin/gem install ${GEM_SRC} --version ${PV} ${myconf} \
			--local --install-dir "${D}/${GEMSDIR}" || die "gem install failed"

		if [[ -d "${D}/${GEMSDIR}/bin" ]] ; then
			exeinto /usr/bin
			for exe in ${D}/${GEMSDIR}/bin/* ; do
				if [ "$num_ruby_slots" -ge 2 ] ; then
					# Ensures that the exe file gets run using the currently
					# selected version of ruby.
					sed -i -e 's@^#!/usr/bin/ruby.*$@#!/usr/bin/ruby@' "${exe}"
				fi
				doexe ${exe}
			done
		fi
	done
}

EXPORT_FUNCTIONS src_unpack src_compile src_install
