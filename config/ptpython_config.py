# https://github.com/prompt-toolkit/ptpython/blob/master/examples/ptpython_config/config.py

__all__ = ["configure"]

def configure(repl):
    #repl.enable_mouse_support = True
    repl.enable_mouse_support = False
    repl.paste_mode = False
    repl.confirm_exit = False    
    repl.use_code_colorscheme("monokai")

    repl.enable_fuzzy_completion = True
    repl.enable_auto_suggest = False
    repl.show_signature = True
    repl.show_docstring = False
    repl.show_meta_enter_message = True
    repl.highlight_matching_parenthesis = True

