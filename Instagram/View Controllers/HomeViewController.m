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
#import "PostCell.h"
#import "DetailsViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray* postArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    
    [self fetchData];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

//- (void)viewDidAppear:(BOOL)animated {
//    [self fetchData];
//}

- (void)fetchData {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    
//    [query whereKey:@"author" equalTo:PFUser.currentUser];
    [query orderByDescending:@"createdAt"];

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.postArray = posts;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        
        [self.refreshControl endRefreshing];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
        
    cell.post = self.postArray[indexPath.row];
    
    NSLog(@"%@", cell.post);
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.postArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
        myDelegate.window.rootViewController = loginViewController;
    }];
    
}

- (IBAction)didTapCompose:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:self];
}

- (void)onTimer {
    [self fetchData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString* senderType = [NSString stringWithFormat:@"%@", [sender class]];
    
    if ([senderType isEqualToString:@"PostCell"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Post* data = self.postArray[indexPath.row];
        DetailsViewController *VC = [segue destinationViewController];
        VC.incomingData = data;
    }
    
}

@end
