# DroidCam Debianized

[DroidCam](https://www.dev47apps.com/droidcam/), packaged for Debian.

This package is a strange mix of source code (the `v4l2loopback` fork) and
pre-built proprietary binaries. It is not, and cannot be, DFSG-compatible
unless the DroidCam binaries are made open-source. This package was created
merely for personal convenience.

Unlike the upstream, the kernel module is handled with DKMS to allows for
automatic (re)builds for different kernel versions.

As far as I know, the upstream doesn't expose any type of version number.
Versioning is thus left entirely up to the packager. A script that downloads
the upstream version is provided to compensate for the lack of `uscan`.

## Building the package

```sh
# Set the version number to something appropriate
VERSION=1.0.0

cp -r droidcam droidcam-$VERSION
cd droidcam-$VERSION

# Download from upstream
./debian/tools/fetch-upstream

# Build the package
debuild -us -uc

# Install the package
dpkg -i ../droidcam_${VERSION}*.deb
```
