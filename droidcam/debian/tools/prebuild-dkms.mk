#!/usr/bin/make -f

include /usr/share/dpkg/pkg-info.mk

KERNEL_VERSION ?= $(shell uname -r)
DRIVER_VERSION ?= $(shell dkms status $(DEB_SOURCE) | awk -F', ' '{print $$2}')

DEB_BUILD_ARCH := $(shell dpkg-architecture -q DEB_BUILD_ARCH)

module := $(DEB_SOURCE)/$(DRIVER_VERSION)
module_dir := /var/lib/dkms/$(module)
deb_name := $(DEB_SOURCE)-modules-$(KERNEL_VERSION)_$(DEB_VERSION_UPSTREAM)_$(DEB_BUILD_ARCH).deb
deb_path := $(module_dir)/bmdeb/$(deb_name)

.PHONY: build
build:
	@echo Building $(deb_path) ...
	dkms mkbmdeb $(module) -k $(KERNEL_VERSION)
	@dpkg -I $(deb_path)
