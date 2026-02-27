echo $(date) $(whoami) START >> /root/.config/xfce_custom/startup_script.log
ls -lha /root/Desktop/ >> /root/.config/xfce_custom/startup_script.log
for f in /root/Desktop/*.desktop; do
  chmod +x "$f";
  gio set "$f" "metadata::trusted" yes >> /root/.config/xfce_custom/startup_script.log 2>&1;
  gio set -t string "$f" metadata::xfce-exe-checksum "$(sha256sum "$f" | awk '{print $1}')" >> /root/.config/xfce_custom/startup_script.log 2>&1;
done
echo $(date) $(whoami) STOP >> /root/.config/xfce_custom/startup_script.log
