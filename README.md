# jtheo's dotfiles

I'm managing my dotfiles with chezmoi

There's a lot of old stuff that I should clean, so it might be that a bash function isn't working, obsolete junk, etc.

Sorry... It's a working in progress.

## Restore

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jtheo

```

## Dependencies
- [age](https://github.com/FiloSottile/age)


### For Mac
Install BREW
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Note** There's no need to install xcode cli anymore, Brew can do it automatically (see [here](https://www.freecodecamp.org/news/install-xcode-command-line-tools/))



## Refs:
- [chezmoi github](https://github.com/twpayne/chezmoi)
- [chezmoi docs](https://www.chezmoi.io)



