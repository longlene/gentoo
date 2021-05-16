# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999
#hackport: flags: -allow-unsafe-gc,-apicheck,-export-dynamic,-lua501,-lua502,-lua_32bits,-system-lua,-pkg-config

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Bindings to Lua, an embeddable scripting language"
HOMEPAGE="https://hslua.github.io/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="hardcode-reg-keys"

RDEPEND=">=dev-haskell/base-compat-0.10:=[profile?]
	>=dev-haskell/exceptions-0.8:=[profile?] <dev-haskell/exceptions-0.11:=[profile?]
	>=dev-haskell/mtl-2.2:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/text-1.0:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/quickcheck-2.7
		>=dev-haskell/quickcheck-instances-0.3
		>=dev-haskell/tasty-0.11
		>=dev-haskell/tasty-hunit-0.9
		>=dev-haskell/tasty-quickcheck-0.8 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-allow-unsafe-gc \
		--flag=-apicheck \
		--flag=-export-dynamic \
		$(cabal_flag hardcode-reg-keys hardcode-reg-keys) \
		--flag=-lua501 \
		--flag=-lua502 \
		--flag=-lua_32bits \
		--flag=-pkg-config \
		--flag=-system-lua
}
