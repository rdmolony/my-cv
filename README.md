# My CV

I put together a CV in `LaTEX` because CVs are still expected to be static documents (i.e. rendered to `pdf` or printed) & `LaTEX` is a great tool for making beautiful documents. 

> [!NOTE]
> [The initial version](https://github.com/rdmolony/my-cv/commit/13640bcdd951764217280e42b570b76783d4c1b2) was based on a template created by my friend [odowdneil@gmail.com](mailto:odowdneil@gmail.com)

---


## Install

- Install `nix` via ...


  - [`DeterminateSystems/nix-installer`](https://github.com/DeterminateSystems/nix-installer) ...


  ```sh
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  ```



---


## Render a `pdf`

Via ...


- [`VSCode`](https://code.visualstudio.com/download) with extension [`James-Yu/LaTeX-Workshop`](https://github.com/James-Yu/LaTeX-Workshop)

  - Open your `.tex` file
  - Run `Build Latex Project`

> [!TIP]
> How does this work?
> 
> - `VSCode` automatically detects the workspace settings for this repo in `.vscode/settings.json`, and registers the tools defined here with the [`James-Yu/LaTeX-Workshop`](https://github.com/James-Yu/LaTeX-Workshop) extension
> - `.vscode/settings.json` defines a command like `nix run .#latexmk <arguments>` which builds an environment in which all external dependencies are installed before running the command.

- `nix` directly

```sh
nix run .#latexmk -- \
  -synctex=1 \
  -interaction=nonstopmode \
  -file-line-error \
  -lualatex \
  -output-directory=./out \
  ./Recettes.tex
```


---


## Develop

Create a developer environment (in which all dependencies are installed) via ...

- `nix` directly ...

```sh
nix develop
```

- Automatically via `direnv` (or [nix-community/nix-direnv](https://github.com/nix-community/nix-direnv)) **to activate this environment on `cd`'ing to this directory**
