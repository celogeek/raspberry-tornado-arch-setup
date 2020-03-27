pkgname=octoprint-tornado
pkgver=20200307
pkgrel=1
pkgdesc="Control my tornado installation"
arch=(any)
depends=(haproxy mjpg-streamer-git python2-virtualenv yq)
provides=('octoprint')
conflicts=('octoprint')
octoprintver=1.4.0
source=(
	https://github.com/foosel/OctoPrint/archive/${octoprintver}.tar.gz
	tmpfiles.conf
	sysusers.conf
	haproxy.cfg
	proxy.service
	web.service
	webcam.service
	klipper.service
	klipper.sh
	udev.rules
	touchui.less
	webcam-tester.html
	sudoers
)

sha256sums=('46558dd965e2e60016f1b5aea4c559a48fa1d7dc6b03dcdd08efcbad034f72e8'
            'd3be84b46413b0e66d92d20397a9caf4163f116044c12483bc06df41c497890a'
            '808ffd5979ecd952190f2da77c04de43085b7483dc46c3c13020dc860ea4d352'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            '76a5b44c380db9d6f0935fd1aaaafb9e8c0bcc279ecbcd2d788f6296f6637591'
            '33e05a8bd4ed8020e5bad3002038fc31e622b19b4d560c4a305ab0f9d47ab182'
            'da93c968819136105e18910db705d72f006bb15d6e28d9ed6fbf1c5d148c66aa'
            '4945e016b9ec5fc56996d43142debda5613a64d9123e89d23b4229f38227d8de'
            'c5cd881053a260722b2d24951d9e555ab6dd64a807847827e8d395c5500f1bbb'
            '9d7a98dbd4a7f793507e0a52fbddb5c21442a0c500e247fb38ffbf19c7dac03c'
            'a8e7d3bf79c9f4974f66eeaa892ba2bac571825592906077f91bc24035a42da5'
            '20ff6bd0008f61ea089e921584211cddf094d2a9e73910b0e0e55925f0884b26'
            'b7cd1d580192ee4b221525d12304da7cd6609df01d99780dcd82ec42da61da8e')

install=$pkgname.install

package() {

	# octoprint
	cd "${srcdir}/OctoPrint-${octoprintver}"
	virtualenv2 "${pkgdir}/opt/$pkgname"
	"${pkgdir}/opt/$pkgname/bin/python" setup.py install --optimize=1
	sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" "${pkgdir}/opt/$pkgname/bin/"* # relocate without breaking plugin system
        cd -

	# config
	install -Dm644 haproxy.cfg $pkgdir/usr/lib/$pkgname/haproxy.cfg
	install -Dm644 touchui.less $pkgdir/usr/lib/$pkgname/touchui.less
	install -Dm644 webcam-tester.html $pkgdir/usr/lib/$pkgname/webcam/index.html
	install -Dm755 klipper.sh $pkgdir/usr/lib/$pkgname/klipper.sh

	for SERVICE in *.service
	do
		install -Dm644 "$SERVICE" "$pkgdir/usr/lib/systemd/system/${pkgname}-${SERVICE}"
	done
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/mjpg-streamer.conf"
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "$srcdir/udev.rules" "$pkgdir/usr/lib/udev/rules.d/$pkgname.rules"
	install -Dm750 -d "$pkgdir/etc/sudoers.d/"
	install -Dm440 "$srcdir/sudoers" "$pkgdir/etc/sudoers.d/octoprint"
}

