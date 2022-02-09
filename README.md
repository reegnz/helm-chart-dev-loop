# Helm chart development flow

## Usage

Run `make watch` and then open `out/renderet-template.yaml`
and any other file in the chart.

When you edit chart files, the changes will be reflected instantly in the
output file.

## Goals

### Achieving a tight feedback loop

Whenever I make changes to any of the files in the helm chart, I want to 
have instant feedback on how that change influences potential outputs.

This results in an editing experience that's very similar to a REPL.

### Have test cases for helm charts

There should be test-cases with different values.yaml files where we can
declaratively define what template output we'd expect for a given input config.


## Putting it all together

### Building a feedback loop with file watches

Using [watchman](https://facebook.github.io/watchman/) we can have a command
trigger whenever files have been modified on disk.
For helm that command would be 'helm template' and that renders the chart
which we can then save to disk.

The other side of the feedback-loop is the editor. You need an editor that can
pick up changes to a file outside the editor.
Both vscode and vim are up to the task, vscode works out of the box, while vim
needs some extra config for that to work:

```vim
set updatetime=1000
set autoread
augroup autoread_changes
  au BufEnter,FocusGained,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
augroup END
```
