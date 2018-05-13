#include "ColorFont2RootListController.h"

#import <spawn.h>

@implementation ColorFont2RootListController {
    BOOL _settingsChanged;
}

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];

        UIBarButtonItem *respringBtn = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
        [[self navigationItem] setRightBarButtonItem:respringBtn animated:YES];
        [respringBtn release];
        }
    return _specifiers;
}

-(void)dealloc
{
    [super dealloc];
}

-(void)respring{
    
    pid_t pid;
    int status;
    const char* args[] = { "killall", "-9", "SpringBoard", NULL };
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (void)flex {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"flex://patch/ColorFont-2-iOS-7.1-10.2/app/SpringBoard/id/33926"]]; 
}

- (void)twitter {
     if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetbot:///user_profile/Lizynz1"]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitterrific:///profile?screen_name=Lizynz1"]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetings:///user?screen_name=Lizynz1"]];
    } else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=Lizynz1"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Lizynz1"]];
    }
}

@end