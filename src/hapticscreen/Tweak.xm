#import <AudioToolbox/AudioServices.h>

%hook UITouch
- (void) setTimestamp: (double)arg1 {
	if (![self timestamp]) {
		AudioServicesPlaySystemSound(1519);
	}
	%orig;
}
%end