# function to quickly write colored text
function color_text
  set_color "$argv[1]"
  echo -n "$argv[2]"
  set_color "normal"
end
