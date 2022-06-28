//
//  DetailsViewController.h
//  Instagram
//
//  Created by Jocelyn Tseng on 6/28/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Post* incomingData;

@end

NS_ASSUME_NONNULL_END
