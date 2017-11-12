VimProjects
-------------
The very simple and easy to use plugin for creating projects from preset templates.

I have found it very annoying especially for embedded projects that I can not simply save my project configuration i.e. my cmake file configured with necessary includes and linked libraries, `generated .ycm_extra_conf.py` and some of the startup code. So I have written the simplest plugin which allows you to save your projects and restore them.

**Parameters**
Set `vim_projects_dir`  in your `.vimrc` to the directory which contains your templates.

```let g:vim_projects_dir = "path_to_my_template_directory"```

**Commands**
There are only four commands:

* `:VimProjectsSave [name]`. Call it inside root directory of your newly created template project and all the files will be copied into the folder [name] which is to be created inside your templates directory. 

* `:VimProjectsCreate [name]`. Call it in your project's root directory and template files from template [name] will be copied in it.

* `:VimProjectDelete [name]`. Deletes template [name] from templates directory.

* `:VimProjectsList`. Prints all the templates inside your template directory.
