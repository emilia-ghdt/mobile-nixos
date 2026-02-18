{ mobile-nixos
, fetchFromGitLab
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.18.2";
  configfile = ./config_from_pmos.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.18.2-r0";
    hash = "sha256-soYYU4xY18igqLw/FFv2QJmcV7bgiNDc8GwjKIBVSIc=";
  };

  patches = [
    # ASoC: codecs: tas2559: Fix build
    # (fetchpatch {
    #   url = "https://github.com/samueldr/linux/commit/d1b59edd94153ac153043fb038ccc4e6c1384009.patch";
    #   sha256 = "sha256-zu1m+WNHPoXv3VnbW16R9SwKQzMYnwYEUdp35kUSKoE=";
    # })
  ];

  isModular = false;
  isCompressed = "gz";
}
