//
//  FriendsViewController.m
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "FriendsViewController.h"
#import "EditFriendsViewController.h"
#import "App.h"
#import "User.h"

@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    // Fix Bug #3, #4
    // Init one time the list of users
    self.users = [self allUsers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.friends = [[User currentUser] friends];
    [self.tableView reloadData];

}

// Fix Bug #3, #4 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier  isEqual: @"showEditFriends"]) {
    EditFriendsViewController *editFriendsViewController = (EditFriendsViewController *)segue.destinationViewController;
    
    // Send the list of users
    editFriendsViewController.users = self.users;
  }
}

- (NSArray *)allUsers {
  return [[App currentApp] allUsers];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    User *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

@end
