//
//  HomeViewController.m
//  Instagram
//
//  Created by Jocelyn Tseng on 6/27/22.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
        myDelegate.window.rootViewController = loginViewController;
        
        NSLog(@"tried to log out");
    }];
    
}

- (IBAction)didTapCompose:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:self];
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
