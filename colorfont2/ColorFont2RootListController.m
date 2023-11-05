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

- (void)dealloc {
    [super dealloc];
}

- (void)respring{
    pid_t pid;
    int status;
    const char* args[] = { "killall", "-9", "SpringBoard", NULL };
    posix_spawn(&pid, "/var/jb/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (void)flex {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"flex://patch/ColorFont-2-iOS-7.1-10.2/app/SpringBoard/id/33926"] options:@{} completionHandler:nil];
}

- (void)github {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Lizynz/ColorFont2"] options:@{} completionHandler:nil];
}

- (void)twitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Lizynz1"] options:@{} completionHandler:nil];
}

@end
