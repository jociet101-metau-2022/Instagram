//
//  DetailsViewController.m
//  Instagram
//
//  Created by Jocelyn Tseng on 6/28/22.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser* user = self.incomingData.author;
    [user fetchIfNeeded];

    self.authorLabel.text = user.username;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss yyyy";
    NSString *originalDate = [formatter stringFromDate:self.incomingData.createdAt];
    
    NSDate *date = [formatter dateFromString:originalDate];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    self.dateLabel.text = [formatter stringFromDate:date];

    UIImage* img = [UIImage imageWithData:[self.incomingData.image getData]];
    [self.postImageView setImage:img];
    self.captionLabel.text = self.incomingData.caption;

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
