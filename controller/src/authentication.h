#pragma once

#include <string>

inline bool isLowerHex(const std::string &value, size_t length) {
  if (value.size() != length) return false;
  for (char c : value) if (!((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'))) return false;
  return true;
}

// Identical UTF-8 transcript in the browser and firmware. Roles prevent a
// device proof from being reflected back as a valid client response.
inline std::string authenticationMessage(const std::string &role, const std::string &clientId,
                                         const std::string &clientNonce, const std::string &deviceNonce) {
  return "airgap-v3 " + role + " " + clientId + " " + clientNonce + " " + deviceNonce;
}
