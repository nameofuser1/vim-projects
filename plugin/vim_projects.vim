if !has('python')
	finish
endif

function! s:project_create(name)
python << EOF
import vim
import os
from shutil import copytree

pname = vim.eval("a:name")
tdir = vim.eval("g:vim_projects_dir")

print(pname)
print(tdir)

current_dir = os.getcwd()
print(current_dir)
dst_path = tdir + os.sep + pname + os.sep
print(dst_path)
copytree(current_dir, dst_path)

EOF
	return 1
endfunction

command! -nargs=1 VimProjectsCreate  call s:project_create(<f-args>)





