#define kRWSettingsPath @"/var/jb/var/mobile/Library/Preferences/com.lizynz.colorfont2.plist"

@interface _UILegibilitySettings : NSObject
- (double)shadowAlpha;
@end

%hook _UILegibilitySettings
- (int)style {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:kRWSettingsPath];

    if ([[prefs objectForKey:@"WhiteColor"] boolValue]) {
        return 1;
    }
    
    if ([[prefs objectForKey:@"BlackColor"] boolValue]) {
        return 2;
    }
    
    return %orig;
}

%end

%hook _UILegibilitySettings
- (double)shadowAlpha {
    CGFloat alpha = 0;
    return alpha;
}

- (id)initWithStyle:(int)arg1 contentColor:(id)arg2{
    id view = %orig;
    
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:kRWSettingsPath];
    
    if ([[prefs objectForKey:@"WhiteColor"] boolValue]) {
        arg2 = nil;
        %orig(arg1,arg2);
    } 
    
    if ([[prefs objectForKey:@"BlackColor"] boolValue]) {
        arg2 = nil;
        %orig(arg1,arg2);
    }

    if ([[prefs objectForKey:@"Chameleon"] boolValue]) {
        arg1 = 2;
        %orig(arg1,arg2);
    }
    
    return view;
}

%end
