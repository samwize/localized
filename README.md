Localized
=========================================

This project has 2 components:

1. `genstrings.py` - Replace Apple's closed sourced genstrings with a Python replacement

2. `NSString-Localized.h/m` - Provide iOS localization helper classes


Python genstrings
-----------------

Note: The python script `genstrings.py` is heavily copied from: https://github.com/dunkelstern/Cocoa-Localisation-Helper

Place the script `genstrings.py` in your Xcode project folder.

Run the script

	python genstrings.py

Or if you want to write to the `Localizable.strings` file,

	python genstrings.py > Localizable.strings


The script will read all `.m` files (including subdirectories), and scan for all `NSLocalizedString` and `Localized` codes.

The strings will be grouped by their `.m` filename (instead of alphabetically in Apple's genstrings tool), which makes much more sense!

It also scan for `Localized` code, which is a Macro for NSLocalizedString with recursive replacement. Read next section to find out more.



NSString-Localized
-------------------

`NSString-Localized.h/m` is a category for localization.

To use, add the 2 files to project, then import the class in your project pch file eg `MyApp_Prefix.pch`.

	#import "NSString-Localized.h"

Then to have a localizable string in code,

	myLabel.text = Localized("My Text");

As per normal, the localized text comes from `Localizable.strings`.

It provides the following functions:

- If you are like me, always using `nil` for comment, then you can leave the comment all out. 

- Last I counted, it shorten `NSLocalizedString` by 8 characters.

- It also read from another string table `Localizable2.strings`. This secondary file is useful if the main string table is used by another library. Or you could easily extend the code to read another string table.

- Recursive replacement. This is best illustrated with an example.

For example you have the following in `Localizable.strings`:

	"My Text" = "This is a ${fruit}"
	"fruit" = "orange"

`Localized("My Text")` will become "This is a orange".
