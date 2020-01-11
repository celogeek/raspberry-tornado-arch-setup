pkgname=octoprint-tornado
pkgver=20200111
pkgrel=14
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

sha256sums=('18ce947f1f63617aeccd62835059a03b138cfe3850026d444a7b37f03a99a3dc'
            '872fc25ccd5b3b3f4aa3b8b316d32cbd17ab6be6a3bb5ff47aff16dbc8a71608'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            '33feb20be2ad35b1eb412dc3a689c88f7a7ccfb9e0b4428216119983d3071d42'
            '44497818493422ec1908fae0107061131edd09912280e819062dc8eabe01f7c7'
            '5159287dc4fcadba54f501aed56c73374648ccfdb4553b532fa75fd0b24fcb3b'
            '4a286cbaaaa0a75231b6ce32170750e69b62836ff9ba69c6a351206db9f459d2')

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


