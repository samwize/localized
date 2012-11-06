//
//  NSString-Localized.h
//  JDLibrary
//
//  Created by Junda on 8/19/10.
//  Copyright 2010 Just2me. All rights reserved.
//

#import <Foundation/Foundation.h>

// Macro for localizing strings
#define Localized(key) [NSString localizedString:(key)]


// For string locationzation
@interface NSString(Localization)

// With string in string replacement. Replace format is ${...}.
// It will also look in Localizable2.strings if failed to find in Localizable.strings
+(NSString*)localizedString:(NSString *)key;

@end

