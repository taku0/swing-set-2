## Nix expression for SwingSet2 demo in JDK

This Nix expression builds the SwingSet2 demo with JDK 8.  Intended to test JDK packages in the Nixpkgs.

### How to run

```
nix-build default.nix
java -jar result/SwingSet2.jar
```

# License

This Nix expression is licensed under the [MIT License](COPYING).

SwingSet2 itself is licensed under the GNU General Public License, version 2, with the Classpath Exception.
