//Nathan Ingraham
// FSVideoOnlyMessages
// Instead of playing videos inline (in the bubble) in the messages app,
// this tweak will play them in full screen.

#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>

BOOL firstInstall = YES;
BOOL receivedPopup;
BOOL userHasSeenTwitter;

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

%hook SBHomeScreenViewController
-(void)viewDidAppear:(bool)arg1 {
%orig();
   
   NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nathan.fsvideomessagesprefs.plist"];
   NSMutableDictionary *mutableDict = dict ? [[dict mutableCopy] autorelease] : [NSMutableDictionary dictionary];
   firstInstall = ([mutableDict objectForKey:@"firstInstall"] ? [[mutableDict objectForKey:@"firstInstall"] boolValue] : firstInstall); 
 
 
 
 
if (firstInstall == YES){
 
  UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Thanks for installing FSVideoOnlyMessages V 1.3!"
                                 message:@"....and the bubble videos be gone! \n FSVideoOnlyMessages is my first tweak. \n Follow me on Twitter if you'd like to be up to date on my learning adventure! :-) \n Changelog:\n •Follow notification only appears once now."
                                 preferredStyle:UIAlertControllerStyleAlert]; //creates popup
 
   UIAlertAction* ok = [UIAlertAction 
                        actionWithTitle:@"Follow 😊"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action) //Creates ok button
                        {  
 
                  receivedPopup = TRUE;
                  //[preferences setBool:YES forKey:@"userHasSeenTwitter"];
 
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
                            actionWithTitle:@"No Thanks! ❌"
                           style:UIAlertActionStyleDestructive
                           handler:^(UIAlertAction * action)
                           {
                            receivedPopup = TRUE; //Creates "No Thanks! " button.
                           // [preferences setBool:YES forKey:@"userHasSeenTwitter"];
 
                               [alert dismissViewControllerAnimated:YES completion:nil];
 
 
                           }];
 
   [alert addAction:ok]; //Adds the Sure! Button.
   [alert addAction:cancel]; //Adds the No Thanks Button.
 
   [self presentViewController:alert animated:YES completion:nil];
   [alert release];
   [mutableDict setValue:@NO forKey:@"firstInstall"];
   [mutableDict writeToFile:@"/var/mobile/Library/Preferences/com.nathan.fsvideomessagesprefs.plist" atomically:YES];
 
            }
            
      }
%end