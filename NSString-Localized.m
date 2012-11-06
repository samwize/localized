//
//  NSString-Localized.h
//  JDLibrary
//
//  Created by Junda on 8/19/10.
//  Copyright 2010 Just2me. All rights reserved.
//

#pragma mark For localization

@implementation NSString(Localization)

+(NSString*)localizedString:(NSString *)key {
	NSString* s = [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"Localizable2"];
	if ([s isEqualToString:key])
		s = [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil];
	// We look recursively for ${...}
	while ([s rangeOfString:@"${"].location != NSNotFound) {
		NSRange r1, t, s2r;
		r1 = [s rangeOfString:@"${"];
		NSUInteger i1 = r1.location;
		t.location = r1.location;
		t.length = [s length] - r1.location;
		NSUInteger i2 = [s rangeOfString:@"}" options:NSLiteralSearch range:t].location;
		// We now replace the string between i1 and i2
		// Make s2r range from ${ to },
		s2r.location = i1+2;
		s2r.length = i2 - i1 - 2;
		// s2 is the localized with replacement
		NSString *subkey = [s substringWithRange:s2r];
		NSString *s2 = [[NSBundle mainBundle] localizedStringForKey:(subkey) value:@"" table:@"Localizable2"];
		if ([s2 isEqualToString:subkey])
            s2 = [[NSBundle mainBundle] localizedStringForKey:(subkey) value:@"" table:nil];
		// Make s2r range from ${ to }
		s2r.location = i1;
		s2r.length = i2 - i1 + 1;
		s = [s stringByReplacingCharactersInRange:s2r withString:s2];
	}
	return s;
}

@end