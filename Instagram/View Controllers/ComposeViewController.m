//
//  ComposeViewController.m
//  Instagram
//
//  Created by Jocelyn Tseng on 6/27/22.
//

#import "ComposeViewController.h"

@interface ComposeViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *captionField;
@property (weak, nonatomic) IBOutlet UILabel *captionPlaceholderLabel;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.captionField.delegate = self;
    self.captionField.returnKeyType = UIReturnKeyDone;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    NSLog(@"did begin editing");
    
    self.captionPlaceholderLabel.alpha = 0;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    if ([self.captionField.text length] == 0) {
        self.captionPlaceholderLabel.alpha = 1;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }

    return YES;
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)sharePost:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
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
