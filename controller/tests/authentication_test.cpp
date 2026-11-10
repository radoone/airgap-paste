#include "../src/authentication.h"
#include <cassert>

int main() {
  const std::string id = "0123456789abcdef";
  const std::string clientNonce(32, '0');
  const std::string deviceNonce(32, '1');
  assert(isLowerHex(id, 16));
  assert(!isLowerHex("0123456789abcdeF", 16));
  assert(!isLowerHex(id + "0", 16));
  assert(!isLowerHex("not-hex", 16));
  assert(authenticationMessage("device", id, clientNonce, deviceNonce) ==
         "airgap-v3 device 0123456789abcdef 00000000000000000000000000000000 11111111111111111111111111111111");
  assert(authenticationMessage("client", id, clientNonce, deviceNonce) !=
         authenticationMessage("device", id, clientNonce, deviceNonce));
  assert(authenticationMessage("device", id, clientNonce, deviceNonce) !=
         authenticationMessage("device", id, deviceNonce, clientNonce));
}
