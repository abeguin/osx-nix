{ ... }:
let meli = builtins.toPath ./meli;
in { xdg.configFile."meli/" = { source = meli; }; }
