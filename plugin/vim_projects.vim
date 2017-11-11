if !has('python')
	finish
endif

function! VimProjectCreate(name)
	python <<< EOF
	import vim
	import os
	from shutil copytree

	pname = vim.eval("a:name")
	tdir = vim.eval("g:vim_projects_dir")

	
	current_dir = os.getcwd()
	copytree(current_dir, args.dir + os.sep + args.name + os.sep)
	
	EOF

:endfunction





