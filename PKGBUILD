pkgname=octoprint-tornado
pkgver=20200111
pkgrel=11
pkgdesc="control my tornado installation"
arch=(any)
depends=(haproxy octoprint-venv mjpg-streamer-git)
source=(
	tmpfiles.conf
	sysusers.conf
	haproxy.cfg
	octoprint-proxy.service
	octoprint-web.service
	octoprint-webcam.service
	octoprint-klipper.service
)

sha256sums=('92a69198ae6c6207f41ae01812c6a4b9a84bb9a0932421be60c0058d245389f2'
            '872fc25ccd5b3b3f4aa3b8b316d32cbd17ab6be6a3bb5ff47aff16dbc8a71608'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            'e6562a0aba61172fcef3615320c881a3c7a2022b5f86ce43fd2de1f576533c6b'
            '01661fd788379435ae311729422283b8abeea58e2cd69478c975c608d8fbcd91'
            '5159287dc4fcadba54f501aed56c73374648ccfdb4553b532fa75fd0b24fcb3b'
            '3246342ea0cc07ac2a580c222efd9310f13c05663fa55165a9ae82721385dae6')

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


