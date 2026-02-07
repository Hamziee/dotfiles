#!/usr/bin/env bash

# Virtual audio setup WITHOUT loopback monitoring
# Creates:
# 1. Virtual speaker (for OBS / apps)
# 2. Virtual microphone (for Zoom / Discord / etc)
# 3. Routes speaker → mic
# No audio will be audible locally

echo "Restarting PipeWire is recommended before running this."
echo " "

echo "VirtualSpeaker"
pactl load-module module-null-sink \
  sink_name="VirtualSpeaker" \
  sink_properties=device.description=VirtualSpeaker

echo " "
echo "VirtualMic"
pactl load-module module-null-sink \
  media.class=Audio/Source/Virtual \
  sink_name="VirtualMic" \
  channel_map=front-left,front-right

echo " "
echo "Linking VirtualSpeaker to VirtualMic"
pw-link VirtualSpeaker:monitor_FL VirtualMic:input_FL
pw-link VirtualSpeaker:monitor_FR VirtualMic:input_FR

echo " "
echo "Done! No loopback audio enabled."
echo " "
echo "Reset command if needed:"
echo "systemctl --user restart pipewire pipewire-pulse"
