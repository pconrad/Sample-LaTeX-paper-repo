# What you need to use these files on Mac

* git for mac (this is a small download)
** download from: http://git-scm.com/download/mac
** To see if it is installed, type <code>git --version</code>.  You should see something like: <code>git version 1.7.7.3</code>
* LaTeX for mac (large download)
** download from: http://www.tug.org/mactex/
** To see if it is installed, type <code>latex --version</code>.
* Make utillity (you might already have it)
** Try typing make -v at a Command Line prompt.  
** If you get something like <code>GNU Make 3.81</code> followed by several lines of output, you already have Make installed.
** If you get something like: <code>-bash: make: command not found</code>, then you'll need to install Make.
** First step: Go to App Store, and download and install XCode.  This can be a large download.
** Then start XCode and go to:  Xcode->Preferences->Downloads and install component named "Command Line Tools".
** Then retry the <code>make -v</code> to see if it is now installed.
