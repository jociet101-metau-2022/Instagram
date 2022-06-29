//
//  PostCell.m
//  Instagram
//
//  Created by Jocelyn Tseng on 6/28/22.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setPost:(Post *)post {
    
    _post = post;
    
    UIImage* img = [UIImage imageWithData:[post[@"image"] getData]];
    [self.postImageView setImage:img];
    
    PFUser *user = post.author;
    [user fetchIfNeeded];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss yyyy";
    NSString *originalDate = [formatter stringFromDate:post.createdAt];
    
    NSDate *date = [formatter dateFromString:originalDate];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *dateString = [@"\n" stringByAppendingString:[formatter stringFromDate:date]];
    
    self.captionLabel.text = [post.caption stringByAppendingString:[dateString stringByAppendingString:@"\n"]];
    self.usernameLabel.text = user.username;
}

@end
