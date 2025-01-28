{...}: {
  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;
    hostKeyAlgorithms = [
      "ssh-ed25519"
    ];
    pubkeyAcceptedKeyTypes = [
      "ssh-ed25519"
    ];
    kexAlgorithms = [
      "sntrup761x25519-sha512@openssh.com"
      "curve25519-sha256@libssh.org"
    ];
    ciphers = [
      "chacha20-poly1305@openssh.com"
      "aes256-gcm@openssh.com"
    ];
    macs = [
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256-etm@openssh.com"
    ];
  };
}
