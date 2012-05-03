for config_file in  $DOTFILES/bash/functions/autocomplete/*.bash
do
  . $config_file
done

complete -F _ws ws