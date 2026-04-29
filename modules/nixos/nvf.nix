{
  config,
  pkgs,
  inputs,
  ...
}:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim.theme.enable = true;
      vim.theme.name = "everforest";
      vim.theme.style = "hard";

      vim.languages = {

        enableLSP = true;
        enableTreesitter = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = [ "nixfmt" ];
          };
        };

      };

      vim.globals.mapleader = " ";
      vim.keymaps = [
        {
          mode = "n";
          key = "<leader>f";
          action = "<cmd>lua vim.lsp.buf.format()<CR>";
          desc = "Format file";
        }
      ];

      vim.filetree.nvimTree = {
        enable = true;
      };

      vim.statusline.lualine.enable = true;
      vim.telescope.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
    };
  };
}
