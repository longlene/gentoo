# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PHP_EXT_NAME="lzf"
PHP_EXT_PECL_PKG="LZF"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
USE_PHP="php7-3 php7-4 php8-0"

inherit php-ext-pecl-r3

KEYWORDS="~amd64 ~x86"

DESCRIPTION="This package handles LZF de/compression"
LICENSE="PHP-3"
SLOT="0"
IUSE=""
