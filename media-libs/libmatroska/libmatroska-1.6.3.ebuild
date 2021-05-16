# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Extensible multimedia container format based on EBML"
HOMEPAGE="https://www.matroska.org/ https://github.com/Matroska-Org/libmatroska/"
SRC_URI="https://dl.matroska.org/downloads/${PN}/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0/7" # subslot = soname major version
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-linux"

RDEPEND=">=dev-libs/libebml-1.4.2:="
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=( -DBUILD_SHARED_LIBS=YES )
	cmake_src_configure
}
