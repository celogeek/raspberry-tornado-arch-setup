pkgname=octoprint-tornado
pkgver=20200111
pkgrel=7
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
            'e297c44df2a0787dac8c42850cd31b447752f53f45aac2aad0efea6b9872e308'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            'e6562a0aba61172fcef3615320c881a3c7a2022b5f86ce43fd2de1f576533c6b'
            '5b9dbc7aba988974367e272d9a9f1701472c10ef4c316121e2d821405fc1d3da'
            '5159287dc4fcadba54f501aed56c73374648ccfdb4553b532fa75fd0b24fcb3b')

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


