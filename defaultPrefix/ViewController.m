//
//  ViewController.m
//  defaultPrefix
//
//  Created by Gabriel Massana on 11/04/2014.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

//http://stackoverflow.com/questions/23012420

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic)  NSString *defaultPrefix;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultPrefix:) name:UITextFieldTextDidChangeNotification object:self.textField];
    
    self.defaultPrefix = @"DEFAULT";
    self.textField.text = self.defaultPrefix;
}

- (void) defaultPrefix: (NSNotification*) notification
{
    UITextField *notificationTextField = [notification object];
    
    if (notificationTextField == self.textField)
    {
        if ([self.textField.text length] <= [self.defaultPrefix length])
        {
            self.textField.text = self.defaultPrefix;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
