#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow Night"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC6666"           # Red (Syntax string)
export COLOR_03="#B5BD68"           # Green (Command)
export COLOR_04="#F0C674"           # Yellow (Command second)
export COLOR_05="#81A2BE"           # Blue (Path)
export COLOR_06="#B293BB"           # Magenta (Syntax var)
export COLOR_07="#8ABEB7"           # Cyan (Prompt)
export COLOR_08="#FFFEFE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#CC6666"           # Bright Red (Command error)
export COLOR_11="#B5BD68"           # Bright Green (Exec)
export COLOR_12="#F0C574"           # Bright Yellow
export COLOR_13="#80A1BD"           # Bright Blue (Folder)
export COLOR_14="#B294BA"           # Bright Magenta
export COLOR_15="#8ABDB6"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#1D1F21"   # Background
export FOREGROUND_COLOR="#C5C8C6"   # Foreground (Text)

export CURSOR_COLOR="#C4C8C5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
