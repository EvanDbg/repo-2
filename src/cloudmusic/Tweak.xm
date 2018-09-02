%hook MTAnimatedLabel
- (void) setText: (id) text {
	%orig(@"");
}
%end

%hook NMVisualEffect
- (void) setFeeType: (unsigned long long) type {
	%orig(0);
}

- (unsigned long long) feeType {
	return 0;
}
%end

%hook NMCustomEffect
- (void) setFeeType: (unsigned long long) type {
	%orig(0);
}

- (unsigned long long) feeType {
	return 0;
}
%end

%hook NMPlayView
- (void) setBackgroundImage: (id) image {
	%orig(nil);
}
%end

%hook NMPlayPageView
+ (CGSize) coverSize: (bool) arg1 visualizationEnabled: (bool) enabled visualizationType: (long long) type {
	CGSize orig = %orig;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	orig.width = width * 0.8;
	orig.height = width * 0.8;
	return orig;
}

+ (CGSize) diskSize {
	CGSize orig = %orig;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	orig.width = width * 0.8;
	orig.height = width * 0.8;
	return orig;
}

+ (double) topMargin:(bool) arg1 visualizationEnabled: (bool) enabled {
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	return %orig(arg1, false) - width * 0.14;
}
%end

%hook NMLyricModel
- (long long) offset {
	return %orig + 500;
}
%end

%hook NMBarButtonItem
+ (id) effectBarButtonItemWithTarget: (id) target action: (SEL) action {
	return nil;
}
%end

%hook MCMarqueeLabel
- (void) setFrame: (CGRect) frame {
	CGFloat centerX = frame.size.width / 2 + frame.origin.x;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	frame.size.width = width - 120;
	frame.origin.x = centerX - frame.size.width / 2;
	%orig(frame);
}
%end

%hook UIView
- (void) setFrame: (CGRect) frame {
	%orig;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	if (
		(frame.size.width == width && frame.size.height > 0 && frame.size.height < 1) ||
		(frame.size.width == 111 && frame.size.height == 183)
	) {
		[self setHidden: YES];
	}
}
%end