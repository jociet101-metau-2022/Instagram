//
//  PostCell.h
//  Instagram
//
//  Created by Jocelyn Tseng on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (nonatomic, strong) Post* post;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstr;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstr;


@end

NS_ASSUME_NONNULL_END
