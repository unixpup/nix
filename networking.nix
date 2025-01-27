{...}: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      ethernet = {
        macAddress = "random";
      };
      wifi = {
        backend = "iwd";
        macAddress = "random";
      };
    };

    nameservers = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
    ];
    firewall = {
      enable = true;
    };
    nftables = {
      enable = true;
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
    ];
    dnsovertls = "true";
    llmnr = "true";
  };
}

