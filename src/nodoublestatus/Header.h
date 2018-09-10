
#import <AudioToolbox/AudioServices.h>

@interface UIStatusBar {
  UILabel* _doubleHeightLabel;
}
- (id)_backgroundView;
- (bool)isDoubleHeight;
- (double)_standardHeight;
- (double)defaultDoubleHeight;
- (void)_clearOverrideHeight;
- (long long)currentStyle;
- (void)_updateUIWithStyleAttributes:(id)arg1 animationParameters:(id)arg2 forced:(bool)arg3;
@end

@interface UIStatusBarStyleAttributes
@end

@interface UIStatusBarForegroundStyleAttributes
- (id)textColorForStyle:(long long)arg1;
@end


// static void shake(bool type) {
//     AudioServicesPlaySystemSound(type ? 1520 : 1521);
// }

    // static UIViewController* topViewController(UIViewController* vc) {
    //   if ([vc isKindOfClass:[UITabBarController class]]) {
    //     return topViewController([(UITabBarController*)vc
    //     selectedViewController]);
    //   } else {
    //     return vc;
    //   }
    // }

    // static UIViewController* topmostViewController() {
    //     UIViewController* resultVC = topViewController([[UIApplication
    //     sharedApplication].keyWindow rootViewController]); while
    //     (resultVC.presentedViewController) {
    //         resultVC = topViewController(resultVC.presentedViewController);
    //     }
    //     return resultVC;
    // }

    typedef struct {
  unsigned deactivatingReasonFlags : 13;
  unsigned isLaunchedSuspended : 1;
  unsigned calledNonSuspendedLaunchDelegate : 1;
  unsigned calledSuspendedLaunchDelegate : 1;
  unsigned isHandlingURL : 1;
  unsigned statusBarShowsProgress : 1;
  unsigned statusBarHidden : 1;
  unsigned statusBarHiddenDefault : 1;
  unsigned statusBarHiddenVerticallyCompact : 1;
  unsigned blockInteractionEvents : 4;
  unsigned receivesMemoryWarnings : 1;
  unsigned showingProgress : 1;
  unsigned receivesPowerMessages : 1;
  unsigned launchEventReceived : 1;
  unsigned activateEventReceived : 1;
  unsigned systemIsAnimatingApplicationLifecycleEvent : 1;
  unsigned isActivating : 1;
  unsigned shouldExitAfterSendSuspend : 1;
  unsigned terminating : 1;
  unsigned isHandlingShortCutURL : 1;
  unsigned idleTimerDisabled : 1;
  unsigned deviceOrientation : 3;
  unsigned delegateHandleOpenURL : 1;
  unsigned delegateOpenURL : 1;
  unsigned delegateOpenURLOptions : 1;
  unsigned delegateDidReceiveMemoryWarning : 1;
  unsigned delegateWillTerminate : 1;
  unsigned delegateSignificantTimeChange : 1;
  unsigned delegateWillChangeInterfaceOrientation : 1;
  unsigned delegateDidChangeInterfaceOrientation : 1;
  unsigned delegateWillChangeStatusBarFrame : 1;
  unsigned delegateDidChangeStatusBarFrame : 1;
  unsigned delegateDeviceAccelerated : 1;
  unsigned delegateDeviceChangedOrientation : 1;
  unsigned delegateDidBecomeActive : 1;
  unsigned delegateWillResignActive : 1;
  unsigned delegateDidEnterBackground : 1;
  unsigned delegateDidEnterBackgroundWasSent : 1;
  unsigned delegateWillEnterForeground : 1;
  unsigned delegateWillSuspend : 1;
  unsigned delegateDidResume : 1;
  unsigned delegateSupportsStateRestoration : 1;
  unsigned delegateSupportedInterfaceOrientations : 1;
  unsigned delegateNormativeWhitePointAdaptation : 1;
  unsigned delegateHandleSiriTask : 1;
  unsigned delegateSupportsWatchKitRequests : 1;
  unsigned delegateSupportsIntentForwarding : 1;
  unsigned idleModeVisualEffectsEnabled : 1;
  unsigned userDefaultsSyncDisabled : 1;
  unsigned headsetButtonClickCount : 4;
  unsigned isHeadsetButtonDown : 1;
  unsigned isFastForwardActive : 1;
  unsigned isRewindActive : 1;
  unsigned shakeToEdit : 1;
  unsigned zoomInClassicMode : 1;
  unsigned ignoreHeadsetClicks : 1;
  unsigned touchRotationDisabled : 1;
  unsigned taskSuspendingUnsupported : 1;
  unsigned taskSuspendingOnLockUnsupported : 1;
  unsigned isUnitTests : 1;
  unsigned requiresHighResolution : 1;
  unsigned singleUseLaunchOrientation : 3;
  unsigned defaultInterfaceOrientation : 3;
  unsigned supportedInterfaceOrientationsMask : 5;
  unsigned delegateWantsNextResponder : 1;
  unsigned delegateWantsStatusBarTouchesEnded : 1;
  unsigned interfaceLayoutDirectionIsValid : 1;
  unsigned interfaceLayoutDirection : 3;
  unsigned restorationExtended : 1;
  unsigned normalRestorationInProgress : 1;
  unsigned normalRestorationCompleted : 1;
  unsigned isDelayingTintViewChange : 1;
  unsigned isUpdatingTintViewColor : 1;
  unsigned isHandlingMemoryWarning : 1;
  unsigned forceStatusBarTintColorChanges : 1;
  unsigned disableLegacyAutorotation : 1;
  unsigned couldNotRestoreStateWhenLocked : 1;
  unsigned disableStyleOverrides : 1;
  unsigned legibilityAccessibilitySettingEnabled : 1;
  unsigned viewControllerBasedStatusBarAppearance : 1;
  unsigned fakingRequiresHighResolution : 1;
  unsigned isStatusBarFading : 1;
  unsigned systemWindowsSecure : 1;
  unsigned isFrontBoardForeground : 1;
  unsigned appSwitcherLayoutState : 2;
  unsigned isObservingPIP : 1;
  unsigned shouldRestoreKeyboardInputState : 1;
  unsigned subclassOverridesInterfaceOrientation : 1;
  unsigned isResigningActive : 1;
  unsigned receivedUnhandledMenuButton : 1;
  unsigned disablingBecomeFirstResponder : 1;
} UIApplicationFlags;