# GQ Radiation Monitor addon for Homeassistant
This is adding a GQ GMC-320 (and GMC-300+, ...) radiation monitor to homeassistant. It should work with other devices from the same manufacturer.

The device is attached to the HA machine via a USB port, where it will appear as a USB serial device. The code then queries the monitor on a regular period and publishes the returned data to the HA API.
The baud rate on the monitor should ideally be set to 115200. Make sure the config on the device is set to the same baud rate configured in the addon configuration.

## Building / Installation
This HA addon will automatically add the build tools, download the latest source, compile, install and run the gmc3xx application on the local HA machine.

## System Dependencies
**None**

## Addon Configuration
You need to specify the server, user and password for the MQTT broker. A user-name and password is mandatory. The server defaults to localhost:1883.

Note: There is no parameter checking, so if you get anything wrong the add-on will not start.

# Sensor usage
You can add the following to your ESPHome device yaml changing the unit serial number to match the one returned by your device (this is reported in the logs). That way you can have a display showing the CPM value.

```
sensor:
  - platform: homeassistant
    id: cpm
    entity_id: sensor.gmc3xx_f4880a454eb9
```

The sensor state will be updated every 60 seconds (or whatever you set the repeat option to).
The cpm value (state) is probably the only one most people need, the rest are there just because they are reported back by the hardware.
The full state content will be in the format:
```
{
  "state" : 26, // cpm
  "attributes": {
    "unit_of_measurement" : "cpm", // unit of measurement
    "version" : "GMC-300Re 4.15", // version of the device
    "serial" : "f4880a454eb9", // serial number of the device
    "temp" : 0.0, // temperature
    "volt" : 4.0, // battery voltage
    "x" : 0, // gyro X
    "y" : 43520, // gyro Y
    "z" : 256 // gyro Z
  }
}
```

Then simply use the value like `id(cpm).state` in your config.

## Running
The application will automatically run if a GQ radiation monitor is attached via serial USB serial port and a configured MQTT broker is available.
The GQ radiation monitor is polled every 60 seconds unless the "repeat" option is changed.
