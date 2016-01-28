# up
Fast traversing up the directory hierarchy

## Usage

Let's assume the following working directory:
```
/home/d-sheep/source/Webs/myApp/src/img
```

Now you can use these commands with the following effects:

Command | Final working directory | Explanation
--- | --- | ---
`up` | `/home/d-sheep/source/Webs/myApp/src` | No arguments mean 1 level higher
`up 3` | `/home/d-sheep/source/Webs` | Numeric argument means length of the jump
`up source` | `/home/d-sheep/source` | Textual argument finds a folder with a matching name
`up sour` | `/home/d-sheep/source` | It actually looks for folders starting with the argument
`up s` | `/home/d-sheep/source/Webs/myApp/src` | Ambigual match results in the shortest possible jump
`up img` | `/home/d-sheep/source/Webs/myApp/src/img` | Unsuccessful match does not trigger a jump
`up webs` | `/home/d-sheep/source/Webs/myApp/src/img` | Matching is case sensitive
`up /` | `/` | Looking for root simply jumps to the root
