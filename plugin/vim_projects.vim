if !has('python')
	finish
endif

function! s:project_create(name)
python << EOF
import vim
import os
from shutil copytree

pname = vim.eval("a:name")
tdir = vim.eval("g:vim_projects_dir")


current_dir = os.getcwd()
copytree(current_dir, args.dir + os.sep + args.name + os.sep)

EOF
	return 1
endfunction

command! -nargs=1 VimProjectsCreate  call s:project_create(<f-args>)





