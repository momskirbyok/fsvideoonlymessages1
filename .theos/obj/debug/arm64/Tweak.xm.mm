#line 1 "Tweak.xm"





#include <logos/logos.h>
#include <substrate.h>
@class SpringBoard; @class CKUIBehaviorPad; @class CKUIBehavior; @class CKUIBehaviorNano; 
static BOOL (*_logos_orig$_ungrouped$CKUIBehavior$canShowContactPhotosInConversationList)(CKUIBehavior*, SEL); static BOOL _logos_method$_ungrouped$CKUIBehavior$canShowContactPhotosInConversationList(CKUIBehavior*, SEL); static BOOL (*_logos_orig$_ungrouped$CKUIBehavior$playsInlineVideo)(CKUIBehavior*, SEL); static BOOL _logos_method$_ungrouped$CKUIBehavior$playsInlineVideo(CKUIBehavior*, SEL); static BOOL (*_logos_orig$_ungrouped$CKUIBehaviorPad$canShowContactPhotosInConversationList)(CKUIBehaviorPad*, SEL); static BOOL _logos_method$_ungrouped$CKUIBehaviorPad$canShowContactPhotosInConversationList(CKUIBehaviorPad*, SEL); static BOOL (*_logos_orig$_ungrouped$CKUIBehaviorNano$shouldShowContactPhotosInTranscript)(CKUIBehaviorNano*, SEL); static BOOL _logos_method$_ungrouped$CKUIBehaviorNano$shouldShowContactPhotosInTranscript(CKUIBehaviorNano*, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFInishLaunching$)(SpringBoard*, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFInishLaunching$(SpringBoard*, SEL, id); 

#line 6 "Tweak.xm"

static BOOL _logos_method$_ungrouped$CKUIBehavior$canShowContactPhotosInConversationList(CKUIBehavior* self, SEL _cmd){
	return TRUE;
}



static BOOL _logos_method$_ungrouped$CKUIBehavior$playsInlineVideo(CKUIBehavior* self, SEL _cmd){
	return FALSE;
}




static BOOL _logos_method$_ungrouped$CKUIBehaviorPad$canShowContactPhotosInConversationList(CKUIBehaviorPad* self, SEL _cmd){
	return TRUE;
}



static BOOL _logos_method$_ungrouped$CKUIBehaviorNano$shouldShowContactPhotosInTranscript(CKUIBehaviorNano* self, SEL _cmd){
	return TRUE;
}




static void _logos_method$_ungrouped$SpringBoard$applicationDidFInishLaunching$(SpringBoard* self, SEL _cmd, id arg1){

UIAlertController * alert = [UIAlertController
							alertControllerWithTitle:@"FSVideoOnlyMessages"
							message:@"Thank you for installing my tweak! I hope you like it. 
							Feel free to follow me on twitter  at NathanIngraham"
							preferredStyle:UIAlertControllerStyleAlert];
UIAlertAction* follow = [UIAlertAction
                        actionWithTitle:@"Follow"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action)
                        {

                        	NSString *user = @"NathanIngraham";
    							if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    							else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    							else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    							else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    							else
        						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];

                            [alert dismissViewControllerAnimated:YES completion:nil];
                             
                        }];
   UIAlertAction* decline = [UIAlertAction
                            actionWithTitle:@"No Thanks"
                           style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action)
                           {


                               [alert dismissViewControllerAnimated:YES completion:nil];
                                                       
                           }];
    
   [alert addAction:follow];
   [alert addAction:decline];
    
   [self presentViewController:alert animated:YES completion:nil];


}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CKUIBehavior = objc_getClass("CKUIBehavior"); if (_logos_class$_ungrouped$CKUIBehavior) {if (class_getInstanceMethod(_logos_class$_ungrouped$CKUIBehavior, @selector(canShowContactPhotosInConversationList))) {MSHookMessageEx(_logos_class$_ungrouped$CKUIBehavior, @selector(canShowContactPhotosInConversationList), (IMP)&_logos_method$_ungrouped$CKUIBehavior$canShowContactPhotosInConversationList, (IMP*)&_logos_orig$_ungrouped$CKUIBehavior$canShowContactPhotosInConversationList);} else {HBLogError(@"logos: message not found [%s %s]", "CKUIBehavior", "canShowContactPhotosInConversationList");}} else {HBLogError(@"logos: nil class %s", "CKUIBehavior");}if (_logos_class$_ungrouped$CKUIBehavior) {if (class_getInstanceMethod(_logos_class$_ungrouped$CKUIBehavior, @selector(playsInlineVideo))) {MSHookMessageEx(_logos_class$_ungrouped$CKUIBehavior, @selector(playsInlineVideo), (IMP)&_logos_method$_ungrouped$CKUIBehavior$playsInlineVideo, (IMP*)&_logos_orig$_ungrouped$CKUIBehavior$playsInlineVideo);} else {HBLogError(@"logos: message not found [%s %s]", "CKUIBehavior", "playsInlineVideo");}} else {HBLogError(@"logos: nil class %s", "CKUIBehavior");}Class _logos_class$_ungrouped$CKUIBehaviorPad = objc_getClass("CKUIBehaviorPad"); if (_logos_class$_ungrouped$CKUIBehaviorPad) {if (class_getInstanceMethod(_logos_class$_ungrouped$CKUIBehaviorPad, @selector(canShowContactPhotosInConversationList))) {MSHookMessageEx(_logos_class$_ungrouped$CKUIBehaviorPad, @selector(canShowContactPhotosInConversationList), (IMP)&_logos_method$_ungrouped$CKUIBehaviorPad$canShowContactPhotosInConversationList, (IMP*)&_logos_orig$_ungrouped$CKUIBehaviorPad$canShowContactPhotosInConversationList);} else {HBLogError(@"logos: message not found [%s %s]", "CKUIBehaviorPad", "canShowContactPhotosInConversationList");}} else {HBLogError(@"logos: nil class %s", "CKUIBehaviorPad");}Class _logos_class$_ungrouped$CKUIBehaviorNano = objc_getClass("CKUIBehaviorNano"); if (_logos_class$_ungrouped$CKUIBehaviorNano) {if (class_getInstanceMethod(_logos_class$_ungrouped$CKUIBehaviorNano, @selector(shouldShowContactPhotosInTranscript))) {MSHookMessageEx(_logos_class$_ungrouped$CKUIBehaviorNano, @selector(shouldShowContactPhotosInTranscript), (IMP)&_logos_method$_ungrouped$CKUIBehaviorNano$shouldShowContactPhotosInTranscript, (IMP*)&_logos_orig$_ungrouped$CKUIBehaviorNano$shouldShowContactPhotosInTranscript);} else {HBLogError(@"logos: message not found [%s %s]", "CKUIBehaviorNano", "shouldShowContactPhotosInTranscript");}} else {HBLogError(@"logos: nil class %s", "CKUIBehaviorNano");}Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); if (_logos_class$_ungrouped$SpringBoard) {if (class_getInstanceMethod(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFInishLaunching:))) {MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFInishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFInishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFInishLaunching$);} else {HBLogError(@"logos: message not found [%s %s]", "SpringBoard", "applicationDidFInishLaunching:");}} else {HBLogError(@"logos: nil class %s", "SpringBoard");}} }
#line 86 "Tweak.xm"
