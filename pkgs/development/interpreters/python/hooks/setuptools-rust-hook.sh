echo "Sourcing setuptools-rust-hook"

setuptoolsRustSetup() {
    # This can work only if rustPlatform.cargoSetupHook is also included
    if ! type cargoSetupPostPatchHook >/dev/null 2>&1; then
        echo "ERROR: setuptools-rust has to be used alongside with rustPlatform.cargoSetupHook!"
        exit 1
    fi

    export PYO3_CROSS_LIB_DIR="@pyLibDir@"
    export CARGO_BUILD_TARGET=@cargoBuildTarget@
}

preConfigureHooks+=(setuptoolsRustSetup)
