# GQ Radiation Monitor Interface

This is a first pass at adding a GQ GMC-320 radiation monitor to homeassistant. It shroud work with other devices from the same manufacturer.

The device is attached to the HA machine via a USB port, where it will appear as a USB serial device. The code then queries the monitor on a regular period and publishes the returned data to the specified MQTT broker.

## Building / Installation

This HA addon will automatically add the build tools, download the latest source, compile, install and run the gmc3xx application on the local HA machine.

## System Dependencies

The following should be added to you HA build via the addon store.

- Mosquitto broker
- Node-RED

## Addon Configuration

You need to specify the server, user and password for the MQTT broker. A user-name and password is mandatory. The server defaults to localhost:1883.

Note: There is no parameter checking, so if you get anything wrong the add-on will not start.

# Homeassistant configuation
Add the following to your configuration.yaml file changing the unit serial number to match the one returned by your device (this is reported in the logs) :

```
mqtt:
  sensor:
    - name: "GMC3xx.cpm"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "cpm"
      value_template: "{{ value_json.cpm }}"
    - name: "GMC3xx.voltage"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "V"
      value_template: "{{ value_json.volt }}"
    - name: "GMC3xx.version"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "Ver"
      value_template: "{{ value_json.version }}"
    - name: "GMC3xx.serial"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "#"
      value_template: "{{ value_json.serial }}"
    - name: "GMC3xx.temp"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "c"
      value_template: "{{ value_json.temp }}"
    - name: "GMC3xx.x"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "x"
      value_template: "{{ value_json.x }}"
    - name: "GMC3xx.y"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "y"
      value_template: "{{ value_json.y }}"
    - name: "GMC3xx.z"
      state_topic: "homeassistant/sensor/gmc3xx_<unit serial number>"
      unit_of_measurement: "z"
      value_template: "{{ value_json.z }}"
```

## Running

The application will automatically run if a GQ radiation monitor is attached via serial USB serial port and a configured MQTT broker is available.
The GQ radiation monitor is polled every 60 seconds unless the "repeat" option is changed.
