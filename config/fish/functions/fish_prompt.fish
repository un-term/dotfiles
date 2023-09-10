function fish_prompt
    # Exit status - must be first
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q fish_prompt_pwd_dir_length
        set -g fish_prompt_pwd_dir_length 0
    end
    set -g fish_color_host "FFA600"

    printf '%s%s%s@%s%s%s:%s%s%s%s%s ' \
    (set_color $fish_color_user) $USER (set_color normal) \
    (set_color $fish_color_host) (prompt_hostname) (set_color normal) \
    (set_color $fish_color_cwd) (prompt_pwd) \
    (set_color normal) (__fish_git_prompt) \
    $pipestatus_string (set_color normal)
end

