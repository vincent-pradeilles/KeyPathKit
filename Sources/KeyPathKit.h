//
//  KeyPathKit.h
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

#define TARGET_OS_OSX (!(TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH))
#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

//! Project version number for KeyPathKit.
FOUNDATION_EXPORT double KeyPathKitVersionNumber;

//! Project version string for KeyPathKit.
FOUNDATION_EXPORT const unsigned char KeyPathKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <KeyPathKit/PublicHeader.h>


