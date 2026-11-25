# Dispatch one build: just build https://git.bioconductor.org/packages/BiocBaseUtils
build repository ref="devel" skip="":
    gh workflow run build-package.yml -f repository={{repository}} -f ref={{ref}} -f skip="{{skip}}"

# Dispatch a build per line of packages.txt (name, optional ref)
build-all:
    while read -r pkg ref; do just build "https://git.bioconductor.org/packages/$pkg" "${ref:-devel}"; done < packages.txt

# Recent runs
runs:
    gh run list --workflow build-package.yml --limit 10

# Download every artifact of a run into runs/<id>/
fetch id:
    gh run download {{id}} --dir runs/{{id}}
