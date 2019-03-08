# How to Deploy

### Deploy using edeliver

Simple version

Build Release

`mix edeliver build release`

This should probably done with `mix edeliver build upgrade` but requires
additional arguments - haven't studied the docs enough yet

Deploy Release

`mix edeliver deploy release to production`

There is probably a better way to do this go, as in upgrading

Don't for get to start the new deploy!

`mix edeliver start production`