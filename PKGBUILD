pkgname=octoprint-tornado
pkgver=20200111
pkgrel=5
pkgdesc="control my tornado installation"
arch=(armv6h armv7h aarch64)
depends=(haproxy octoprint-venv)
source=(
	tmpfiles.conf
	sysusers.conf
	haproxy.cfg
	octoprint-proxy.service
	octoprint-web.service
	octoprint-webcam.service
)

sha256sums=('7a8c2f7dba7e491a81d373748943bd01720fb6b43adc471b49e540890c62bdfe'
            'f79c9f07462e1cc875db00d8a79b271d394c2088b5a89c52f94f469cbe5fdae7'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            'e6562a0aba61172fcef3615320c881a3c7a2022b5f86ce43fd2de1f576533c6b'
            '5b9dbc7aba988974367e272d9a9f1701472c10ef4c316121e2d821405fc1d3da'
            'd4bc1deb83adc19b493d339e5b17452732855db1680a640c74857014df2171e9')

install=$pkgname.install

package() {
	install -Dm644 haproxy.cfg $pkgdir/usr/lib/$pkgname/haproxy.cfg
	for SERVICE in *.service
	do
		install -Dm644 $SERVICE $pkgdir/usr/lib/systemd/system/$SERVICE
	done
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/mjpg-streamer.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}


