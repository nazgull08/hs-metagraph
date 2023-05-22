let
  myNixPkgs = import <nixpkgs> {
    overlays = [myNixPkgsOverlay];
  };

  myNixPkgsOverlay = (nixSelf: nixSuper: {
    myHaskellPackages = nixSelf.haskellPackages.override (oldHaskellPkgs: {
      overrides = nixSelf.lib.composeExtensions (oldHaskellPkgs.overrides or (_: _: {}))  myHaskellPkgsOverlay;
    });
  });

  myHaskellPkgsOverlay = (hSelf: hSuper: {
    relapse = myNixPkgs.haskell.lib.dontCheck hSuper.relapse;
    hs-metagraph = hSelf.callCabal2nix "hs-metagraph" ./. {};
    mkDerivation = args: hSuper.mkDerivation (args // {
    });
  });
in
myNixPkgs.myHaskellPackages.hs-metagraph.env

