danirod's config for nvim
=========================

This readme is a work in progress. Expect typos and mistakes.

Dependencies
------------

In order to have a better experience, the following external tools should be
available when using some of the plugins included in this configuration file.

* **ctags** for proper support for tagbar and other plugins that work with
  tags. You should use universal-ctags because it's updated and it has support
  for new generation languages such as ECMAScript 6 or greater.
  <https://ctags.io>.

* **python-jedi** if you expect to deal with Python code, make sure jedi
  is on your PYTHONPATH. <https://jedi.readthedocs.org/>

* **javascript-typescript-langserver**. It worked for me better than ternjs.
  It uses the language server protocol.
  <https://www.npmjs.com/package/javascript-typescript-langserver>

* **vscode-css-languageserver-bin**. It seems to lint CSS code. Uses the same
  language server than VSCode. Install using npm install -g.
  <https://www.npmjs.com/package/vscode-css-languageserver-bin>.
