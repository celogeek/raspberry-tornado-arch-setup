pkgname=octoprint-tornado
pkgver=20200111
pkgrel=3
pkgdesc="control my tornado installation"
arch=(armv6h armv7h aarch64)
depends=(haproxy octoprint-venv)
source=(
	haproxy.cfg
	octoprint-proxy.service
	octoprint-web.service
	tmpfiles.conf
)
sha256sums=(
	47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763
	e6562a0aba61172fcef3615320c881a3c7a2022b5f86ce43fd2de1f576533c6b
	5b9dbc7aba988974367e272d9a9f1701472c10ef4c316121e2d821405fc1d3da
	7a8c2f7dba7e491a81d373748943bd01720fb6b43adc471b49e540890c62bdfe
)
install=$pkgname.install

package() {
	install -Dm644 haproxy.cfg $pkgdir/usr/lib/$pkgname/haproxy.cfg
	for SERVICE in *.service
	do
		install -Dm644 $SERVICE $pkgdir/usr/lib/systemd/system/$SERVICE
	done
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}


