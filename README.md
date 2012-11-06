localized - Apple's genstrings in Python
=========================================

Usage
------

Place the script `localized.py` in your Xcode project folder.

Run the script

	python localized.py

Or if you want to write to the `Localization.strings` file,

	python localized.py > Localization.strings


What it does?
-------------

The script will read all `.m` files, and scan for all `NSLocalizedString` and `Localized` codes.

The strings will be grouped by their `.m` filename (instead of alphabetically in Apple's genstrings tool), which makes much more sense!

It scan for `Localized` code, which is a Macro for NSLocalizedString with recursive replacement and optional comment


Inspiration
-----------

The python script `localized.py` is heavily copied from: https://github.com/dunkelstern/Cocoa-Localisation-Helper
