//Nathan Ingraham
// FSVideoOnlyMessages
// Instead of playing videos inline (in the bubble) in the messages app,
// this tweak will play them in full screen.

#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>

%hook CKUIBehavior
- (BOOL)canShowContactPhotosInConversationList{
	return TRUE;
}



- (BOOL)playsInlineVideo{
	return FALSE;
}

%end

%hook CKUIBehaviorPad
- (BOOL)canShowContactPhotosInConversationList{
	return TRUE;
}
%end

%hook CKUIBehaviorNano
- (BOOL)shouldShowContactPhotosInTranscript{
	return TRUE;
}
%end


NSString * settingsPath = @"/var/mobile/Library/Preferences/com.nathaningraham.fsonlymessagesprefs.plist";

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];


%hook SBHomeScreenViewController






BOOL userHasSeenPopup = [[prefs objectForKey:@"default"] boolValue]; //gets switch value to determine if user has seen the pop up before 




-(void)viewDidAppear:(BOOL)arg1{
  %orig();


// (void)registerBool:(BOOL *)prefs default:(BOOL)FALSE forKey:(NSString *)default{




  if (userHasSeenPopup == FALSE){
  UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Thanks for installng!"
                                 message:@"....and the bubble videos be gone! \n FSVideoOnlyMessages is my first tweak. \n Follow me on Twitter if you'd like to be up to date on my learning adventure! :-)"
                                 preferredStyle:UIAlertControllerStyleAlert]; //creates popup
 
   UIAlertAction* ok = [UIAlertAction
                        actionWithTitle:@"Sure! :-)"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action)
                        {

                  userHasSeenPopup = TRUE;
                 

                 
                   //sets the 
                  [prefs release];



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

   UIAlertAction* cancel = [UIAlertAction
                            actionWithTitle:@"No Thanks!"
                           style:UIAlertActionStyleDestructive
                           handler:^(UIAlertAction * action)
                           {
                           	userHasSeenPopup = TRUE;

                               [alert dismissViewControllerAnimated:YES completion:nil];
                               [prefs release];

                           }];

   [alert addAction:ok];
   [alert addAction:cancel];

   [self presentViewController:alert animated:YES completion:nil];
						}
						
}



%end

// %hook SBLockScreenViewController


// - (void)viewDidAppear:(_Bool)arg1;{


// }
