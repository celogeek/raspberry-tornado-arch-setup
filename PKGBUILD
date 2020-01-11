pkgname=octoprint-tornado
pkgver=20200111
pkgrel=19
pkgdesc="control my tornado installation"
arch=(any)
depends=(haproxy octoprint-venv mjpg-streamer-git)
source=(
	tmpfiles.conf
	sysusers.conf
	haproxy.cfg
	proxy.service
	web.service
	webcam.service
	klipper.service
	udev.rules
)

sha256sums=('a9e47a2bea34ab898cf38c6694ff4ed28cfc753411bdeee1344da3dadb52caa8'
            '8587e15036027c09df5da3d27b0250621d30b1960d176ae31edf25004466d4e9'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            '76a5b44c380db9d6f0935fd1aaaafb9e8c0bcc279ecbcd2d788f6296f6637591'
            'e676dc064412b72df8bcaa3ca360257b33b499232939a22b4d5e6775be30df92'
            'ca024a69ef997893f86ec20903bc3682ddd1f3144e610164678d452a47be007e'
            '73f07e0c1f16b4a261ea18cdb6e751f485ac6dbb245b873dd21ed23b4aa6d599'
            'b0e25a7ab1365e7c860b85de3348bd668c5e25695d9d4edcae26885caa76e2b4')

install=$pkgname.install

package() {
	install -Dm644 haproxy.cfg $pkgdir/usr/lib/$pkgname/haproxy.cfg
	for SERVICE in *.service
	do
		install -Dm644 "$SERVICE" "$pkgdir/usr/lib/systemd/system/${pkgname}-${SERVICE}"
	done
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/mjpg-streamer.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/$pkgname.rules"
}


