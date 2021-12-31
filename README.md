# grph-mode emacs major mode

This simple emacs plugin adds support for GRPH via LSP.

## Install

To run, it first needs the GRPH LSP server installed. Clone the compiler from [here](https://github.com/grph-lang/grph), and build it using `swift build --product LSP` (Swift needs to be installed).

Clone this repo, then, add the following to your .emacs:

```elisp
(setq load-path
    (cons (expand-file-name "[INSERT grph-mode REPO HERE]") load-path))
(require 'grph-mode)
(setq lsp-grph-executable
      "[INSERT grph REPO HERE]/.build/debug/LSP")
```

Make sure to replace `[INSERT grph-mode REPO HERE]` with the path of the directory where grph-mode.el can be found, and replace `[INSERT grph REPO HERE]` with the path of the directory where the compiler has been cloned.

The plugin depends on [lsp-mode](https://emacs-lsp.github.io/lsp-mode/), make sure to have it installed too.

If you want lsp to automatically be enabled when opening a GRPH file, you can add the following to your `.emacs` :
```elisp
(add-hook 'grph-mode-hook #'lsp)
```

