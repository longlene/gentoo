# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="HTTP client package with conduit interface and HTTPS support"
HOMEPAGE="https://www.yesodweb.com/book/http-conduit"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # needs network

RDEPEND=">=dev-haskell/aeson-0.8:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	>=dev-haskell/conduit-1.2:=[profile?]
	>=dev-haskell/conduit-extra-1.1:=[profile?]
	>=dev-haskell/http-client-0.5.13:=[profile?] <dev-haskell/http-client-0.7:=[profile?]
	>=dev-haskell/http-client-tls-0.3:=[profile?] <dev-haskell/http-client-tls-0.4:=[profile?]
	>=dev-haskell/http-types-0.7:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/resourcet-1.1:=[profile?]
	dev-haskell/unliftio-core:=[profile?]
	>=dev-haskell/void-0.5.5:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/blaze-builder
		dev-haskell/case-insensitive
		>=dev-haskell/connection-0.2
		dev-haskell/cookie
		dev-haskell/data-default-class
		>=dev-haskell/hspec-1.3
		dev-haskell/hunit
		dev-haskell/network
		dev-haskell/streaming-commons
		dev-haskell/temporary
		dev-haskell/text
		dev-haskell/unliftio
		dev-haskell/utf8-string
		>=dev-haskell/wai-3.0 <dev-haskell/wai-3.3
		dev-haskell/wai-conduit
		>=dev-haskell/warp-3.0.0.2 <dev-haskell/warp-3.4
		dev-haskell/warp-tls )
"
