FROM ubuntu:24.04

ENV SRCDIR=/src
# Install dependencies for adding PPA and building Neovim
RUN apt-get update && \
    apt-get install -y software-properties-common wget curl && \
    # Add the Neovim PPA for stable releases
    add-apt-repository ppa:neovim-ppa/unstable -y && \
    # Update package list to include the new PPA
    apt-get update && \
    # Install Neovim from the PPA
    apt-get install -y curl wget \
        git unzip \
        neovim \
        luarocks nodejs npm \
        python3.12-venv \
        ripgrep \
        fzf \
        build-essential && \
    # Clean up to reduce image size
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -g 1100 dev && \
    useradd -m -u 1100 -g dev -s /usr/bin/bash dev

USER dev
WORKDIR $SRCDIR
RUN echo -n "[safe]\n    directory = $SRCDIR" >> .gitconfig
RUN echo -n "alias vi=/usr/bin/nvim\ntest -x $SRCDIR/.venv/bin/activate && source $SRCDIR/.venv/bin/activate" >> .bashrc
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    /home/dev/.local/bin/uv tool install ruff@latest

COPY --chown=dev . /home/dev/.config/nvim
# Verify installation
RUN nvim --headless "+Lazy! install" -c "sleep 20" +qa
# Workaround for  Mason async mode.
RUN nvim --headless +'lua require("mason").setup()' +'lua require("mason-lspconfig").setup({automatic_installation = true})' +qa #-c 'sleep 30' +qa
RUN nvim --headless +"MasonInstall --target=linux_x64_gnu lua-language-server basedpyright ruff stylua" +qa
# RUN nvim --headless -c 'set cmdheight=50' -c 'MasonToolsInstall' "+qa"
# RUN nvim --headless +MasonToolsInstall "+sleep 20" +qall
#RUN nvim --headless -c "sleep 60" +qall
#RUN nvim --headless +MasonToolsInstallSync +qa

# Set the default command to run Neovim
CMD ["/usr/bin/nvim"]
