#! /usr/bin/env bash

function bluer_plugin_node_leaf() {
    local options=$1
    local do_dryrun=$(abcli_option_int "$options" dryrun 0)
    local do_download=$(abcli_option_int "$options" download $(abcli_not $do_dryrun))
    local do_upload=$(abcli_option_int "$options" upload $(abcli_not $do_dryrun))

    local object_name_1=$(abcli_clarify_object $2 .)

    [[ "$do_download" == 1 ]] &&
        bluer_objects_download - $object_name_1

    local object_name_2=$(abcli_clarify_object $3 bluer_plugin_node_leaf-$(abcli_string_timestamp))

    abcli_eval dryrun=$do_dryrun \
        python3 -m bluer_plugin.node \
        leaf \
        --object_name_1 $object_name_1 \
        --object_name_2 $object_name_2 \
        "${@:4}"
    local status="$?"

    [[ "$do_upload" == 1 ]] &&
        bluer_objects_upload - $object_name_2

    return $status
}
