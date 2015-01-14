
_get_all_nuxeo_packages()
{
  local cmd=$1
  local cache_base=$HOME/.nuxeo_bash_completion_cache
  local packages
  if [ ! -f ${cache_base}.$$ ];then
    packages=$($cmd --json mp-listall | jq .commands.command.packages.package[].id)
    echo rm -f ${cache_base}.*
    echo $packages > ${cache_base}.$$
  fi

  echo `cat ${cache_base}.$$`
}

_nuxeoctl() 
{
    local cmd="${1}"
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
     
    opts="--help --accept -d --debug -dc --gui -h --help --json --nodeps -q --quiet --relax -s --snapshot --xml" 
    cmds="help gui start startbg stop restart restartbg status console wizard configure pack showconf mp-list mp-listall mp-init mp-update mp-add mp-install mp-uninstall mp-request mp-remove mp-reset mp-purge mp-hostfix mp-upgrade mp-show"

    case "${prev}" in
      mp-uninstall)
        local running=$($cmd --json mp-list | jq .commands.command.packages.package[].id) 
        COMPREPLY=( $(compgen -W "${running}" -- ${cur}) )
        return 0
        ;;
      --gui)
        COMPREPLY=( $(compgen -W "true false" -- ${cur}))
        return 0
        ;;
      --accept)
        COMPREPLY=( $(compgen -W "true false ask" -- ${cur}))
        return 0
        ;;  
      --relax)
        COMPREPLY=( $(compgen -W "true false ask" -- ${cur}))
        return 0
        ;;
      mp-install | mp-show)
        local ids=$( _get_all_nuxeo_packages $cmd )
        COMPREPLY=( $(compgen -W "${ids}" -- ${cur}) )
        return 0
        ;;
      *)
        ;;
    esac

   COMPREPLY=($(compgen -W "${opts} ${cmds}" -- ${cur}))  
   return 0
}
complete -F _nuxeoctl nuxeoctl