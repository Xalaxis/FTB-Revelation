# FTBOmnia-Revelation

Builds are automatically generated on push and on schedule to ensure image freshness.

![Build and Push Latest Versions](https://github.com/Xalaxis/FTB-Revelation/workflows/Build%20and%20Push%20Latest%20Versions/badge.svg?branch=main)

A Docker container that runs the FTB Revelation modpack.

This container has -Dfml.queryResult=confirm set, which means that in the event of any mod removals between versions, the change will be silently accepted.

Images are available on DockerHub at wolfrazu/ftb-revelation.  For specific versions, see the image label appropriate to the version you want (WIP, not yet done).

## Example versions

* latest (Automatically updates to the latest version available) - Default

This one of my first public containers, so if you have any suggestions feel free to submit a pull request or issue :)