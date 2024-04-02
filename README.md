# Paper Template
Template repository to write academic research paper using markdown and generate PDF using Pandoc.

1. Create a new Github repository using this template by clicking `Use this template` →  `Create a new repository`.

2. After creating a new repository, enable `Workflow permissions` to `Read and write permissions` for your Github repository by going to `Settings` → `Actions` → `General`. This allows Github Actions to build PDF output and upload it to release.

## Steps for local build

- Update paper metadata `metadata.yaml`
- Update paper content `article.md`
- Update the citation `article.bibtex` and cite them in `article.md`. See [Pandoc guide on citation ](https://pandoc.org/chunkedhtml-demo/8.20-citation-syntax.html).
- Add images to `images` folder and include them in `article.md` as markdown iamges. See [Pandoc guide on images](https://pandoc.org/chunkedhtml-demo/8.17-images.html).
- Run the build `bash build.sh` to generate `article.pdf`

## Steps for Action build

- Commit your paper changes and push.
- If you have changed the following folders Github Action will perform `article.pdf` build. Due to large size of `texlive-full`, currently build takes anywhere between 6-8 minutes.
    - `paper/**`
    - `paper/images/**`
    - `csl/**`
    - `data/templates/**`
- On successful build `article.pdf` will be uploaded to `Releases` section of your Github repository. 


# Prerequisite
On Mac Install `texlive`, `pandoc` using `brew`,

```
brew install pandoc texlive graphviz
```

Install only required `texlive` packages,
```
sudo tlmgr install beamerarticle pgfpages amsmath amssymb setspace inputenc mathspec unicode-math lmodern xeCJK upquote parskip fancyvrb xcolor hang flushmargin bottom multiple adjustbox graphicx listings etoolbox fvextra multirow longtable booktabs array caption headsepline footsepline titling footnotebackref sourcesanspro mdframed csquotes pagecolor afterpage tikz hyperref bookmark biblatex selnolig natbib babel calc subcaption soul luacolor svg float ccicons datetime2 algorithm2e ifoddpage relsize neuralnetwork pgf
```

Alternatively, install `texlive-full`,

```
brew install pandoc texlive-full
```

Install Python packages using `pip` to run `panflute` filters.

```
pip install panflute graphviz

python3 -m pip install -U --no-cache-dir  \
            --config-settings="--global-option=build_ext" \
            --config-settings="--global-option=-I$(brew --prefix graphviz)/include/" \
            --config-settings="--global-option=-L$(brew --prefix graphviz)/lib/" \
            pygraphviz
```