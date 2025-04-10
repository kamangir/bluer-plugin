#! /usr/bin/env bash

function test_bluer_plugin_thing_with_args() {
    local options=$1
    local do_dryrun=$(abcli_option_int "$options" dryrun 0)

    local arg
    for arg in this that; do
        abcli_log "testing arg=$arg ..."

        abcli_eval ,$options \
            echo "🌀 $arg"
        [[ $? -ne 0 ]] && return 1

        abcli_hr
    done
}
