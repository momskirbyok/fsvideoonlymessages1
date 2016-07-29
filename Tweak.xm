//Nathan Ingraham
// FSVideoOnlyMessages
// Instead of playing videos inline (in the bubble) in the messages app,
// this tweak will play them in full screen.



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

%hook SpringBoard


- (void)applicationDidFinishLaunching:(id)application {
  

UIAlertController *alert = [UIAlertView actionWithTitle:@"FSVideoOnlyMessages"
							//use \n, hitting enter doesn't work :p
							message:@"Thank you for installing my tweak! I hope you like it. \nFeel free to follow me on twitter  at @NathanIngraham"
							preferredStyle:UIAlertActionStyleDefault];
UIAlertAction* follow = [UIAlertAction actionWithTitle:@"Follow"
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
   UIAlertAction* decline = [UIAlertAction actionWithTitle:@"No Thanks"
                           style:UIAlertActionStyleDestructive
                           handler:^(UIAlertAction * action)
                           {


                               [alert dismissViewControllerAnimated:YES completion:nil];

                           }];

   [alert addAction:follow];
   [alert addAction:decline];

   [self presentViewController:alert animated:YES completion:nil];

 %orig;
}
%end

// %hook SBLockScreenViewController


// - (void)viewDidAppear:(_Bool)arg1;{
 

// }



