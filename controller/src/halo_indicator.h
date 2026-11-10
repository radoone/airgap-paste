#pragma once

#include <stdint.h>

enum class HaloState { kOff, kPairing, kReady, kTyping, kError };

// External halo is an instruction/status light: idle connection pulses stay on
// the existing board LED. D0 drives one LED through a 330-ohm series resistor.
inline bool haloIndicatorOn(HaloState state, uint32_t now) {
  switch (state) {
    case HaloState::kPairing: return (now % 200) < 100;
    case HaloState::kReady: return (now % 400) < 200;
    case HaloState::kTyping: return true;
    case HaloState::kError: return (now % 180) < 90;
    case HaloState::kOff: return false;
  }
  return false;
}
