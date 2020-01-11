pkgname=octoprint-tornado
pkgver=20200111
pkgrel=18
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

sha256sums=('18ce947f1f63617aeccd62835059a03b138cfe3850026d444a7b37f03a99a3dc'
            '872fc25ccd5b3b3f4aa3b8b316d32cbd17ab6be6a3bb5ff47aff16dbc8a71608'
            '47546d4400ca02c73da3698e4b27cef87cdb64c05f45a613b4a5fdad6e17d763'
            '4b579a6ba38ea7cc1d574fd125ef1480d114a2b4029ffefa8c474dea8e3e3467'
            'e26fcf98101f7dc7321a59299cee8f3ad2bba32400ef7c882c930a91a3ab0860'
            'ca024a69ef997893f86ec20903bc3682ddd1f3144e610164678d452a47be007e'
            '4a286cbaaaa0a75231b6ce32170750e69b62836ff9ba69c6a351206db9f459d2'
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


