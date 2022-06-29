//
//  GeneralProfileViewController.h
//  Instagram
//
//  Created by Jocelyn Tseng on 6/29/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeneralProfileViewController : UIViewController

@property (strong, nonatomic) PFUser *user;

@end

NS_ASSUME_NONNULL_END
