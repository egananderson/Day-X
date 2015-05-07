//
//  DetailViewController.m
//  DayX
//
//  Created by Owner on 5/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"
#import "Entry.h"


@interface DetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithEntryMethod:self.entry];
    
    // Do any additional setup after loading the view.
}
- (IBAction)clearButtonTapped:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
    
}
- (IBAction)saveButtonTapped:(id)sender {
//    EntryController *entryController = [EntryController new];
//    [entryController createEntryWithTitle:self.textField.text withBodyText:self.textView.text];
    
    if (self.entry == nil) {
        self.entry = [[EntryController sharedInstance] createEntryWithTitle:self.textField.text withBodyText:self.textView.text];
    }
    else{
        self.entry.title = self.textField.text;
        self.entry.bodyText = self.textView.text;
        self.entry.timestamp = [NSDate new];
    }
    
    [[EntryController sharedInstance] save];
    [self.navigationController popViewControllerAnimated:YES];

    
    //add this instance of entrycontrooler to tablview

}

- (void) updateWithEntryMethod:(Entry *)entry
{
    self.textField.text = entry.title;
    self.textView.text = entry.bodyText;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
