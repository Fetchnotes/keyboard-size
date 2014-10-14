#import "keyboard_size_EventListener.h"

@implementation keyboard_size_EventListener

//
// Here you can implement event listeners.
// These are functions which will get called when certain native events happen.
//

// The example below passes an event through to JavaScript when the application is resumed.
+ (void)applicationDidBecomeActive:(UIApplication *)application {
	// It is good practise to namespace any events you send to JavaScript with your module name
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardFrameChanged:)
                                                 name:UIKeyboardDidChangeFrameNotification object:nil];
}

+ (void)keyboardFrameChanged:(NSNotification*)notification {
    NSDictionary *info = [notification userInfo];

    CGFloat width = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.width;
    CGFloat height = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;

    [[ForgeApp sharedApp] event:@"keyboard_size.didChange" withParam:@{@"width": @(width), @"height": @(height)}];
}

@end
