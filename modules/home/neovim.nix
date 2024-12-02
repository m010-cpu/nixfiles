{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      gcc
      gnumake
      python3
      nodejs_20
      go
      lua5_1

      luarocks
      tree-sitter

      texlab
      pylyzer
      lua-language-server
      gopls
      clang-tools
      nixd
      asm-lsp

      asmfmt
      alejandra
      rustfmt
      prettierd
      stylua
      isort
      black
      pylint
      eslint_d
      sqlfluff
    ];
  };
}
