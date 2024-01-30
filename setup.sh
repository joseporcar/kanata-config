
# check that input and uinput groups exist
sudo groupadd input;
sudo groupadd uinput;

sudo usermod -aG input $USER;
sudo usermod -aG uinput $USER;

sudo -i;

cd /etc/udev/rules.d;
touch 99-input.rules;
echo "KERNEL==\"uinput\", MODE=\"0660\", GROUP=\"uinput\", OPTIONS+=\"static_node=uinput\"" > 99-input.rules;

modprobe uinput;

echo the system will reboot in 10 seconds ctrl-c to end;

sleep 10;
reboot;
