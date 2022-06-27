//
//  ComposeViewController.m
//  Instagram
//
//  Created by Jocelyn Tseng on 6/27/22.
//

#import "ComposeViewController.h"

@interface ComposeViewController () <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *captionField;
@property (weak, nonatomic) IBOutlet UILabel *captionPlaceholderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.captionField.delegate = self;
    self.captionField.returnKeyType = UIReturnKeyDone;
}

- (void)initializeTaker {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
//    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    [self.postImage setImage:editedImage];
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
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

- (IBAction)uploadPhoto:(id)sender {
    NSLog(@"want to upload photo");
    [self initializeTaker];
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
