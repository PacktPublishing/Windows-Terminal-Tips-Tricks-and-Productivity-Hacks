Chapter 10 Resources
===================

Resources for Chapter 10 of Windows Terminal Tips, Tricks, and Productivity Hacks, Published by Packt.


### Git Autocorrect

```
git config --global help.autocorrect 20
```


### Avoid retyping branch names when pushing a branch for the first time

```
git push origin HEAD
```

### Custom Aliases

Make a new `git graph` command by running the following:

```
git config --global alias.graph 'log --all --decorate --oneline --graph'
```

### Run graphical git operations in the command line

```
tig
```

### Quickly view files on other branches

```
git gui browser branch-name
```

or

```
git show branch-name:path/to/file.txt
```

### See changes to any reference in our local repository

```
git reflog
```
