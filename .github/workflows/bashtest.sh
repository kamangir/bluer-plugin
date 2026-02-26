#! /usr/bin/env bash

function bashtest() {
    # set -x # verbose-mode
    # /home/runner/work/bluer-journal/verbose

    local plugin_name=$1

    cd ..
    git clone https://github.com/kamangir/bluer-ai.git

    source $(pwd)/bluer-ai/bluer_ai/.abcli/bluer_ai.sh ~terraform \
        $plugin_name test

    return
}

bashtest "$@"
