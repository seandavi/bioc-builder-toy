# bioc-builder-toy

A toy: build any R package from a git URL on GitHub Actions, using
[r-universe's reusable `build.yml`](https://github.com/r-universe-org/workflows/blob/v3/.github/workflows/build.yml)
without a universe monorepo or r-universe's deploy step.

One dispatch runs the full r-universe matrix: source package and vignettes,
R CMD check and binaries on Linux, Windows and macOS, WebAssembly, and BiocCheck.
Results stay as run artifacts (`package-*`, `bioc-checks`, `result`).

```sh
just build https://git.bioconductor.org/packages/BiocBaseUtils   # one package, devel
just build https://github.com/you/pkg main "macos windows wasm"   # GitHub repo, Linux only
just build-all                                                    # every line in packages.txt
just runs; just fetch <run-id>
```

Dependencies still come from `bioc.r-universe.dev` (`universe: bioc`), and
`build.yml` is pinned to a commit; bump it deliberately.
