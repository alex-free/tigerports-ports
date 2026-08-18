https://github.com/alex-free/powerpc-ports (main branch) tracks https://github.com/macos-powerpc/powerpc-ports (main branch) and is used as a branching point for submitting pull requests.

Fixes and changes are to be made in this fashion:
1) Sync https://github.com/alex-free/powerpc-ports (main branch) with https://github.com/macos-powerpc/powerpc-ports (main branch).

2) Create a new branch:

git clone git@github.com:alex-free/powerpc-ports (if not on current dev machine).
cd powerpc-ports
git pull (if needed for latest commits in stale repo).
git switch -c <name of port being changed>

3) Create the commit(s):

If this is not a port tracked by powerpc-ports:
cd ../
git clone https://github.com/macports/macports-ports
cp -rv macports-ports/<path to port we are importing> powerpc-ports/<path to port we are importing>
cd powerpc-ports (should still be on new branch named after this port).
git add .
git commit -m "<name of port>: import from macports"
git push origin <name of branch>

Copy over patches/new portfile to this branch.
git add .
git commit -m "<name of port>: <description of changes"
git push origin <name of branch>

4) Create the pull requests (without fucking up github sync):


do not merge into main
pull request from feature branch into tigerports
duplicate branch and use dupe for pullrequest into powerpcports (so if hard reset is needed it doesn"t fuck up github sync):
git switch <branch name>
git add .
git commit -m "<portname>: whatever"
git push origin
git switch -c <branch name>-ppcports
git push origin <branch name>-ppcports

then do whatever on <branch name>-ppcports. dont commit it into main from this dupe branch. wait until it is able to be synced from powerpcports. if needed modify the original branch with changes from dupe and commit that

Common portfile additions:

if {${configure.build_arch} eq "i386"} {
}

if {${configure.build_arch} eq "ppc"} {
}

compiler.blacklist *gcc-4.2 *gcc-4.0

if {[string match "macports-gcc-*" ${configure.compiler}]} {
    configure.cflags-append "-Wno-error=incompatible-pointer-types"
}

platform darwin 8 {
}

depends_build-append port:gmake
build.cmd ${prefix}/bin/gmake
use_xz                      yes

if {${os.platform} eq "darwin" && ${os.major} == 8} {
}

PortGroup           legacysupport 1.1
legacysupport.newest_darwin_requires_legacy 8

#if defined __APPLE__
#include "AvailabilityMacros.h"
#if MAC_OS_X_VERSION_MIN_REQUIRED > 1040


#endif
#endif

#if defined(__APPLE__) && MAC_OS_X_VERSION_MIN_REQUIRED != 1040
#endif

#if defined __APPLE__
#include "AvailabilityMacros.h"
#if MAC_OS_X_VERSION_MIN_REQUIRED > 1040
#include <spawn.h>
#endif
#else
#include <spawn.h>
#endif

To test a port after it's been built, you need to uninstall it
sudo port -d uninstall --follow-dependents <port name>

To update a branch:
git checkout <name of branch>
git switch <name of branch>
