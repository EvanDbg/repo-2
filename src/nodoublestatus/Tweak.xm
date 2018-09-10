#import "Header.h"

static UIStatusBar* statusBar;
static double standardHeight = 20;
static double defaultDoubleHeight = 40;
static UILabel* label;
static UIColor* color;

%hook CALayer
- (void) setMasksToBounds: (bool) flag {
	if (self == [label layer]) {
		flag = YES;
	}
	%orig;
}
%end

// %hook SBIconScrollView
// - (void) setFrame: (CGRect) frame {
// 	CGFloat minY = standardHeight + 2;
// 	if (![NSStringFromClass([self class]) isEqualToString: @"SBFloatyFolderScrollView"]
// 		&& frame.origin.y < minY) {
// 		frame.size.height -= minY - frame.origin.y;
// 		frame.origin.y = minY;
// 	}
// 	%orig(frame);
// }
// %end

%hook UIStatusBar
// + (double)_heightForStyle:(long long)arg1 orientation:(long long)arg2 forStatusBarFrame:(bool)arg3 {
// 	if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString: @"com.apple.springboard"]) {
// 		return 0;
// 	}
// 	return standardHeight;
// }

// - (double) heightForOrientation: (long long) arg1 {
// 	return [self _standardHeight];
// }
- (void)_adjustDoubleHeightTextVisibility {
	//nope
}

- (void) setFrame: (CGRect) frame {
	statusBar = self;
	frame.size.height = (CGFloat)[self _standardHeight];
	%orig(frame);
	object_getInstanceVariable(self, "_doubleHeightLabel", (void **) &label);

	standardHeight = [self _standardHeight];
	defaultDoubleHeight = [self defaultDoubleHeight];
	if (label) {
		CGRect labelFrame = [label frame];
		CGSize textSize = [[label text] sizeWithAttributes:@{NSFontAttributeName:[label font]}];
		CGFloat width = textSize.width + labelFrame.size.height;
		CGFloat centerX = labelFrame.origin.x + labelFrame.size.width / 2;
		labelFrame.size.width = width;
		labelFrame.origin.x = centerX - width / 2;
		labelFrame.origin.y = 1;
		[label setFrame: labelFrame];
		[[label layer] setCornerRadius: labelFrame.size.height / 2];
		[[label layer] setMasksToBounds: YES];
		object_getInstanceVariable(self, "_lastUsedBackgroundColor", (void **) &color);
		[label setBackgroundColor: color];
	}
}
%end

%hook UIStatusBarBackgroundView
- (void) setFrame: (CGRect) frame {
	%orig(CGRectMake(0, 0, 0, 0));
}
%end

%hook UIApplication
- (CGRect) statusBarFrame {
	CGRect frame = %orig;
	frame.size.height = standardHeight;
	return frame;
}
%end

%hook UIStatusBarServer
- (void)_receivedDoubleHeightStatus:(const char *)arg1 forStyle:(long long)arg2 {
	// nope
}
%end

%hook UIStatusBarStyleAttributes
- (bool)isDoubleHeight {
	return NO;
}
- (bool)isPulsingAnimationEnabled {
	return NO;
}
%end