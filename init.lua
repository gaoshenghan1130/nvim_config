require('plugins')
require('mason-config')
require('gopls')
require('file-explorer')
require('debugging')
require('file-finder')
require('statusBar')


--===================--
--
-- Terminal --
require('Terminal/ToggleTerm')

-- code related plugins
require('Code/lsp')
require('Code/formatterAndCompiler')
require('Code/code-completion')
require('Code/latex')
-- Styles --
require('style')
require('syntax-highlight')

--===================--
-- Personal Settings --
--===================--
---- Custom keybindings --
require('custom-keys')

---- AI Tools ----
require('copilot')




