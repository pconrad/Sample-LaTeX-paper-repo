Step 1: Create a new empty repo with just a README.md and a .gitignore for LaTeX.

Step 2: Clone that repo on your system.

```
$ git clone git@github.com:ucsb-cs-education/Paper-about-Awesome.git
Cloning into 'Paper-about-Awesome'...
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (4/4), done.
$
```

Step 3: cd into the top level directory of the new repo.

```
$ cd Paper-about-Awesome/
```

Step 4: Temporarily, add a new remote that you can pull from for THIS repo.  Here, we are calling it LatexTemplte, but you can call it anything you like.   This is in place of "origin", which is the default name for the "remote" that stands for github.com serving up your repo.


```
$ git remote add LatexTemplate git@github.com:pconrad/Sample-LaTeX-paper-repo.git
$
```

Step 5: Do a git pull on that remote to populate your new paper repo with the goodies (and the commit history) from this repo.

You will likely get two merge conflicts: one in .gitignore, and the other in README.md.  But don't worry. They are trivial to fix.


```
$ git pull LatexTemplate master
warning: no common commits
remote: Counting objects: 39, done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 39 (delta 12), reused 39 (delta 12)
Unpacking objects: 100% (39/39), done.
From github.com:pconrad/Sample-LaTeX-paper-repo
 * branch            master     -> FETCH_HEAD
Auto-merging README.md
CONFLICT (add/add): Merge conflict in README.md
Auto-merging .gitignore
CONFLICT (add/add): Merge conflict in .gitignore
Automatic merge failed; fix conflicts and then commit the result.
$
```

Step 7: Use an editor to fix the merge conflicts in the README and .gitignore files

The README.md merge conflict is just that the local README.md has the name of the paper repo
you are creating, while the one you are merging has the info about the template.  (You might find
it easier to just use git reset HEAD README.md).

The .gitignore probably has a merge conflict because the one from the Latex Template has *~ in it.
If you are an emacs user, you probably really do want to merge this in.  If not, just do the git reset HEAD .gitignore on this one too.)


```
$ emacs README.md .gitignore 
```

Step 8: Now commit and push your changes to origin master:

```
$ git status
# On branch master
# Changes to be committed:
#
#	new file:   Makefile
#	new file:   README_MAC.md
#	new file:   REFERENCES.md
#	new file:   abstract.tex
#	new file:   background.tex
#	new file:   bib2md.py
#	new file:   blind.tex
#	new file:   conclude.tex
#	new file:   intro.tex
#	new file:   main.tex
#	new file:   notblind.tex
#	new file:   packages.tex
#	new file:   paper.bib
#	new file:   results.tex
#
# Unmerged paths:
#   (use "git add/rm <file>..." as appropriate to mark resolution)
#
#	both added:         .gitignore
#	both added:         README.md
#
$ git add .gitignore README.md
$ git status
# On branch master
# Changes to be committed:
#
#	modified:   .gitignore
#	new file:   Makefile
#	modified:   README.md
#	new file:   README_MAC.md
#	new file:   REFERENCES.md
#	new file:   abstract.tex
#	new file:   background.tex
#	new file:   bib2md.py
#	new file:   blind.tex
#	new file:   conclude.tex
#	new file:   intro.tex
#	new file:   main.tex
#	new file:   notblind.tex
#	new file:   packages.tex
#	new file:   paper.bib
#	new file:   results.tex
#
$ git commit -m "pulled in the Template"
[master a043eb9] pulled in the Template
$ git push origin master
Counting objects: 45, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (42/42), done.
Writing objects: 100% (42/42), 11.70 KiB, done.
Total 42 (delta 14), reused 0 (delta 0)
To git@github.com:ucsb-cs-education/Paper-about-Awesome.git
   192a1f5..a043eb9  master -> master
$
```

Step 9: Remove the remote for the LatexTemplate---you don't need it anymore.

```
$ git remote rm LatexTemplate
$ 
```

Congratulations!  You now have a repo that has all of the content, and the commit history of the original, but is completely independent of the original.

By the way, this should work for any repo--not just the LaTexTemplate one.


