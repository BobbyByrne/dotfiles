export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1

filesToExec=(
    "$HOME/.cargo/env"
)

for t in ${filesToExec[@]}; do
    [ -f "$t" ] && \. "$t"
done

pathsToAdd=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.local/share/flatpak/exports/bin"
    "$HOME/.cargo/bin"
    "$ANDROID_SDK_ROOT/platform-tools"
)

for t in ${pathsToAdd[@]}; do
    if ! [[ "$PATH" =~ "$t" ]]
    then
        [ -d "$t" ] && PATH="$PATH:$t"
    fi
done

[ -n "$BASH_VERSION" ] && \. "$HOME/.bashrc"
