. (Join-Path -Path (Split-Path $PROFILE) -ChildPath "aliases.ps1")
$env:Path += "$Env:USERPROFILE/bin"

#$PROMPT_PROFILE = "Ubuntu"
#. (-Join((Split-Path $PROFILE), "/aliases.ps1"))
#. (-Join((Split-Path $PROFILE), "/helper.ps1"))
#. (-Join((Split-Path $PROFILE), "/prompt.ps1"))
