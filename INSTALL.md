## Installation

The installation process was full of trial and error for me and I don't fully remember which commands worked and which dependencies I already had. You might find the following references helpful:

- Original al-folio template [installation guide](https://github.com/alshedivat/al-folio/blob/main/INSTALL.md)
- [Jekyll installation instructions](https://jekyllrb.com/docs/installation/macos/)
- The "Running locally" section from `academicpages.github.io` [README](https://github.com/academicpages/academicpages.github.io?tab=readme-ov-file#running-locally)
- [Legacy al-folioinstallation guide](https://george-gca.github.io/blog/2022/running-local-al-folio/) for the local setup method

I did the local setup (mac) method that's no longer officially supported by the original template. In the future, we might want to shift to the new recommended method from the original template using containers.

### Local setup (Mac)

1. Install `Homebrew`:
   ```zsh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install `chruby` and `Ruby`:

   ```zsh
   brew install chruby ruby-install
   brew install ruby
   ```

   > ##### TIP
   >
   > Note: The command `ruby-install ruby 3.3.5` from [Jekyll installation instructions](https://jekyllrb.com/docs/installation/macos/) did not work for me. I had to install `Ruby` using `Homebrew`.

   Follow instructions on the terminal during installation above and configure the shell properly to use the installed Ruby. Here's an example of edits made to my `.zshrc` file:

   ```zsh
   export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
   export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
   source /opt/homebrew/opt/chruby/share/chruby/auto.sh
   ```

3. Install `Bundler`:
   ```zsh
   gem install bundler
   ```
4. Fork and clone the repository and install dependencies:
   ```zsh
   git clone <your-forked-repo-url>
   cd <folder-name>
   bundle install
   ```
5. The website supports Jupyter notebooks and currently has an example post from the [original template](https://alshedivat.github.io/al-folio/blog/2023/jupyter-notebook/) using it. Install the necessary Python packages:
   ```zsh
   pip install jupyter
   ```
6. To have consistent code formatting (required by the CI workflow inherited from the original template), install `prettier` and `pre-commit`:

   ```zsh
   # npm install --save-dev --save-exact prettier
   pip install pre-commit
   pre-commit install
   ```
   It doesn't look like we have code-heavy content, so I am commenting out prettier related section here
   to make things simpler. When making commits, you can specify `skip prettier` anywhere in the commit message to skip the prettier check.
   ~~You can follow the official instructions [here for prettier](https://prettier.io/docs/en/install) (Note that this repo already has a `.prettierrc` and a `.prettierignore` file) and [here for pre-commit](https://pre-commit.com/#install) for installation and usage.~~

7. Run the website locally:

   ```zsh
   bundle exec jekyll serve
   ```

   To see the template running, open your browser and go to `http://localhost:4000`.

   > ##### TIP
   >
   > If you encounter issues related to `Imagemagick`, you can install it using `Homebrew`:
   >
   > ```
   > brew install imagemagick
   > ```
   >
   > It's normal to see `ImageMagick` related or potentially other warnings when running `bundle exec jekyll serve`. These are generally harmless and can be ignored, as long as it doesn't exit
   and in the end you see something like "Server address: ".

   > ##### TIP
   >
   > If you modify the overall configuration in `_config.yml`, you need to run `bundle exec jekyll serve` to see the changes you've made. Other changes can be viewed immediately after saving the file.

   > ##### TIP
   >
   > If you have successfully tested the website locally before, and now you are seeing `Gem::GemNotFoundException`, it might be because you opened a new terminal window and you need
   to source the `~/.zshrc` file again.
