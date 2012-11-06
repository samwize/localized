genstrings
=========================================

This project has 2 components:

1. Replace Apple's closed sourced genstrings with a Python replacement - `genstrings.py`

2. Provide localization helper classes - `NSString-Localized.h/m`


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

To use, import the class in your app's pch file eg `MyApp_Prefix.pch`.

	#import "NSString-Localized.h"

Then to have a localizable string in code,

	myLabel.text = Localized("My Text");

As per normal, the localized text comes from `Localizable.strings`.

It provides the following values:

- If you are like me, always using `nil` for comment, then you can leave the comment all out. 

- Last I counted, it shorten `NSLocalizedString` by 8 characters.

- It also read from another string table `Localizable2.strings`. This secondary file is useful if the main string table is used by another library. Or you could extend the code to read another string table.

- Recursive replacement. This is best illustrated with an example.

For example you have the following in `Localizable.strings`:

	"My Text" = "This is a ${fruit}"
	"fruit" = "orange"

`Localized("My Text")` will become "This is a orange".
