#include "../src/halo_indicator.h"
#include <assert.h>
#include <stdint.h>

int main() {
  // Connection status must not become a false instruction to press SEND.
  for (uint32_t t = 0; t < 2400; ++t) {
    assert(!haloIndicatorOn(HaloState::kOff, t));
    assert(haloIndicatorOn(HaloState::kTyping, t));
  }
  assert(haloIndicatorOn(HaloState::kReady, 199));
  assert(!haloIndicatorOn(HaloState::kReady, 200));
  assert(!haloIndicatorOn(HaloState::kReady, 399));
  assert(haloIndicatorOn(HaloState::kReady, 400));
  assert(haloIndicatorOn(HaloState::kPairing, 99));
  assert(!haloIndicatorOn(HaloState::kPairing, 100));
  assert(haloIndicatorOn(HaloState::kPairing, 200));
  assert(haloIndicatorOn(HaloState::kError, 89));
  assert(!haloIndicatorOn(HaloState::kError, 90));
  assert(haloIndicatorOn(HaloState::kError, 180));
  assert(!haloIndicatorOn(HaloState::kOff, UINT32_MAX));
}
