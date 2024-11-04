function ad-synctime --description "sync the time with an Active Directory domain controller"
  if test (count $argv) -ne 1
    echo "usage: ad-synctime <dc ip>"
  else
    # get the date of the dc
    set fakedate (date +'%Y-%m-%d') (net time -S "$argv[1]" | awk '{print $4}')

    # check for errors
    set parts (string split ":" $fakedate)
    set num_colons (math (count $parts) - 1)

    if string match -q "*:*:*" $fakedate
      echo "[$color_green+$color_reset] Changing time!"
      faketime "$fakedate" fish
    end
  end
end
