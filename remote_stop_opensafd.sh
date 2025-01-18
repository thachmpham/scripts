stop_on_ctrl_c() {
  exit 1
}

trap stop_on_ctrl_c SIGINT

# main()
while true; do
  sshpass -p password ssh -q user@host 'systemctl stop opensafd'

  if [ $? -eq 0 ]; then
    echo 'Done'
    exit 0
  else
    echo 'Retry'
    sleep 0.5
  fi
done
