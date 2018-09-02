#import <AudioToolbox/AudioServices.h>

%hook UIKeyboardTouchInfo
- (void)setInitialPoint:(CGPoint)arg1 {
	%orig;
	AudioServicesPlaySystemSound(1519);
}
%end