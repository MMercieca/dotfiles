autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git=$commands[git]
else
  git=/usr/bin/git
fi

git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)

  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "(%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%})"
    else
      echo "(%{$fg_bold[red]%}$(git_prompt_info)%{$fg[green]%} ಠ_ಠ %{$reset_color%})"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return

 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " %{$fg_bold[magenta]%}✈%{$reset_color%} "
  fi
}

rb_prompt(){
  if (( $+commands[rbenv] ))
  then
	  echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
	else
	  echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"
}

export PROMPT=$'$(directory_name)  $(git_super_status)%{$reset_color%}\n$(need_push)%{$reset_color%} %m%@ 👀  > '
set_prompt () {
 # export RPROMPT="$(git_super_status)%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
