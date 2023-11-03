#!/data/data/com.termux/files/usr/bin/bash
pkg install wget -y 

version=jammy

folder=ubuntu-${version}
tarname="ubuntu-${version}-roots.tar.gz"

termux-setup-storage


if [ "$first" != 1 ];then
	if [ ! -f $tarball ]; then
		echo "Download Rootfs, this may take a while base on your internet speed."
		case `dpkg --print-architecture` in
		aarch64)
			archurl="arm64" ;;
		*)
			echo "unknown architecture"; exit 1 ;;
		esac
  
    wget "https://partner-images.canonical.com/core/${version}/current/ubuntu-${version}-core-cloudimg-${archurl}-root.tar.gz" -O ${tarname}
