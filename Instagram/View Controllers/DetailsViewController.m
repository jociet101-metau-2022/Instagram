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
    
//    NSLog(self.incomingData.author);
    
    // self.incomingData is Post

//    self.authorLabel.text = self.incomingData.author.username;
    
    NSLog(@"%@", self.incomingData.createdAt);

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *originalDate = [formatter stringFromDate:self.incomingData.createdAt];
    formatter.dateFormat = @"E MMM d HH:mm:ss yyyy";
    NSDate *date = [formatter dateFromString:originalDate];

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
