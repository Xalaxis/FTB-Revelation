# FTBOmnia-Revelation

Builds are automatically generated on push and on schedule to ensure image freshness.

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Xalaxis/FTBOmnia-Revelation/main)

A Docker container that runs the FTB Revelation modpack.

This container has -Dfml.queryResult=confirm set, which means that in the event of any mod removals between versions the change will be silently accepted.

Images are available on Docker at wolfrazu/ftb-revelation.  For specific versions, see the image label appropriate to the version you want:

## Example versions

* latest (Automatically updates to the latest version available) - Default

This one of my first public containers, so if you have any suggestions feel free to submit a pull request or issue :)