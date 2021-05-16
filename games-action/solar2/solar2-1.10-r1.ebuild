# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop gnome2-utils wrapper

GAMEBALL="${PN}-linux-${PV}.tar.gz"
ICONFILE="https://dev.gentoo.org/~chewi/distfiles/${PN}.png"
DESCRIPTION="An open-world, sandbox game set in an infinite abstract universe"
HOMEPAGE="http://murudai.com/solar/"
SRC_URI="${GAMEBALL} ${ICONFILE}"
S="${WORKDIR}"/Solar2

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="bundled-libs"

RESTRICT="bindist fetch splitdebug"

MYGAMEDIR=opt/${PN}
QA_PREBUILT="
	${MYGAMEDIR#/}/lib/*
	${MYGAMEDIR#/}/Solar2.bin.x86
"

# TODO: - unbundle libmono for 64bit
#       - unbundling libSDL_mixer breaks the game
#       - provide icon
#       - test useflags for libsdl on x86
RDEPEND="
	virtual/opengl
	amd64? (
		>=media-libs/flac-1.2.1-r5[abi_x86_32(-)]
		>=media-libs/libsdl-1.2.15-r4[X,sound,video,joystick,abi_x86_32(-)]
		>=media-libs/libvorbis-1.3.3-r1[abi_x86_32(-)]
		>=virtual/opengl-7.0-r1[abi_x86_32(-)]
		!bundled-libs? (
			>=media-libs/libmad-0.15.1b-r8[abi_x86_32(-)]
			>=media-libs/openal-1.15.1[abi_x86_32(-)]
			>=media-libs/sdl-mixer-1.2.12-r4[flac,mikmod,mad,mp3,vorbis,abi_x86_32(-)]
			>=media-libs/libmikmod-3.2.0[abi_x86_32(-)]
		)
	)
	x86? (
		media-libs/flac
		media-libs/libsdl[X,sound,video,joystick]
		media-libs/libvorbis
		!bundled-libs? (
			dev-lang/mono
			media-libs/libmad
			media-libs/libmikmod
			media-libs/openal
			media-libs/sdl-mixer[flac,mikmod,mad,mp3,vorbis]
		)
	)"

pkg_nofetch() {
	einfo "Please buy and download ${GAMEBALL} from:"
	einfo "  ${HOMEPAGE}"
	einfo "Also download ${ICONFILE}"
	einfo "and move both to your distfiles directory. The Humble Bundle download"
	einfo "may have a timestamp appended to the filename."
}

src_prepare() {
	default

	# remove unused files
	rm solar2.sh || die

	if ! use bundled-libs ; then
		einfo "Removing bundled libs..."
		if use amd64 ; then
			# no mono 32bit libs on amd64 yet
			rm -v lib/libmad.so* lib/libmikmod.so* lib/libopenal.so* || die
		else
			rm -v lib/libmad.so* lib/libmikmod.so* lib/libopenal.so* lib/libmono-2.0.so* || die
		fi
	fi
}

src_install() {
	insinto ${MYGAMEDIR}
	doins -r *

	make_wrapper ${PN} "./Solar2.bin.x86" "${MYGAMEDIR}"
	make_desktop_entry ${PN}
	doicon -s 64 "${DISTDIR}"/${PN}.png

	fperms +x ${MYGAMEDIR}/Solar2.bin.x86
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
