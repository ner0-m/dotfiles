# Neovim config

### Keybindings

For keybindings using the leader, just hit the leader (space) and `vim-which-key` will show it.

I so often have the feeling that I sometimes don't really use the plugins I have, so write the shortcuts down
good damnit.



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


  

 
