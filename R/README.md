# R Ports

This is an overlay repo of R packages to be used with official [MacPorts](https://macports.org)
or its forks, [MacStrop](https://github.com/RJVB/macstrop) and [PowerPC Ports](https://macos-powerpc.org).

Current maintenace is moved here; while most of these ports are also present in the official MacPorts ports repo,
they are not updated there anymore. Consider using this repo to stay up-to-date.
Despite macos-powerpc umbrella, ports here are not specific to PowerPC and can be used on x86 and aarch64.

Update 2025.12: this repository now replaces `R` subdirectory of MacPorts.

To use it, clone the repository as `R` into a [local overlay](https://guide.macports.org/chunked/development.local-repositories.html). For example, as `/opt/local/R-ports/R`:

%> sudo mkdir /opt/local/R-ports && cd /opt/local/R-ports
%> sudo git clone --depth=1 https://github.com/macos-powerpc/R-ports R
%> sudo chown -R macports /opt/local/R-ports

This makes sure that the resulting tree will be readable by the "macports" user.
To update the tree later on, use:

%> sudo -u macports git -C /opt/local/R-ports/R pull

Then, edit /opt/local/etc/macports/sources.conf: towards the end of the file, add the following line *above* the line that has [default] at the end:

file:///opt/local/R-ports

and save the file. If you do not want this repo to be updated automatically whenever you run port sync, add [nosync] at the end of that line.

Now, do

%> cd /opt/local/R-ports && sudo -u macports portindex

and the new ports will be available.

Ports that are in this repo will override those from the default one.

# Support the project

As things stand, this is a one-developer "hobby" project. I do this because I like it and use R in research.
If you find this useful, you may consider supporting it. It is not sponsored by MacPorts or any other institution or company.
