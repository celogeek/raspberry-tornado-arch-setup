pkgname=octoprint-tornado
pkgver=20200111
pkgrel=24
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
	touchui.less
	sudoers
)

sha256sums=('a9e47a2bea34ab898cf38c6694ff4ed28cfc753411bdeee1344da3dadb52caa8'
            '8587e15036027c09df5da3d27b0250621d30b1960d176ae31edf25004466d4e9'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            '76a5b44c380db9d6f0935fd1aaaafb9e8c0bcc279ecbcd2d788f6296f6637591'
            'e676dc064412b72df8bcaa3ca360257b33b499232939a22b4d5e6775be30df92'
            'ced3ef7271fa27bb07a4b5c7be08fc775519ddbb791315d325c726b061e2d55a'
            '6ed0fa4c6e971dafd05ad199486412ac13413545288c153ab70ef05e1100d3e5'
            '9d7a98dbd4a7f793507e0a52fbddb5c21442a0c500e247fb38ffbf19c7dac03c'
            'a8e7d3bf79c9f4974f66eeaa892ba2bac571825592906077f91bc24035a42da5'
            'b63364cf26d2fa054972d4ef88c1699cbb66455a3bcf4238aff6a75d475140d5')

install=$pkgname.install

package() {
	install -Dm644 haproxy.cfg $pkgdir/usr/lib/$pkgname/haproxy.cfg
	install -Dm644 touchui.less $pkgdir/usr/lib/$pkgname/touchui.less
	for SERVICE in *.service
	do
		install -Dm644 "$SERVICE" "$pkgdir/usr/lib/systemd/system/${pkgname}-${SERVICE}"
	done
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/mjpg-streamer.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/$pkgname.rules"
	install -Dm550 "$srcdir/sudoers" "$pkgdir/etc/sudoers.d/octoprint"
}


