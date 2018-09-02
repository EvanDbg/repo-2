%hook SBIconScrollView
- (void) setAlwaysBounceHorizontal: (bool) bounces {
	%orig(NO);
}

- (void) setFrame: (CGRect) frame {
	if (![NSStringFromClass([self class]) isEqualToString: @"SBFloatyFolderScrollView"]) {
		frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
	}
	%orig(frame);
}
%end

%hook SBIconParallaxBadgeView
- (void) setFrame: (CGRect) frame {
	CGFloat iconSize = [[self superview] frame].size.width;
	CGFloat badgeSize = 14;
	CGFloat badgeOffset = -3;
	frame.origin.x = iconSize - badgeSize / 2 + badgeOffset;
	frame.origin.y = 0 - badgeSize / 2 - badgeOffset;
	frame.size.width = badgeSize;
	frame.size.height = badgeSize;
	%orig(frame);
	[[self layer] setCornerRadius: badgeSize / 2];
	[[self layer] setShadowOpacity: 0.2];
	[[self layer] setShadowRadius: 2];
	[[self layer] setShadowOffset: CGSizeMake(0, 2)];
}
%end

%hook SBDarkeningImageView
- (void) addSubview: (UIView*) subView {
	// nope
} 
%end

%hook SBIconLegibilityLabelView
- (void) setFrame: (CGRect) frame {
	frame.origin.y += 3;
	%orig(frame);
}
%end