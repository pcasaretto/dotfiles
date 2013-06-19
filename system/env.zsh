# Only set this if we haven't set $EDITOR up somewhere else previously.
if [ -z "$EDITOR" ]; then
  export EDITOR='mate -w'
  # export EDITOR='subl'
fi
