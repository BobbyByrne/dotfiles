# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Export any env variables
# export ANDROID_SDK_ROOT="$HOME/.android/sdk"
# export MANGOHUD=1
# export MANGOHUD_DLSYM=1
export DOCKER_HOST="unix:$XDG_RUNTIME_DIR/podman/podman.sock"

# if running bash
if [ -n "$BASH_VERSION" ]; then

    filesToExec=(
        "$HOME/.bashrc"
        "$HOME/.cargo/env"
    )

    for t in ${filesToExec[@]}; do
        [ -s "$t" ] && \. "$t"
    done

    pathsToAdd=(
        "$HOME/bin"
        "$HOME/.local/bin"
        "$HOME/.cargo/bin"
        # "$ANDROID_SDK_ROOT/platform-tools"
    )

    for t in ${pathsToAdd[@]}; do
        if ! [[ "$PATH" =~ "$t" ]]
        then
            [ -d "$t" ] && PATH="$PATH:$t"
        fi
    done
fi
