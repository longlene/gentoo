# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999
#hackport: flags: -devel

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="HTTP/2.0 library including frames and HPACK"
HOMEPAGE="https://github.com/kazu-yamamoto/http2"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/case-insensitive:=[profile?]
	dev-haskell/http-types:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-haskell/network-byte-order-0.1.1:=[profile?]
	dev-haskell/psqueues:=[profile?]
	dev-haskell/stm:=[profile?]
	dev-haskell/time-manager:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
	test? ( dev-haskell/aeson
		dev-haskell/aeson-pretty
		dev-haskell/base16-bytestring
		>=dev-haskell/doctest-0.9.3
		>=dev-haskell/glob-0.9
		>=dev-haskell/hspec-1.3
		dev-haskell/text
		dev-haskell/unordered-containers
		dev-haskell/vector )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-devel
}
