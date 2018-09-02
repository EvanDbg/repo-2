%hook UIViewController
- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
	UIInterfaceOrientationMask orig = %orig;
	if (orig & UIInterfaceOrientationMaskPortrait) {
		return UIInterfaceOrientationMaskPortrait;
	} else {
		return UIInterfaceOrientationMaskLandscape;
	}
}
%end