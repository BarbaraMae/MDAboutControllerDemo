//
//  MDAboutControllerViewController.m
//  MDAboutController
//
//  Created by Dimitri Bouniol on 4/18/11.
//  Copyright 2013 Mochi Development Inc. All rights reserved.
//  
//  Copyright (c) 2013 Dimitri Bouniol, Mochi Development, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software, associated artwork, and documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  1. The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//  2. Neither the name of Mochi Development, Inc. nor the names of its
//     contributors or products may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  EleMints, the EleMints Icon, Mochi Dev, and the Mochi Development logo are
//  copyright Mochi Development, Inc.
//  
//  Also, it'd be super awesome if you left in the credit line generated
//  automatically by the code that links back to this page :)
//

#import "MDAboutControllerViewController.h"

@implementation MDAboutControllerViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Check if the about controller is being shown
    if (aboutController.parentViewController == nil) {
        // Release and set to nil, so we can recreate it if we need to
        aboutController = nil;
    }
    
    if (navAboutController.parentViewController == nil) {
        navAboutController = nil;
    }
    
    if (transparentNavAboutController.parentViewController == nil) {
        transparentNavAboutController = nil;
    }
}

- (IBAction)showAbout:(id)sender
{
    // If the view controller doesn't already exist, create it
    if (!aboutController) {
        aboutController = [[MDAboutController alloc] initWithStyle:[MDACMochiDevStyle style]];
    }
    
    // Present to user!
    [self presentViewController:aboutController animated:YES completion:NULL];
}

- (IBAction)showNavAbout:(id)sender
{
    
    // If the view controller doesn't already exist, create it
    if (!navAboutController) {
        navAboutController = [[MDAboutNavigationController alloc] init];
        
        navAboutController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        navAboutController.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    // Present to user!
    [self presentViewController:navAboutController animated:YES completion:NULL];
}

- (IBAction)showTransparentNavAbout:(id)sender
{
    
    // If the view controller doesn't already exist, create it
    if (!transparentNavAboutController) {
        transparentNavAboutController = [[UINavigationController alloc] init];
        
        transparentNavAboutController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        transparentNavAboutController.modalPresentationStyle = UIModalPresentationFormSheet;
        
        transparentNavAboutController.navigationBar.translucent = YES;
        
        MDAboutController *aboutCont = [[MDAboutController alloc] init];
        
//        aboutCont.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //aboutCont.hasSimpleBackground = YES;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(hideAbout:)];
        aboutCont.navigationItem.rightBarButtonItem = doneButton;
        
        [transparentNavAboutController pushViewController:aboutCont animated:NO];
    }
    
    // Present to user!
    [self presentViewController:transparentNavAboutController animated:YES completion:NULL];
}
         
- (IBAction)hideAbout:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
