#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:91cdace32ac683358a70ec2b21b9f257fcd42d37; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:060171a44319d59a72b198b576925320dbb3e15a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:91cdace32ac683358a70ec2b21b9f257fcd42d37 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
