# checkshasum.yazi

Execute `sha256sum` on the hovered file to check sum. 

## Installation

```sh
ya pack -a Good1Cheese/checkshasum
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = [ "C" ]
run  = "plugin checkshasum"
desc = "Check file vs clipboard sum"
```

OR
```
{ on = [ "C" ], run = "plugin checkshasum", desc = "Check file vs clipboard sum" },
```

Make sure the <kbd>C</kbd> key is not used elsewhere.

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
