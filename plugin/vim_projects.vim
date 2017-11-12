if !has('python')
	finish
endif

function! s:project_create(name)
python << EOF
import vim
import os
import shutil

def copytree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)

pname = vim.eval("a:name")
tdir = vim.eval("g:vim_projects_dir")

src_path = tdir + os.sep + pname + os.sep
dst_path= os.getcwd() + os.sep

copytree(src_path, dst_path)

EOF
	return 1
endfunction


function! s:project_save(name)
python << EOF
import vim
import os
import shutil

def copytree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)

pname = vim.eval("a:name")
tdir = vim.eval("g:vim_projects_dir")

src_path= os.getcwd() + os.sep
dst_path = tdir + os.sep + pname + os.sep

if os.path.exists(dst_path):
	copytree(src_path, dst_path)
else:
	shutil.copytree(src_path, dst_path)

EOF
	return 1
endfunction


function! s:project_delete(name)
python << EOF
import vim
import os
import shutil

tdir = vim.eval("g:vim_projects_dir")
pname = vim.eval("a:name")

path = tdir + os.sep + pname
try:
	shutil.rmtree(path)
except Exception as e:
	print(e)
	
EOF
	return 1
endfunction

function! s:projects_list()
python << EOF
import vim
import os

tdir = vim.eval("g:vim_projects_dir")
for dI in os.listdir(tdir):
       	if os.path.isdir(os.path.join(tdir, dI)):
		print(dI)

EOF
	return 1
endfunction


command! -nargs=1 VimProjectsCreate call s:project_create(<f-args>)
command! -nargs=1 VimProjectsSave call s:project_save(<f-args>)
command! -nargs=1 VimProjectsDelete call s:project_delete(<f-args>)
command! VimProjectsList call s:projects_list()



