# Neovim config

### Keybindings

For keybindings using the leader, just hit the leader (space) and `vim-which-key` will show it.

I so often have (the feeling tat I) sometimes don't really use the plugins I have, so write the shortcuts down
good damnit.

Quickjump:

- [vim-sandwhich](#vim-sandwhich)
- [vim.target](#vim.target)

##### vim-sandwich

- Add: `sa{motion/textobject}{addition}`
- Delete: ``sd{deletion}``
- Replace: ``srb{addition}`` or ``sr{deletion}{addition}`` 

- some text (this is inside) some other 
{[(as_surrounded_text)]} 
 
Special textobjects: `f` function `t` tag

Other useful stuff:
- Quick selection of text inside: ``vib`` or ``vis<some-query>``
- Quick selection of text including surrounding: ``vab`` or ``vas<some-query>``

Two counts are possible: ``[count1]{operator}[count2]{textobject}``, with the meaning of repeat the operator for count1
times, and then the count2 is passed to the testobject. For example, calling ``2sa3w((`` turns ``foo bar baz``
into ``((foo bar baz))`` (cursor on `f`).

 

##### vim.target

- Pair Text objects ``( ) { } [ ] < >``
- Quote Text objects ``' " ` q`` (single, double quotes and back ticks)
- Separator text objects `` , . ; : + - = ~ _ * # / | \ & $ ``
- Arguments text objects (indicated by `` a ``)
- Block of any Pair text object (indicated by `` b ``)
- Any Quote (indicated by `` q ``) 

Commands (with `X` being a test object from above):

- In Pair `iX`
- Inside pair `IX` (excludes whitespace)
- A pair `aX`
- Around pair `AX` (includes whitespace at one side)
- Next and previous pair `YnX` `YlX` (With `Y` being any of `i I a A`)

For Quote text objects it seeks ahead or back on commas


  

 
