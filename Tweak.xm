%hook UIKeyboardImpl
+(UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(NSInteger)orientation inputMode:(id)mode {
    UIEdgeInsets orig = %orig;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *ColorBoard = @"/Library/MobileSubstrate/DynamicLibraries/ColorBoard.dylib";
    NSString *KeyboardColorXII = @"/Library/MobileSubstrate/DynamicLibraries/keyboardColorXII.dylib";
    if ([fileManager fileExistsAtPath:ColorBoard]){
        orig.bottom = 60;
    }
    else if([fileManager fileExistsAtPath:KeyboardColorXII])
    {
        orig.bottom = 70;
    }
    else
    {
        orig.bottom = 48;
    }
    return orig;
}
%end

%hook UIKeyboardDockView
- (CGRect)bounds {
    CGRect bounds = %orig;
    if (bounds.origin.y == 0) {
        bounds.origin.y -=12;
    }
    return bounds;
}
- (void)layoutSubviews {
    %orig;
}

%end
