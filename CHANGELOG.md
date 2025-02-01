# Changelog

## Release 1.0.3 (2025-02-01)

For reasons that I do not understand at the moment the provided services "run" file is not installed with correct permissions (It used to work).

As a temporary measure you can get around this by opening a homeassistant privileged terminal and entering the command

>``ID=$(docker ps -a | grep gmc3xx_monitor | awk '{ print $1 }') && docker exec -it "${ID}" bash``

This will take you into the gmc3xx_monitor docker container. From there you can manually run the command
 
>
>chmod +x /var/run/s6/legacy-services/gmc320/run
>
>
to set the correct privileges on the run command

## Release 1.0.2 (2025-02-01)
- Added .gitattributes to ensure the correct line endings are used for the code.

## Release 1.0.1 (2025-02-01)
- Added changelog
- Added repository.yaml
- Updated docs to state correct serial port speed


