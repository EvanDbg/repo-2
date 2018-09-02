%hook SBIconScrollView
- (void) setAlwaysBounceHorizontal: (bool) bounces {
	%orig(NO);
}

- (void) setFrame: (CGRect) frame {
	frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
	%orig(frame);
}
%end