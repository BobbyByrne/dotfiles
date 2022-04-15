export ANDROID_SDK_ROOT="$HOME/.android/sdk"
export DOCKER_HOST="unix:$XDG_RUNTIME_DIR/podman/podman.sock"
export NVM_DIR="$HOME/.nvm"
export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1

filesToExec=(
    "$NVM_DIR/nvm.sh"
    "$HOME/.cargo/env"
    "$HOME/.bashrc"
)

for t in ${filesToExec[@]}; do
    [ -f "$t" ] && \. "$t"
done

pathsToAdd=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.local/share/flatpak/exports/bin"
    "$HOME/.cargo/bin"
    "$HOME/.deno/bin"
    "$HOME/.fzf/bin"
    "$ANDROID_SDK_ROOT/platform-tools"
)

for t in ${pathsToAdd[@]}; do
    if ! [[ "$PATH" =~ "$t" ]]
    then
        [ -d "$t" ] && PATH="$PATH:$t"
    fi
done
