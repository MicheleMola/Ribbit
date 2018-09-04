//
//  EditFriendsViewController.h
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface EditFriendsViewController : UITableViewController

@property (nonatomic, strong) User *currentUser;

@property(nonatomic, strong) NSArray *users;

- (BOOL)isFriend:(User *)user;

@end
