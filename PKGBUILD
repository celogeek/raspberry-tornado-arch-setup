pkgname=octoprint-tornado
pkgver=20200111
pkgrel=28
pkgdesc="Control my tornado installation"
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
            '90ba45125c2d3418b458ed97c17b1c835327a7e06399a3b7bfe4f20c43ac5b89'
            '7c97d0d059f4e9f392b775f417ebe7f7309f0c78283996a3b9eb9c8ed17d96e3'
            '9d7a98dbd4a7f793507e0a52fbddb5c21442a0c500e247fb38ffbf19c7dac03c'
            'a8e7d3bf79c9f4974f66eeaa892ba2bac571825592906077f91bc24035a42da5'
            'b7cd1d580192ee4b221525d12304da7cd6609df01d99780dcd82ec42da61da8e')

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
	install -Dm440 "$srcdir/sudoers" "$pkgdir/etc/sudoers.d/octoprint"
}


